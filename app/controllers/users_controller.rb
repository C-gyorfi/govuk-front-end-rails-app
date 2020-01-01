class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      phone: params[:user][:phone],
      dob: DateTime.parse(params[:user][:dob])
    ) 

    if @user.save
      flash[:success] = 'Support user created'

      redirect_to '/users/success.html'  
    else
      redirect_to :new
    end
  end

  # def success
  #   redirect_to 'users/success.html'    
  # end
end
