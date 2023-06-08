class VacationsController < ApplicationController
  def new
    @employee = Employee.find(params[:employee_id])
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @contract = @employee.contract.last
    employee_vacations = @contract.vacation.reduce(vacation_params[:duration].to_i) { |zero, it| it.duration.to_i + zero }
    unless employee_vacations > 20
      @contract.vacation.create(vacation_params)
    end
    redirect_to @employee
  end

  def cancel_vacation
    employee = Employee.find(params[:employee_id])
    vacation = employee.contract.last.vacation.find(params[:id])
    vacation.update(status: 'canceled')
    redirect_to employee
  end

  def print_application
    @employee = Employee.find(params[:employee_id])
    @vacation = @employee.contract.last.vacation.find(params[:id])

    render pdf: "#{@employee.name} #{@employee.last_name}",
           template: "vacations/vacat_app",
           layout: 'pdf',
           formats: [:html]
  end

  private
  def vacation_params
    params
      .require(:vacation)
      .permit(:start_date, :end_date, :duration)
      .with_defaults(status: 'scheduled')
  end
end
