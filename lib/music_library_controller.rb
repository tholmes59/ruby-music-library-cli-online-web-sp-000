class MusicLibraryController
  
  attr_reader :path
  
  def initialize(path)
    MusicImporter.new(path)
    self.import
  end
  
end