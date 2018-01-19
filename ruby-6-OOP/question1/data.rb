class DataBit
  attr_accessor :songs, :albums, :actors, :hash_owners
  def initialize()
    @songs = []
    @albums = []
    @actors = []
    @hash_owners = Hash.new
  end

  def songs=(songs)
    @songs = songs
  end

  def albums=(albums)
    @albums = albums
  end

  def actors=(actors)
    @actors = actors
  end

  def hash_owners=(hash_owners)
    @hash_owners = hash_owners
  end
end