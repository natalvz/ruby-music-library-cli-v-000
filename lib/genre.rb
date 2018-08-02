class Genre

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

  def self.create(genre)
    self.new(genre)
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    artists = @songs.collect { |song| song.artist}
    artists.uniq
  end

end
