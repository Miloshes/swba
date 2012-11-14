class UsersController < ApplicationController
  
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
  end
  
  def save_observer
    
  end
end