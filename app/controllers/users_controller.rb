class UsersController < ApplicationController
  
  @@tickets_total = 20
  
  def blogger
    @user = User.new
  end
  
  def save_blogger
    @user = User.new(params[:user])
    @user.role_id = 1
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/thanks' }
      else
        format.html { render action: 'blogger'}
      end
    end
  end
  
  def final_pitches
    @user = User.new
    @remaining = @@tickets_total - User.observers.count
    
    if @remaining <= 0
      redirect_to '/too_late'
    end
  end
  
  def save_observer
    @user = User.new(params[:user])
    @user.role_id = 2
    
    respond_to do |format|
      if @user.save
        cookies.signed[:user_id] = [@user.id]
        format.html { redirect_to 'http://www.paywithatweet.com/pay/?id=8a436727686984cd71d69f32879d837b' }
      else
        format.html { render action: 'final_pitches'}
      end
    end
  end
  
  def confirm_observer
    if (@@tickets_total - User.observers.count) <= 0
      redirect_to '/too_late'
    end
    if cookies.signed[:user_id]
      @user = User.find(cookies.signed[:user_id][0])
      @user.update_attribute(:confirmed, true)
      cookies.delete :user_id
    else
      redirect_to '/try_again'
    end    
  end
end