# frozen_string_literal: true

class SalaryService
  def initialize(advance, salary_params)
    @advance = advance
    @salary_params = salary_params
  end

  def create
    salary_advance = @advance.create_salary_advance(@salary_params)

    if salary_advance.save
      salary_advance.update(completion_month: get_completion_month_year)
    end
  end

  def update
    salary = @advance.salary_advance

    if salary
      salary.update(@salary_params)
    else
      raise "Salary record not found for advance ID #{@advance.id}"
    end
  end

  def get_completion_month_year
    date = @advance.updated_at || Time.now
    duration = @salary_params[:duration].to_i
    completion_date = date.advance(months: duration)
    completion_date.strftime("%B %Y")
  end
end
