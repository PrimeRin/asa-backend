# frozen_string_literal: true

class SalaryService
  def initialize(advance, salary_params)
    @advance = advance
    @salary_params = salary_params
  end

  def create
    @advance.create_salary_advance(@salary_params).save
  end
end
