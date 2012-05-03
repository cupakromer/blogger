class Article < ActiveRecord::Base
  attr_accessible :title, :body
  attr_accessible :tag_list

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    return tags.join ", "
  end

  def tag_list= tags_string
    taggings.destroy_all

    tags_string.split(",").collect{|s| s.strip.downcase}.uniq.each do |tag_name|
      taggings.new.tag_id = Tag.find_or_create_by_name(tag_name).id
    end
  end

end
