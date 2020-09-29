module Concerns::Findable

  def find_by_name(name)
    self.all.find do |music_object|
      if name.downcase == music_object.name.downcase
        return music_object
      end
    end
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create(name)
    end
  end

end
