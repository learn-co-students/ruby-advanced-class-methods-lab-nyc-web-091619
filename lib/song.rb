class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new  #creates new instance of Song
    song.save #calls the instance method save, which shovels the new song instance 
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
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    # will return a matching song instance for that name
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(mp3_artist_and_song_name)
    # Thundercat - For Love I Come.mp3
    # name = For Love I Come
    # artist_name = Thundercat

    name_and_artist_name = mp3_artist_and_song_name.split(' - ')
    name = name_and_artist_name[1].gsub(".mp3", "")
    artist_name = name_and_artist_name[0]

    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(mp3_artist_and_song_name)
    name_and_artist_name = mp3_artist_and_song_name.split(' - ')
    name = name_and_artist_name[1].gsub(".mp3", "")
    artist_name = name_and_artist_name[0]

    song = Song.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
