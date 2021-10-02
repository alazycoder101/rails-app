class Api::V1::UsersController < Api::V1::ApiController

  before_action :find_user, only: %w[show]

  def show
    render_jsonapi_response(@user)
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

end
