# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_poptrends_session',
  :secret      => '6532364646f0b76b600401efac1b6e4f493ed0c7d1e682ecebe465205f677a041d36f4686d97aae1ec5fc40e572ec677721d72b0682a10e2d71fb96b4040db59'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
