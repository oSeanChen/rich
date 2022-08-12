class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :article
  belongs_to :user

  validates :content, presence: true
end
