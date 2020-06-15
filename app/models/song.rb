class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes_ids=(ids)
    ids.each do |content|
      self.notes << Note.create(content: content)
    end
  end

  def song_notes_ids
    self.notes.collect {|note| note }
  end
end
