# app.rb
require 'sinatra'
require 'soundcloud'
require 'rubygems'
require 'json'

class SoundCloudApiApp < Sinatra::Base
  get '/' do
    client = Soundcloud.new(:client_id => 'API_KEY')
    playlists = client.get('/playlists', :user_id => 47611670)
    html = []

    playlists.each { |playlist| html.push(client.get('/oembed', :url => playlist.permalink_url)['html'])}

    erb :index, :locals => {:playlists => playlists, :html => html}
  end
end
