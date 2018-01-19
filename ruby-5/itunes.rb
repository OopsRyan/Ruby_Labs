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

songs_file = ARGV[0].nil? ? 'songs.csv' : ARGV[0]                  #for command line
owners_file = ARGV[1].nil? ? 'owners.csv' : ARGV[1]                 #for command line

reader = Reader.new
# songs_file = 'songs.csv'             #in RubyMine
# owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
hash_owners = reader.read_in_ownership(owners_file)

puts "Building all owners..."
actors = Actor.build_all(hash_owners)

puts "Updating songs with ownership details..."
songs.each do |song|
	if !hash_owners[song.id.to_i].nil? then  
		song.owners = hash_owners[song.id.to_i]
	end
end	

puts "Building All Albums..."
albums = Album.build_all(songs)
# puts albums

# puts "Building a album by name"
# album = Album.build_an_album_called(songs, "Paradise")

# # Given the name of a song and a person; let them buy the song
puts "\nQirun buys No Tears..."
fetched_song = Util.fetch("No Tears", songs, actors, albums)
fetched_actor = Util.fetch("Qirun", songs, actors, albums)
fetched_song.to_s
fetched_actor.to_s
fetched_actor.buys_song(fetched_song)
fetched_song.to_s

# # What songs does Qirun own
puts "\nHow many songs does Qirun own..."
p fetched_actor.what_songs_does_he_own(songs)

# puts "\nPlay The Cure..."
fetched_song.play_song

# # Print out all songs
puts "\nPrinting full details of all songs..."
songs.each{|song| p song}

# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv

