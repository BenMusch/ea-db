class Author < ActiveRecord::Base
  has_many :authorings
  has_many :articles, through: :authorings
end
