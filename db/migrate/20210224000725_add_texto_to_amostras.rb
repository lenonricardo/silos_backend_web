class AddTextoToAmostras < ActiveRecord::Migration[6.1]
  def change
    add_column :amostras, :texto, :string
  end
end
