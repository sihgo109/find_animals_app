class Users::SessionsController < Devise::SessionsController

  before_action :ensure_normal_user, only: %i[update destroy]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end