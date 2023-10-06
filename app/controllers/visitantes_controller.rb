# app/controllers/visitantes_controller.rb
class VisitantesController < ApplicationController

  before_action :authenticate_user! # Verifica se o usuário está autenticado

  def index
    @visitantes = Visitante.all
  end

  def show
    @visitante = Visitante.find(params[:id])
  end

   def new
    @visitante = Visitante.new
  end

  def create
    @visitante = Visitante.new(visitante_params)
    @visitante.data_hora_visita = Time.current # Define a data e a hora da visita como o momento atual

    if @visitante.save
      redirect_to @visitante, notice: 'Visitante criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @visitante = Visitante.find(params[:id])
  end

  def update
    @visitante = Visitante.find(params[:id])
    if @visitante.update(visitante_params)
      redirect_to @visitante, notice: 'Visitante atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @visitante = Visitante.find(params[:id])
    @visitante.destroy
    redirect_to visitantes_path, notice: 'Visitante excluído com sucesso.'
  end

  private

  def visitante_params
    params.require(:visitante).permit(:cpf, :nome, :rg, :telefone, :foto, :setor_id, :funcionario_id)
  end

  def consultar
    cpf = params[:cpf]
    @visitantes = Visitante.where(cpf: cpf)

    if @visitantes.empty?
      flash.now[:alert] = 'Nenhum visitante encontrado com este CPF.'
    end

    render :consulta_resultados
  end



end
