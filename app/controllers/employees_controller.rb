class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @history_points = @employee.history_point
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @employee = Employee.find(params[:id])
    previous_params = @employee.clone

    history_points = []
    employee_params.each do |key, value|
      if value.to_s != previous_params.send(key).to_s
        history_points << @employee.history_point.new(
          description: "#{Time.now.strftime('%Y-%m-%d %H:%M')} Changed #{key} from #{previous_params.send(key)} to #{value}"
        )
      end
    end

    if @employee.update(employee_params)
      history_points.each do |hp|
        hp.save
      end

      redirect_to @employee
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private
  def employee_params
    params.require(:employee).permit(:name, :last_name, :middle_name, :current_position, :email, :birthdate, :date_of_employing)
  end

end
