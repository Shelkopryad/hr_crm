class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @history_points = @employee.history_point
    @empl_vacations = @employee.vacation
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
      if value.to_s != previous_params.send(key).to_s && key != 'photo'
        history_points << @employee.history_point.new(
          description: "#{Time.now.strftime('%Y-%m-%d %H:%M')} Changed #{key} from #{previous_params.send(key)} to #{value}"
        )
      end
    end

    if @employee.update(employee_params)
      history_points.each do |hp|
        hp.save
      end

      redirect_to @employee, notice: 'Employee Created Successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to root_path, status: :see_other
  end

  def print_reference
    @employee = Employee.find(params[:id])
    render pdf: "#{@employee.last_name} #{@employee.name}",
           template: "employees/sertificate_of_empl",
           layout: 'pdf',
           formats: [:html]
  end

  def add_vacation
    @employee = Employee.find(params[:id])
    @employee.vacation
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :last_name, :middle_name, :current_position, :email, :birthdate, :date_of_employing, :photo)
  end

end
