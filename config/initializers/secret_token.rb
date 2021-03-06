# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# SampleApp::Application.config.secret_key_base = '401347c10d0f3f15e16382347321ba53d2f09125fed30ea083f1692d038b9812507273a2c7d1854332e9458e1670ac237cb0fc54871d11473fea8a05dd334a87'

def secure_token
	token_file = Rails.root.join('.secret')
if File.exist?(token_file)
	File.read(token_file).chomp
else
	token = SecureRandom.hex(64)
	File.write(token_file,token)
	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token