# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      set_doctor_session(user) if user.role == 'Doctor'
      redirect_based_on_role(user)
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  private

  def set_doctor_session(user)
    doctor = User.find_by(id: user.id)
    Rails.logger.info doctor
    if doctor
      session[:doctor_first_name] = doctor.username
      Rails.logger.info "Doctor's first name set in session: #{session[:doctor_first_name]}"
    else
      Rails.logger.info "No doctor found for user: #{user.email}"
    end
  end

  def redirect_based_on_role(user)
    case user.role
    when 'Doctor'
      redirect_to doctor_dashboard_path
    when 'Receptionist'
      redirect_to receptionist_dashboard_path
    else
      redirect_to root_path
    end
  end
end
