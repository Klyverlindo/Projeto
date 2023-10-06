class AddDateTimeToVisitantes < ActiveRecord::Migration[7.0]
  def change
    add_column :visitantes, :data_hora_visita, :datetime
  end
end
