class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
end
