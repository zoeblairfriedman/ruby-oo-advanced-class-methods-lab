require 'pry'

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
    new_song = self.new
      @@all << new_song
      new_song
  end

  def self.new_by_name(name_string)
    new_song = self.new
    new_song.name=(name_string)
    new_song
  end

  def self.create_by_name(name_string)
    new_song = self.create
    new_song.name=(name_string)
    new_song
  end

  def self.find_by_name(name_string) 
      @@all.find{|song| song.name == name_string}  
  end

  def self.find_or_create_by_name(name_string)
    if !self.find_by_name(name_string)
      self.create_by_name(name_string)
    else
      self.find_by_name(name_string)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song|song.name} 
  end

  def self.new_from_filename(file)
    song_array = file.split(" - ")
    artist = song_array[0]
    song_name = song_array[1].split(".").shift
    new_song = self.new_by_name(song_name)
    new_song.artist_name=(artist)
    new_song
  end

  def self.create_from_filename(file)
    song_array = file.split(" - ")
    artist = song_array[0]
    song_name = song_array[1].split(".").shift
    new_song = self.create_by_name(song_name)
    new_song.artist_name=(artist)
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
  
end
