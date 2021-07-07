require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create(name=nil, artist_name=nil)
    _song = self.new(name, artist_name)
    _song.save
    _song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.find_by_name(name_s)
    self.all.find{|song| song.name == name_s}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    _file = file.split(' - ')
    artist_name = _file[0]
    song_name = _file[1].split('.')[0]
    self.new(song_name, artist_name)
    # binding.pry
  end
  def self.create_from_filename(file)
    _file = file.split(' - ')
    artist_name = _file[0]
    song_name = _file[1].split('.')[0]
    self.create(song_name, artist_name)
    # binding.pry
  end
  def self.destroy_all()
    self.all.clear
  end



  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
