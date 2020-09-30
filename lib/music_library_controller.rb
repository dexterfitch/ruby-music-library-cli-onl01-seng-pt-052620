class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    response = ""

    while response != "exit"
      response = gets.chomp.downcase
      case response
<<<<<<< HEAD
      when "list songs"
        list_songs
        break
      when "list artists"
        list_artists
        break
      when "list genres"
        list_genres
        break
      when "list artist"
        list_songs_by_artist
        break
      when "list genre"
        list_songs_by_genre
        break
      when "play song"
        play_song
        break
      when "exit"
=======
      when response == "list songs"
      when response == "list artists"
      when response == "list genres"
      when response == "list artist"
      when response == "list genre"
      when response == "play song"
      when response == "exit"
>>>>>>> cf752401fbed1d3cd6315558d8d4c9d55a4e8e26
        break
      end
    end
  end

<<<<<<< HEAD
  def list_songs
    i = 0
    songs = Song.all.sort_by { |song| song.name }
    songs.each do |song|
      i += 1
      puts i.to_s + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
    end
  end

  def list_artists
    i = 0
    artists = Artist.all.sort_by { |artist| artist.name }
    artists.each do |artist|
      i += 1
      puts i.to_s + ". " + artist.name
    end
  end

  def list_genres
    i = 0
    genres = Genre.all.sort_by { |genre| genre.name }
    genres.each do |genre|
      i += 1
      puts i.to_s + ". " + genre.name
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets.chomp
    artist = Artist.find_by_name(response)
    if artist
      i = 0
      songs = artist.songs.sort_by { |song| song.name }
      songs.each do |song|
        i += 1
        puts i.to_s + ". " + song.name + " - " + song.genre.name
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets.chomp
    genre = Genre.find_by_name(response)
    if genre
      i = 0
      songs = genre.songs.sort_by { |song| song.name }
      songs.each do |song|
        i += 1
        puts i.to_s + ". " + song.artist.name + " - " + song.name
      end
    end
   end

  def play_song
    puts "Which song number would you like to play?"
    songs = Song.all.sort_by { |song| song.name }
    response = gets.chomp.to_i
    if response <= Song.all.length && response > 0
      response -= 1
      chosen_song = songs[response]
      puts "Playing " + chosen_song.name + " by " + chosen_song.artist.name
    end
  end

=======
>>>>>>> cf752401fbed1d3cd6315558d8d4c9d55a4e8e26
end
