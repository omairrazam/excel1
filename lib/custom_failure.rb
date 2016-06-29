class CustomFailure < Devise::FailureApp
    def redirect_url
      if warden_message == :unconfirmed
      #custom_redirect_path
      else
        super
      end
    end

    # You need to override respond to eliminate recall
    def respond
      if http_auth?
        http_auth
      else
        redirect
      end
    end
end