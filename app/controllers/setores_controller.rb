# app/controllers/setores_controller.rb
class SetoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @setores = Setor.all
  end

  def show
    @setor = Setor.find(params[:id])
  end

  def new
    @setor = Setor.new
  end

  def create
    @setor = Setor.new(setor_params)
    if @setor.save
      redirect_to @setor, notice: 'Setor criado com sucesso.'
    else
      render :new
    end
  end

  private

  def setor_params
    params.require(:setor).permit(:nome)
  end
end
