class AddUserIdToArticle < ActiveRecord::Migration[6.1]
  def change
    # add_column: :articles, :user_id, :integer # 沒有索引
    add_reference :articles,:user # 會有索引，對於網站效能會有提升，對寫入變慢，因為新增就需要更新索引，但讀取變快
    # add_belongs_to: :articles, :user # 同上
  end
end