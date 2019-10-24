class UsersController < ApplicationController
    before_action :define_current_user

    def create
        user = User.create(user_params)
        render json: user
    end

    def index
        render json: User.all
    end

    def show
        render json: current_user
    end



    def user_params
        params.permit(:username, :email, :password)
    end

    def define_current_user
        if params[:id]
            @current_user = User.find(params[:id])
        else
            @current_user = User.new
        end
    end
    
    def current_user
        @current_user
    end

    def spotify
        # byebug
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        spotify_token = spotify_user.credentials.token
        # byebug
        # Now you can access user's private data, create playlists and much more
    
        # Access private data
        spotify_user.country #=> "US"
        spotify_user.email   #=> "example@email.com"
        spotify_user.playlists
        byebug
        puts spotify_user.playlists
        # byebug
        # spotify_user.credentials.token
        # Create playlist in user's Spotify account
        # playlist = spotify_user.create_playlist!('my-awesome-playlist')
    
        # Add tracks to a playlist in user's Spotify account
        # tracks = RSpotify::Track.search('Know')
        # playlist.add_tracks!(tracks)
        # playlist.tracks.first.name #=> "Somebody That I Used To Know"
    
        # Access and modify user's music library
        # spotify_user.save_tracks!(tracks)
        # spotify_user.saved_tracks.size #=> 20
        # spotify_user.remove_tracks!(tracks)
    
        # albums = RSpotify::Album.search('launeddas')
        # spotify_user.save_albums!(albums)
        # spotify_user.saved_albums.size #=> 10
        # spotify_user.remove_albums!(albums)
    
        # # Use Spotify Follow features
        # # spotify_user.follow(playlist)
        # # spotify_user.follows?(artists)
        # # spotify_user.unfollow(users)
        # byebug
        # # Get user's top played artists and tracks
        # spotify_user.top_artists #=> (Artist array)
        # spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)
    
        # Check doc for more
      end
end