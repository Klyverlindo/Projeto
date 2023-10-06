# app/models/setor.rb
class Setor < ApplicationRecord
  has_many :funcionarios
  has_many :visitantes
end
