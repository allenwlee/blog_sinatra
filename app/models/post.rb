class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_uniqueness_of :id

  def format_date
    "#{self.created_at.month}/#{self.created_at.month}/#{self.created_at.year}"
  end
end
