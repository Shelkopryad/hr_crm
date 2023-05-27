class VacationController < ApplicationController
  def new
    @vacation = Vacation.new
  end

  def create

  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to root_path, status: :see_other
  end
end
