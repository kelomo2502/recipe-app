class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  protected

  def after_sign_up_path_for(_resource)
    '/'
  end
  def after_sign_in_path_for(_resource)
    '/'
  end
  def after_sign_out_path_for(_resource)
    '/'
  end
end
