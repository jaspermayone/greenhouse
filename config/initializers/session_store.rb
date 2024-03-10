# FIXME: Replace "example.com" with your domain name
domain = Rails.env.production? ? ".example.com" : "localhost"

Rails.application.config.session_store :active_record_store, key: "_greenhouse_session", domain: domain
