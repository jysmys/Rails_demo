class AddImgUrlToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :imgUrl, :string
  end
end
