# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exists?(token_file)
		#use existing token
		File.read(token_file).chomp
	else
		#generate a new token and store it in token file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

#Lightgraphos::Application.config.secret_key_base = '42ee5d7df2de6116e96570a115d8930af4f74b01ce4447552e0150a6dc799797455686eaa6c0ee459864d76730a652f897c96fd0e88140a9e5f917ab2a809460'
Lightgraphos::Application.config.secret_key_base = secure_token
