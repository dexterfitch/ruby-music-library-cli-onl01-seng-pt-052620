class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    file = filename.split(' - ')
    song_name = file[1]
    artist_name = file[0]
    genre_name = file[2][0..-5]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    if @artist != nil
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil
      genre.add_song(self)
    end
  end
end
