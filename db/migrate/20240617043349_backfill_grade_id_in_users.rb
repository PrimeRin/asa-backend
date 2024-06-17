class BackfillGradeIdInUsers < ActiveRecord::Migration[7.0]
  def change
    def up
      default_grade_id = Grade.first.id
      User.where(grade_id: nil).update_all(grade_id: default_grade_id)
    end
  end
end
