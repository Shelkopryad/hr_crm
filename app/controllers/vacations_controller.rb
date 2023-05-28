class VacationsController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @vacation = @employee.vacation.create(vacation_params)
    redirect_to @employee
    
  end

  def destroy
    @employee = Employee.find(params[:employee_id])

  end

  private
  def vacation_params

    params
      .require(:vacation)
      .permit(:start_date, :end_date, :duration)
      .with_defaults(spent: false, sheduled: true, canceled: false)
  end
end
