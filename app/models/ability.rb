class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      # Allow users to manage their own profiles and posts only
      can :manage, User do |u|
        user.id == u.id
      end
      can :manage, Post do |p|
        user.id == p.user_id
      end
      # To explicitly allow/deny non-RESTful actions,
      # either allow the individual one here and then
      # add load_and_authorize_resource :class => :classname
      # to the top of the classnameController OR deny
      # the specific one here and then add authorize! :action, :classname
      # to the specific action
      # can :contact, :pages
    end
  end

end
