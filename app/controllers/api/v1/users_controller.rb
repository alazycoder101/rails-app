class Api::V1::UsersController < Api::V1::ApiController

  before_action :find_user, only: %w[show]

  def index
    @resources = authorize Resource.all
    render json: @resources
  end

  def show
    @user = authorize User.friendly.find(params[:id])
    render_jsonapi_response(@user)
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
