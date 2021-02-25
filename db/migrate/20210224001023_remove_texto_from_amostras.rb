class RemoveTextoFromAmostras < ActiveRecord::Migration[6.1]
  def change
    remove_column :amostras, :texto, :string
  end
end
