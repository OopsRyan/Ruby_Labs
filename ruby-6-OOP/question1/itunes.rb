#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'
require_relative 'pred'
require_relative 'data'

songs_file = ARGV[0].nil? ? 'songs.csv' : ARGV[0]                  #for command line
owners_file = ARGV[1].nil? ? 'owners.csv' : ARGV[1]                 #for command line

reader = Reader.new
# songs_file = 'songs.csv'             #in RubyMine
# owners_file = 'owners.csv'           #in RubyMine
data = DataBit.new

puts "\nProcessing Songs from file: #{songs_file}"
data.songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
data.hash_owners = reader.read_in_ownership(owners_file)

puts "Building all owners..."
data.actors = Actor.build_all(data)

puts "Updating songs with ownership details..."
data.songs.each do |song|
	if !data.hash_owners[song.id.to_i].nil? then
		song.owners = data.hash_owners[song.id.to_i]
	end
end	

puts "Building All Albums..."
data.albums = Album.build_all(data.songs)
# puts albums

# puts "Building a album by name"
# album = Album.build_an_album_called(songs, "Paradise")

# # Given the name of a song and a person; let them buy the song
puts "\nQirun buys No Tears..."
fetched_song = Util.fetch("No Tears", data)
fetched_actor = Util.fetch("Qirun", data)
fetched_song.to_s
fetched_actor.to_s
fetched_actor.buys_song(fetched_song)
fetched_song.to_s

# # What songs does Qirun own
puts "\nHow many songs does Qirun own..."
p fetched_actor.what_songs_does_he_own(data.songs)

# puts "\nPlay The Cure..."
fetched_song.play_song

# # Print out all songs
puts "\nPrinting full details of all songs..."
data.songs.each{|song| p song}

# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv


