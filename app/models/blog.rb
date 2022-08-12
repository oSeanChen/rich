class Blog < ApplicationRecord
  acts_as_paranoid
  
  #relationship
  has_many :blog_visitors
  has_many :visitors, through: :blog_visitors, source: :user

  belongs_to :user

  #validation
  validates :handler, presence: true, uniqueness: true
  validates :title, presence: true

end
