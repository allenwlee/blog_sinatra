class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates_uniqueness_of :text

  # def replace_spaces
  #   self.text.gsub!(" ", "_")
  # end
end
