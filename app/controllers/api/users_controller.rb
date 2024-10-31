# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: %i[show update destroy]

    def index
      @pagy, @users = pagy(User.all, page: params[:page] || 1)
      render json: { pagy: pagy_metadata(@pagy), users: @users }, status: :ok
    end

    def show
      user_detail = Icbs::EmployeeMst.find_by(employeecode: @user.username)
      if user_detail
        user_data = @user.attributes.merge(
          role: @user.role,
          mobile_number: user_detail.mob_no,
          first_name: user_detail.firstname,
          middle_name: user_detail.middlename,
          last_name: user_detail.lastname,
          department_name: department_name(user_detail.divisionid),
          position_title: position_title(user_detail.designationid),
          net_pay: net_pay(user_detail.employeeid),
          profile_pic: ProfileService.new(user_detail.employeeid).profile_image,
        )
        render json: user_data, status: :ok
      else
        render json: { error: 'User detail not found' }, status: :not_found
      end
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      head :no_content
    end

    def reset_password
      @user = current_user
      if @user.valid_password?(params[:current_password])
        if params[:new_password] == params[:new_password_confirmation]
          if @user.update(password: params[:new_password], reset_password: false)
            render json: { message: 'Password successfully updated' }, status: :ok
          else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { errors: ['New password and confirmation do not match'] }, status: :unprocessable_entity
        end
      else
        render json: { errors: ['Current password is incorrect'] }, status: :unprocessable_entity
      end
    end

    private

    def department_name(division_id)
      begin
        Icbs::Division.find(division_id).divisionname
      rescue ActiveRecord::RecordNotFound
        nil
      end
    end

    def position_title(designation_id)
      begin
        Icbs::Designation.find(designation_id).designationname
      rescue ActiveRecord::RecordNotFound
        nil
      end
    end

    def net_pay(id)
      Icbs::PayDetail.net_amount(id)
    end

    def set_user
      @user ||= User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :profile_pic, :grade_id, :role_id)
    end
  end
end
