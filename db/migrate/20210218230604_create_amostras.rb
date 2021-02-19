class CreateAmostras < ActiveRecord::Migration[6.1]
  def change
    create_table :amostras do |t|
      t.string :json

      t.timestamps
    end
  end
end
