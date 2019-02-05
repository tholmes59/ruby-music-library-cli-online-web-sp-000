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
    artist, song, genre = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    name.(artist, song, genre)
    # split_name = filename.split(" - ")
    # song = self.new(split_name[1])
    # artist = Artist.find_or_create_by_name(split_name[0])
    # genre = Genre.find_or_create_by_name(split_name[2])
    # song.artist = artist
    # song.genre = genre
    # artist.add_song(song)
    # genre.add_song(song)
    # song
  end

end

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
