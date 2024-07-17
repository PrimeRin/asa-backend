module Icbs
  class User < ApplicationRecordBase
    self.table_name = 'USER_MST'
    self.primary_key = 'userid'
  end
end