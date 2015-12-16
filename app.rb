# app.rb
require 'sinatra'
require 'soundcloud'
require 'rubygems'
require 'json'

class SoundCloudApiApp < Sinatra::Base
  get '/' do
    client = Soundcloud.new(:client_id => 'CLIENT_ID')
    playlists = client.get('/playlists', :user_id => 171442550)
    html = []

    playlists.each { |playlist| html.push(client.get('/oembed', :url => playlist.permalink_url)['html']) }
    html.each {|embed|
      puts embed
      embed.sub! 'true', 'false'
      embed.sub! '">', '&color=000000&show_playcount=false&sharing=false&download=false&show_user=false">'
      puts embed
    }
    erb :index, :locals => {:playlists => playlists, :html => html}
  end
end
