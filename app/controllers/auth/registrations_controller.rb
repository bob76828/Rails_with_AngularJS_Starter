class Auth::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist,:only => [:create]

  def create
    user = User.new(user_params)
    if user.save
      result = {:result=> user, :status=>true}
    else
      warden.custom_failure!
      result = {:result=> user.errors, :status=>false}
    end
    responder result
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    responder({:result=> "missing user parameter", :status=>false})
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end

end