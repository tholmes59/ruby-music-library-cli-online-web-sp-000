require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
      new(name).tap {|artist| artist.save}
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end 
  
  def genres
    songs.map {|song| song.genre}.uniq
  end
  
end

