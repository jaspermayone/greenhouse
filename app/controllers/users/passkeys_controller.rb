class Users::PasskeysController < ApplicationController
  def new
    # Generate and store the WebAuthn User ID the first time the user registers a credential
    if !user.webauthn_id
      user.update!(webauthn_id: WebAuthn.generate_user_id)
    end

    options = WebAuthn::Credential.options_for_create(
      user: {id: user.webauthn_id, name: user.email},
      exclude: user.credentials.map { |c| c.webauthn_id }
    )

    # Store the newly generated challenge somewhere so you can have it
    # for the verification phase.
    session[:creation_challenge] = options.challenge

    # Send `options` back to the browser, so that they can be used
    # to call `navigator.credentials.create({ "publicKey": options })`
    #
    # You can call `options.as_json` to get a ruby hash with a JSON representation if needed.

    # If inside a Rails controller, `render json: options` will just work.
    # I.e. it will encode and convert the options to JSON automatically.

    # For your frontend code, you might find @github/webauthn-json npm package useful.
    # Especially for handling the necessary decoding of the options, and sending the
    # `PublicKeyCredential` object back to the server.
    #
    # TODO: Pass to javascript somehow
  end

  def destroy
    # TODO: Actually delete the passkey
  end
end
