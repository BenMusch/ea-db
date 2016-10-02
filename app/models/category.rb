class Category < ActiveRecord::Base
  has_many :categories
  has_many :articles
end
