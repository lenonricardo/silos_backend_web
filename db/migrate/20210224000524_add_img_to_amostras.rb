class AddImgToAmostras < ActiveRecord::Migration[6.1]
  def change
    add_column :amostras, :img, :text
  end
end
