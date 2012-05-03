class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :image

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image

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
