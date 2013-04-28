class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates_uniqueness_of :text, :on => :create

  # def replace_spaces
  #   self.text.gsub!(" ", "_")
  # end

  def self.parse(string)
    string.split(",").map do |t|
      if Tag.exists?(text: t)
        Tag.find_by_text(t) 
      else
        Tag.create(text: t)
      end 
    end
  end

end
