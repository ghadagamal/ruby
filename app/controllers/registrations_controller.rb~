class RegistrationsController < Devise::RegistrationsController
private

  def sign_up_params
    params.require(:user).permit(:name, :email, :attachment, :gender, :password, :password_confirmation ,:bod)
  end
end

