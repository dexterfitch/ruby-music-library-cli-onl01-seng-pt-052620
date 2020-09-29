class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : song.artist
    @songs.include?(song) ? song.artist : @songs << song
  end

  def genres
    genres = []
    @songs.each do |song|
      if song.genre != nil
        genres << song.genre
      end
    end
    genres.uniq
  end
end
