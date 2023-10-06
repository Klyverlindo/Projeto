class CreateVisitantes < ActiveRecord::Migration[7.0]
  def change
    create_table :visitantes do |t|
      t.string :cpf
      t.string :nome
      t.string :rg
      t.string :telefone
      t.string :foto
      t.references :setor, null: false, foreign_key: true
      t.references :funcionario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
