class DashboardsController < ApplicationController
  def doctor
    Rails.logger.info "Current doctor's first name from session: #{current_doctor_first_name}"
    @patients = Patient2.where(doctor: current_doctor_first_name)
                        .where(created_at: 4.days.ago.beginning_of_day..Time.zone.now.end_of_day)

    # Prepare data for Google Charts
    @patients_chart_data = @patients.group_by_day(:created_at).count.to_a.unshift(['Date', 'Number of Patients'])
  end

  def receptionist
    @patients = Patient2.all
  end

  private

  def current_doctor_first_name
    session[:doctor_first_name]
  end
end
