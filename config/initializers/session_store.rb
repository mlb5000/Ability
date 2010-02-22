# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Ability_session',
  :secret      => '9578dff0103dc52a252616c1c54fc363e9e7701c50e39258b2412640d0774aeead18a142fc709ded7e9f7546e1c40377209b9dedec59d5ac8f76ba8d01555717'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
