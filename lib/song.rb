class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    newSong = Song.new
    @@all << newSong
    newSong
  end

  def self.new_by_name(name)
    newSong = Song.new
    newSong.name = name
    @@all << newSong
    newSong
  end

  def self.create_by_name(name)
    newSong = Song.new
    newSong.name = name
    @@all << newSong
    newSong
  end 

  def self.find_by_name(name)
    self.all.each do |song| 

      song.select(name)
    end

  end
  
  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

end