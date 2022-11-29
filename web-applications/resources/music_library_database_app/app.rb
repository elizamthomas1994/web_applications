# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/album'
require_relative 'lib/artist'
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/albums' do
    repo = AlbumRepository.new
    @albums = repo.all
    return erb(:albums)
  end

  get '/artists' do
    repo = ArtistRepository.new
    artists = repo.all

    response = artists.map do |artist|
      artist.name
    end.join(', ')
    
    return response
  end  

  post '/albums' do
    repo = AlbumRepository.new
    title = params[:title]
    release_year = params[:release_year]
    artist_id = params[:artist_id]

    album = Album.new
    album.title = title
    album.release_year = release_year
    album.artist_id = artist_id

   
    repo.create(album)
  end

  post '/artists' do
    name = params[:name]
    genre = params[:genre]

    artist = Artist.new
    artist.name = name
    artist.genre = genre

    repo = ArtistRepository.new
    repo.create(artist)
  end

  get '/albums/:id' do
    id = params[:id]
    repo = AlbumRepository.new
    artist_repository = ArtistRepository.new 
    @album = repo.find(params[:id])
    @artist = artist_repository.find(@album.artist_id)
    return erb(:album_id)
  end 
end