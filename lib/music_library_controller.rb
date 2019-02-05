class MusicLibraryController
  
  attr_reader :path
  
  def initialize(path = )
    MusicImporter.new(path)
   
  end
  
end