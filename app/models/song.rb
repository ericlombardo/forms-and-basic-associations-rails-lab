class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes


  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(notes) # take any notes and build them already linked to song
    notes.each {|n| self.notes.build(content: n)} unless notes.all?("")
  end
end

# Had this, but it is taken care of with active record
# def genre_id=(genre_id)
#   self.genre = Genre.find_by_id(genre_id)
# end

# def genre_id
#   self.genre ? self.genre.name : nil 
# end
