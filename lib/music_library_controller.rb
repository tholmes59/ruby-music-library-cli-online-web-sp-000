class MusicLibraryController
  
  attr_reader :path
  
  def initialize(path)
    @path = './db/mp3s/'
    # self.import
  end
  
end