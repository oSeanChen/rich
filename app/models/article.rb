class Article < ApplicationRecord
  #驗證寫在model
  validates :title, presence: true
end
