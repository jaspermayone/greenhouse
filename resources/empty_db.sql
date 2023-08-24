-- Drop views that may depend
DO $$
DECLARE
    SQL text;
BEGIN
    SELECT string_agg('DROP VIEW IF EXISTS ' || schemaname || '.' || viewname || ' CASCADE;', ' ')
    INTO SQL
    FROM pg_views
    WHERE schemaname = 'public';

    IF SQL IS NOT NULL THEN
        EXECUTE SQL;
    ELSE
        RAISE NOTICE 'No views found. Nothing dropped.';
    END IF;
END $$;

-- Drop trigger if it exists
DROP TRIGGER IF EXISTS validate_roles_trigger ON public.users;

-- Drop function if it exists
DROP FUNCTION IF EXISTS validate_roles() CASCADE;

-- Drop tables if they exist
DROP TABLE IF EXISTS public.users CASCADE;
DROP TABLE IF EXISTS public.data CASCADE;

-- Create the 'users' table to store user information
CREATE TABLE public.users (
    id serial PRIMARY KEY NOT NULL, -- Unique identifier for each user
    email text NOT NULL, -- The email address associated with the user
    password text NOT NULL, -- The hashed password for user authentication
    roles JSONB NOT NULL CHECK (roles ?| array['reporter', 'content_admin']), -- Roles assigned to the user, stored as JSON array
    CONSTRAINT "users_email" UNIQUE ("email") -- Constraint to ensure Email uniqueness
);

-- Add comments to the columns of the 'users' table
COMMENT ON COLUMN public.users.id IS 'Unique identifier for each user';
COMMENT ON COLUMN public.users.email IS 'The email address associated with the user';
COMMENT ON COLUMN public.users.password IS 'The hashed password for user authentication';
COMMENT ON COLUMN public.users.roles IS 'Roles assigned to the user, stored as JSON array';


-- Create the 'data' table to store data information
CREATE TABLE public.data (
    id serial PRIMARY KEY NOT NULL, -- Unique identifier for each data entry
    uid uuid NOT NULL, -- Universally unique identifier for data entry
    submitted_at timestamp NOT NULL, -- Timestamp of when the data was submitted
    last_updated_at timestamp NOT NULL, -- Timestamp of the last update to the data
    submitted_by int NOT NULL, -- The ID of the user who submitted the data
    responsible_admin int NOT NULL, -- The ID of the admin responsible for the data.
    data jsonb NOT NULL, -- JSON data associated with the entry
    CONSTRAINT "data_uid" UNIQUE ("uid"), -- Constraint to ensure UID uniqueness
    CONSTRAINT fk_submitted_by FOREIGN KEY (submitted_by) REFERENCES public.users(id),
    CONSTRAINT fk_responsible_admin FOREIGN KEY (responsible_admin) REFERENCES public.users(id)
);

-- Add comments to the columns of the 'data' table
COMMENT ON COLUMN public.data.id IS 'Unique identifier for each data entry';
COMMENT ON COLUMN public.data.uid IS 'Universally unique identifier for data entry';
COMMENT ON COLUMN public.data.submitted_at IS 'Timestamp of when the data was submitted';
COMMENT ON COLUMN public.data.last_updated_at IS 'Timestamp of the last update to the data';
COMMENT ON COLUMN public.data.submitted_by IS 'The ID of the user who submitted the data';
COMMENT ON COLUMN public.data.responsible_admin IS 'The ID of the admin responsible for the data.';
COMMENT ON COLUMN public.data.data IS 'JSON data associated with the entry';


-- Create function to validate roles
CREATE OR REPLACE FUNCTION validate_roles() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.roles IS NOT NULL THEN
        IF NOT (NEW.roles ?| array['reporter', 'content_admin']) THEN
            RAISE EXCEPTION 'Invalid roles';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validate_data_roles() RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.submitted_by IS NOT NULL) THEN
        IF NOT (SELECT roles @> '["reporter"]' FROM public.users WHERE id = NEW.submitted_by) THEN
            RAISE EXCEPTION 'Invalid role for submitted_by user';
        END IF;
    END IF;

    IF (NEW.responsible_admin IS NOT NULL) THEN
        IF NOT (SELECT roles @> '["content_admin"]' FROM public.users WHERE id = NEW.responsible_admin) THEN
            RAISE EXCEPTION 'Invalid role for responsible_admin user';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to execute role validation on insert or update
CREATE TRIGGER validate_roles_trigger
BEFORE INSERT OR UPDATE ON public.users
FOR EACH ROW EXECUTE FUNCTION validate_roles();

-- Create trigger to execute data role validation on insert or update
CREATE TRIGGER validate_data_roles_trigger
BEFORE INSERT OR UPDATE ON public.data
FOR EACH ROW EXECUTE FUNCTION validate_data_roles();