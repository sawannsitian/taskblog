class SessionsController < ApplicationController
  def new
  end

  def create
  	if params[:password] && params[:email]
   	  user = User.where("email = '#{params[:email]}'").first.try(:active) ? User.authenticate(params[:email], params[:password]) : nil
    else
      user = User.from_omniauth(env["omniauth.auth"])
    end
    
	  if user
	    session[:user_id] = user.id
	    redirect_to :controller => 'tasklists', :action => 'index'
	  else
	    flash[:notice] = "You Have Entered Wrong Name And Password or You are Blocked by Admin"
	    render "new"
	  end
  end

  def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
  end
end
