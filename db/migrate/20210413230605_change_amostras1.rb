class ChangeAmostras1 < ActiveRecord::Migration[6.1]
  def change
		execute "ALTER TABLE amostras ADD COLUMN id_empresa integer;
						 ALTER TABLE amostras ADD CONSTRAINT fk_amostras_empresas FOREIGN KEY (id_empresa) REFERENCES empresas (id) MATCH FULL;
						 ALTER TABLE users ADD CONSTRAINT uk_users UNIQUE (email);"
  end
end
