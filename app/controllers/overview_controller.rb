class OverviewController < ApplicationController
  def index
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
end
