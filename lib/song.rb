require 'pry'
class Song 
  
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) 
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self  unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end 
  
  def save
    self.class.all << self
  end
  
   def self.create(name)
      new(name).tap {|song| song.save}
  end
  
  def self.find_by_name(name)
      all.find {|song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end
  
  def self.new_from_filename(filename)
    artist, song, genre_with_mp3 = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre_without_mp3 = genre_with_mp3.gsub('.mp3', '')
    genre = Genre.find_or_create_by_name(genre_without_mp3)
    new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end 

end

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
