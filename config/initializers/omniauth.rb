OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1973951366220686', '640de0f44e8d9ec79af4eccf6661b10c', scope: 'email', info_fields: 'email,first_name,last_name'
end