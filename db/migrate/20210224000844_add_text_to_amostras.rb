class AddTextToAmostras < ActiveRecord::Migration[6.1]
  def change
    add_column :amostras, :text, :string
  end
end
