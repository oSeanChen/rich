class Article < ApplicationRecord
  acts_as_paranoid
  #relationships
  belongs_to :user
  has_many :comments
  has_many :like_articles
  has_many :users, through: :like_articles
  #validaiton
  validates :title, presence: true



  # 假刪除處理 
  # scope :available, -> { where(deleted_at: nil) } 
  # lambda, Callback function
  
  # default scope 不管要不要都會找，這樣就可以在任何地方都只顯示沒被刪除的，有需要查找到已刪除的需要unscope去取消預設
  # default_scope { where(deleted_at: nil) }
  
  # def self.available 
    # 如果有比較多邏輯運算寫這種
    # 可以把所有商業運作邏輯用在model這裡
    # ex 之後想找出所有同類型可以在這邊運作
    # where(deleted_at: nil)
  # end

  # def destroy
  #   update(deleted_at: Time.now)
  # end
end
