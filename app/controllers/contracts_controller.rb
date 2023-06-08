class ContractsController < ApplicationController

  def new
    @employee = Employee.find(params[:employee_id])
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @employee.contract.create(contracts_params)
    redirect_to @employee
  end

  private
  def contracts_params
    params
      .require(:contract)
      .permit(:start_date, :end_date, :duration)
  end
end
