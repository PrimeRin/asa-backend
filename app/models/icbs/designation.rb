module Icbs
  class Designation < ApplicationRecordBase
    self.table_name = 'TBLDESIGNATIONMST'
    self.primary_key = 'designationid'
  end
end
