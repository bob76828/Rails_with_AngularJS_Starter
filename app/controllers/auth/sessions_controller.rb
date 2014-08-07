class Auth::SessionsController < DeviseController
  before_action :ensure_params_exist,:only => [:create]

  def create
    user = user_params
    resource = User.find_by(:email => user[:email])
    if resource.valid_password?(user[:password])
      sign_in(:user, resource)
      result = {:result=> resource, :status=>true}
    else
      result = invalid_login_attempt
    end

    responder result
  end

  def is_sign
    if(user_signed_in?)
      result =  {:result=> current_user, :status=>true}
    else
      result =  {:status=>false}
    end

    responder result
  end

  def destroy
    signed_out = sign_out(:user)
    render :json=> {:result=> signed_out, :status=>true}
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    responder({:result=> "missing user parameter", :status=>false})
  end

  def invalid_login_attempt
    {:result=> "Error with your login or password", :status=>false}
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end