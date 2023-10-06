class Ability
  include CanCan::Ability

  def initialize(user)
    if user.administrador?
      can :manage, :all
    elsif user.atendente?
      can :create, Visitante
      can :read, Visitante
    elsif user.funcionario?
      can :read, Visitante, setor_id: user.setor_id
      can :notificar_realizacao_visita, Visitante
    end
  end
end
