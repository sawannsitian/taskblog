OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '458472547859-afr1781j345a4v1bfnft0h5smknm91f7.apps.googleusercontent.com', 'TV46qxicK5UQ7qHSmTTgU9YL', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}

  #provider :google_oauth2, ENV["458472547859-afr1781j345a4v1bfnft0h5smknm91f7.apps.googleusercontent.com"], ENV["TV46qxicK5UQ7qHSmTTgU9YL"]
end

Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
  end
  provider :facebook, '1039541579405000', '918588f713804658938787244d2af593', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

Rails.application.config.middleware.use OmniAuth::Builder do
   provider :twitter, 'APzVjtqsWmAtJPNt6V6ROlZC4', 'bKttP4yehlc58grurG7cIXygTm9hBb1POyCnzW3cLe3h8VjMrC'
end