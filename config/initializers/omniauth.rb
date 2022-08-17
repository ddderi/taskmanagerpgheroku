Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.credentials.dig(:GOOGLE_CLIENT_ID), Rails.application.credentials.dig(:GOOGLE_CLIENT_SECRET)
# OmniAuth.config.allowed_request_methods = %i[get]
end
# OmniAuth.config.allowed_request_methods = %i[get]