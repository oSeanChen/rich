class RenameColSubToTitle < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :subject, :title 
  end
end
