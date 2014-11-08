class UsersController < ApplicationController

  before_filter :confirm_logged_in, :only => [:index, :show, :edit, :destroy]

  load_and_authorize_resource
  skip_authorize_resource :only => :update
  
  def index
    @users = User.all unless request.xhr?
    @data_collection_user = User.data_collection
    @hash = Gmaps4rails.build_markers(@data_collection_user) do |user, marker|
      marker.lat user.lat.to_f
      marker.lng user.long.to_f
    end
  end

  def show
    
  end

  def new
    
  end


  def edit
    
  end

  def create
    if @user.save
      redirect_to :controller => 'tasklists', :action => 'index'
    else
      render "new"
    end
  end

  def update
    @user = User.where(id: params[:id]).first
    if @user.update_attributes(params[:user])
      if request.xhr?
        render :nothing => true
      else
        redirect_to @user, notice: 'User was successfully updated.'
      end
    else
      render "edit" 
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_url, notice: 'User was deleted.'
    else
      redirect_to users_url, notice: 'User can not be deleted.'
    end
  end

   def send_sms
      number_to_send_to = params[:number]
      msg_body = params[:body]
      twilio_sid = "AC88ce53f1a288f47c55ed6593882fb61a"
      twilio_token = "33b848f4d6ee3f7d72cfbe58fea36760"
      twilio_phone_number = "(720) 726-1903"
       
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
       
      @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "#{number_to_send_to}",
      :body => "#{msg_body}"
      )
      redirect_to users_url, notice: 'Sms Send Succesfully.'
end
end
