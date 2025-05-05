module Icbs
    class DraftVch < ApplicationRecordBase
      self.table_name  = 'TBLDRAFTVCHHDR'
      self.primary_key = 'TXNID'
    end
  end
  