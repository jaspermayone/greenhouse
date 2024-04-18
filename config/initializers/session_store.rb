domain = Rails.env.production? ? ".greenhouse.directory" : "localhost"

Rails.application.config.session_store :active_record_store, key: "_greenhouse_session", domain: domain
