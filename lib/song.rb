class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    songs = self.all.sort_by do |song|
      song.name
    end
    # binding.pry
    songs
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_name = song_info[1].split(".")
    song = self.new_by_name(song_name[0])
    song.artist_name = song_info[0]
    # binding.pry
    song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")
    song_name = song_info[1].split(".")
    song = self.create_by_name(song_name[0])
    song.artist_name = song_info[0]
    # binding.pry
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end