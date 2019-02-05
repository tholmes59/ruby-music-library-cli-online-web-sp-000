require_relative './concerns/findable.rb'

class Genre
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
    new(name).tap {|genre| genre.save}
  end
  
  def artists
    songs.map {|song| song.artist}.uniq
  end
  
end

