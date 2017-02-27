class OverviewController < ApplicationController
  before_action :fetch_users, only: [:index, :show]
  before_action :fetch_user, except: [:create_user]

  def index
    @chucknorris = JSON.parse(HTTParty.get('https://api.chucknorris.io/jokes/random').body)
  end

  def show
    render '/overview/index'
  end

  def create_user
    @user = User.new(user_params)
    @user.save
    redirect_to root_path
  end

  def who_am_i
    render partial: '/overview/user_card'
  end

  def edit_user
    render partial: '/overview/edit_user'
  end

  def save_me
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def fetch_users
    @users = User.all || []
  end

  def fetch_user
    @user = User.find_by_id(params['id'])
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :middle_name, :last_name, :role)
  end
end
