class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if current_user
      render json: { message: 'Logged in successfully.', user: current_user }, status: :ok
    else
      render json: { error: 'Invalid email or password.' }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    if current_user
      log_out_success
    else
      log_out_failure
    end
  end

  def log_out_success
    render json: { message: "Logged out successfully." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Log out failed!" }, status: :unauthorized
  end
end
