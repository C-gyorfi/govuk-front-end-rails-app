class UsersController < ApplicationController
  def new
    @registration = UserRegistrationForm.new
  end

  def create
    @registration = UserRegistrationForm.new(
      { 
        name: params[:user_registration_form][:name],
        phone: params[:user_registration_form][:phone],
        dob: params[:user_registration_form][:dob]
      }
    )

    if @registration.save
      flash[:success] = 'Support user created'

      redirect_to '/users/success.html'  
    else
      render :new
    end
  end
end
