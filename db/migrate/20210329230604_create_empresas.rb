class CreateEmpresas < ActiveRecord::Migration[6.1]
  def change
		execute " CREATE TABLE empresas (
								id serial primary key,
								razao_social varchar(255) not null,
								cnpj varchar(14) not null,
								logradouro varchar(255),
								bairro varchar(255),
								cep integer,
								telefone varchar(20),
								img_logo text
							);

							CREATE TABLE users_empresas (
								id_user integer,
								id_empresa integer,
								CONSTRAINT fk_users_empresas_users FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE ON UPDATE NO ACTION,
								CONSTRAINT fk_users_empresas_empresas FOREIGN KEY (id_empresa) REFERENCES empresas(id) ON DELETE CASCADE ON UPDATE NO ACTION
							);
							"
  end
end
