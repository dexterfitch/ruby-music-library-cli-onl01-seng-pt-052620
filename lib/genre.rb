class Genre
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
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
    song.genre == nil ? song.genre = self : song.genre
    @songs.include?(song) ? song.genre : @songs << song
  end

  def artists
    artists = []
    @songs.each do |song|
      if song.artist != nil
        artists << song.artist
      end
    end
    artists.uniq
  end
end
