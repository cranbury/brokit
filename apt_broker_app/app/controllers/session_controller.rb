class SessionController < ApplicationController


  def new
  end

  def create
    # find if any user has that email
    user = User.find_by(email: params[:email])
    
    # if that user exists and it has a password that
    # was sent
    if user && ( user.authenticate(params[:password]) )
      # save the user_id in the session hash
      login(user)
      flash[:notice] = "Welcome back, #{@user.first_name}!"
      # and redirect to that user's home page
      redirect_to( user_path(user) )
    else
      # the email/password is wrong!
      flash[:notice] = "Failed Login. Try again."
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    authenticate!
  end

end