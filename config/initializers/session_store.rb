# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nerddinner_session',
  :secret      => '5b9c7424a8961388aeab0601a06019a0a0875fdc6742cf0fc5d404c1a2b337cb406c72ca3378ed161d12655cc5f5ee3689f19cbebaad309fcaa267a0b60bcb9a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
