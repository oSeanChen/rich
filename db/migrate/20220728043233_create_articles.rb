#migrate 是資料庫的描述
class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content

      #寫入時間戳記，包含兩個欄位
      t.timestamps
      #created_at
      #updated_at
    end
  end
end
