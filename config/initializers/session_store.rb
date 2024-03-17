domain = Rails.env.production? ? ".greenhouse.obl.ong" : "localhost"

Rails.application.config.session_store :active_record_store, key: "_greenhouse_session", domain: domain
