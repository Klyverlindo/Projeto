# app/controllers/usuarios_controller.rb
class UsuariosController < ApplicationController
  before_action :authenticate_user!

  def index
    @usuarios = User.all
  end

  def new
    @usuario = User.new
  end

  def create
    @usuario = User.new(usuario_params)
    if @usuario.save
      redirect_to usuarios_path, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @usuario = User.find(params[:id])
  end

  def update
    @usuario = User.find(params[:id])
    if @usuario.update(usuario_params)
      redirect_to usuarios_path, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def usuario_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
