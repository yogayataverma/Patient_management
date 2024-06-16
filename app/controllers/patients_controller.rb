# app/controllers/patients_controller.rb

class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
    def index
      @patients = Patient2.all
    end
  
    def new
      @patient = Patient2.new
    end

    def edit
        @patient = Patient2.find(params[:id])
      end
      
    
      def update
        if @patient.update(patient_params)
          redirect_to receptionist_dashboard_path, notice: 'Patient was successfully updated.'
        else
          render :edit
        end
      end
    
      def destroy
        @patient.destroy
        redirect_to receptionist_dashboard_path, notice: 'Patient was successfully deleted.'
      end
      

      def show
        @patient = Patient2.find(params[:id])
      end
      
  
    def create
      @patient = Patient2.new(patient_params)
  
      if @patient.save
        redirect_to receptionist_dashboard_path, notice: 'Patient was successfully created.'
      else
        render :new
      end
    end
  
    def set_patient
      @patient = Patient2.find(params[:id])
    end
  
    def patient_params
        params.require(:patient2).permit(:first_name, :last_name, :date_of_birth, :gender, :phone_number, :email, :doctor)
    end
  end
  