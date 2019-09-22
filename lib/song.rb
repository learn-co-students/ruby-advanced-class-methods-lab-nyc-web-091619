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

  # def self.find_by_name(name)
  #   self.all.each do |song| 
  #     song.select(name)
  #   end
  # end
  
  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) 
      self.find_by_name(title) 
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }   # use the object sorting 
  end

  def self.new_from_filename(filename)
    song_title_without_dash = filename.split('-')
    band = song_title_without_dash[0].strip
    title = song_title_without_dash[1].strip
    title = File.basename(title,".mp3")
    song = self.create_by_name(title)
    song.artist_name=band
    song
  end

  def self.create_from_filename(filename)
    song_title_without_dash = filename.split('-')
    band = song_title_without_dash[0].strip
    title = song_title_without_dash[1].strip
    title = File.basename(title,".mp3")
    song = self.create_by_name(title)
    song.artist_name=band
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end