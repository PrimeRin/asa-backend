module Icbs
  class GradeCategory < ApplicationRecordBase
    has_one :dsa_rate, dependent: :destroy
    self.table_name = 'TBLCATEGORYMST'
    self.primary_key = 'categoryid'
  end
end
