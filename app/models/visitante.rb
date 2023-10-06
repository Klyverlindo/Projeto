# app/models/visitante.rb
class Visitante < ApplicationRecord
  belongs_to :setor, optional: true
  belongs_to :funcionario, optional: true
end
