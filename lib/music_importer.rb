class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    Dir[@path + '/*.mp3'].each do |mp3|
      @files << mp3.gsub(@path + "/", "")
    end
    @files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
