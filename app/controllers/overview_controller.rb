class OverviewController < ApplicationController
  def index
    raise_404 if route_toggled_off
    @users = User.all || []
    @chucknorris = JSON.parse(HTTParty.get('https://api.chucknorris.io/jokes/random').body)
  end

  def create_user
    @user = User.new(user_params)
    @user.save
    redirect_to root_path
  end

  def who_am_i
    @user = User.find_by_id(params['id'])
    render json: @user
  end

  def edit_user
    @user = User.find_by_id(params['id'])
    render partial: '/overview/edit_user'
  end

  def save_me
    @user = User.find_by_id(user_params['id'])
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :middle_name, :last_name, :role)
  end

  def route_toggled_off
    new_route_off || old_route_off
  end

  def new_route_off
    new_routes = [ '/users' ]
    !Flip.restful_routes? && new_routes.include?(request.path)
  end

  def old_route_off
    old_routes = [ '/overview/index' ]
    Flip.restful_routes? && old_routes.include?(request.path)
  end

  def raise_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
