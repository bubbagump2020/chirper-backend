require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "7d4d9ab4d46642b38d1d64b596d176fa", "bf17e26133fe41a8b8c273d9f8f5b630", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify', redirect_uri: "http://localhost:3001/auth/spotify/callback"
end