class Artist

  attr_accessor :name, :songs

  @@all = []
  extend Concerns::Findable


  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist)
    self.new(artist)
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    genres = @songs.collect { |song| song.genre}
    genres.uniq
  end

  def self:find_by_name
  end
end
