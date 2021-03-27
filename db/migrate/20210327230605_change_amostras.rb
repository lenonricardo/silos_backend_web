class ChangeAmostras < ActiveRecord::Migration[6.1]
  def change
		execute "ALTER TABLE amostras RENAME COLUMN text TO descricao;
						 ALTER TABLE amostras ADD COLUMN id_user integer;
						 ALTER TABLE amostras ADD CONSTRAINT fk_amostras_users FOREIGN KEY (id_user) REFERENCES users (id) MATCH FULL;
						 UPDATE amostras SET id_user = (select id from users where name = 'master');"
  end
end
