require 'soundcloud'

# create a client object with your app credentials
client = Soundcloud.new(:client_id => '7b3ffafa3f7935de252dd19b7d194ec3')

# find all sounds of buskers licensed under 'creative commons share alike'
tracks = client.get('/playlists', :user_id => 47611670)

tracks.each { |track| puts "<a href='#{track.permalink_url}' class='sc-player'>Tracks</a>"}
