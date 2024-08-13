# frozen_string_literal: true

class SalaryService
  def initialize(advance, salary_params)
    @advance = advance
    @salary_params = salary_params
  end

  def create
    @advance.create_salary_advance(@salary_params).save
  end

  def update
    salary = @advance.salary_advance

    if salary
      salary.update(@salary_params)
    else
      raise "Salary record not found for advance ID #{@advance.id}"
    end
  end
end
