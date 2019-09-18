class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new()
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    @@all << song
    song
  
  end

  def self.all
    @@all
  end

  

  def self.find_by_name(name_to_find)
    @@all.find do |song|
      song.name == name_to_find
    end
  end

  def self.find_or_create_by_name(name_to_check)
    song = self.find_by_name(name_to_check)
    song ||= self.create_by_name(name_to_check)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

    #I feel like this could be a private method?
  def parse_filename(filename)
    song_info = filename.split(/ - /) #split the filename in two
    song_info[1] = song_info[1].split('.mp3')[0] #drop '.mp3' from the name
    song_info
  end

  def self.new_from_filename(filename)
    song = self.new #create a song
    song_info = song.parse_filename(filename)
    song.artist_name = song_info[0] #the part before the ' - ' is the artist
    song.name = song_info[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
