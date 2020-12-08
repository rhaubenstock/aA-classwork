class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(*args)
    super 
    @employees = []
  end

  def add_employees(all_employees)
    all_employees.each {|pos_employee| @employees << pos_employee if pos_employee.boss == @name}
  end

  def bonus(multiplier)
    total_sub_salary * multiplier
  end

  def total_sub_salary
    sum = 0
    queue = []
    @employees.each {|employee| queue << employee }

    until queue.empty?
      employee = queue.shift
      sum += employee.salary
      queue += employee.employees if employee.is_a?(Manager) # employee.class == Manager ; 
    end
    sum
  end
end