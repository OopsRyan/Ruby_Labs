#!/usr/bin/ruby -w
# ALBUM
# Copyright Mark Keane, All Rights Reserved, 2014

# Class that encodes details of an album.
class Album
	attr_accessor :name, :tracks, :length, :artist,:owners, :id
	def initialize(name, tracks, length, artist, owners)
		@name = name
		@tracks = tracks
		@length = length
		@artist = artist
		@owners = owners
		@id = name.object_id
	end

	# Method that prints out the contents of an album object nicely.
	def to_s
		puts "The album #{@name} by #{@artist.join(", ")}. \n"
	end	

	# Method that checks if an object given to it is an album.
	def isa?
		instance_of?(Album)
	end

	# Method makes an album object; just uses Album.new; really
	# just being a bit explicit and obvious.
	def self.make_album(name,tracks, length, artist, owners)
		Album.new(name, tracks, length, artist, owners)
	end

	# Class Method that builds albums from song object's contents.
	# It returns an array of album objects.  It calls another class method that
	# builds a single album, given the name of that album.
	# parameters: albums
	def self.build_all(songs, albums = [])
		album_names = []
		songs.each{|song| album_names << song.album}
		album_names.uniq!.each do |album_name|
			tracks = []
			owners = []	
			artist = []
			length = 0.to_f
			songs.select{|song| song.album == album_name}.each do |song|
				tracks << song 
				owners << song.owners
				artist << song.artist
				length += song.time.to_f
			end
			albums << Album.make_album(album_name, tracks.uniq, length, artist.uniq, owners.uniq)
		end
		albums
	end

	# Class method that takes an album name, it finds all the sounds that are in that album
	# builds up arrays of the song-names (tracks), runtimes, artist names.  These all get used
	# to populate the various attributes of the album object.
	def self.build_an_album_called(songs, album_name)
		tracks = []
		owners = []
		artist = []
		length = 0.to_f	
		songs.select {|song| song.album == album_name}.each do |song|
			tracks << song
			owners << song.owners
			artist << song.artist
			length += song.time.to_f
		end
		Album.make_album(album_name, tracks.uniq, length, artist.uniq, owners.uniq)
	end
end
