# app/controllers/funcionarios_controller.rb
class FuncionariosController < ApplicationController
  before_action :authenticate_user!

  def index
    @funcionarios = Funcionario.all
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      redirect_to @funcionario, notice: 'Funcionário criado com sucesso.'
    else
      render :new
    end
  end

  private

  def funcionario_params
    params.require(:funcionario).permit(:nome, :setor_id)
  end
end
