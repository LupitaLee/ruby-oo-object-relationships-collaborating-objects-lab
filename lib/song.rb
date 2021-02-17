require "pry"
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)  # creates a new instance of a song from the file that's passed
        # binding.pry
        song = filename.split(" - ") #splits into an array
        song_name = song[1]  # calls the second index
        new_song = self.new(song_name) #calls / create song_name
        artist = song[0]        #associates new song instance with the artist from the filename
        new_song.artist_name = artist
        new_song
    end
    

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name) # accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
    end
  end


