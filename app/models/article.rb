class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :subcategory
  belongs_to :category
  belongs_to :media_type
  has_many :authorings
  has_many :authors, through: :authorings
  has_many :taggings
  has_many :tags, through: :taggings
end
