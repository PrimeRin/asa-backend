module Icbs
  class PayDetail < ApplicationRecordBase
    self.table_name = 'TBLEMPPAYDTL'

    def self.net_amount(empid)
      begin
        max_emppayid = Icbs::PayDetail.where(EMPID: empid).maximum(:emppayid)

        pay = Icbs::PayDetail
                .select(:COMPONENTAMOUNT)
                .distinct
                .where(emppayid: max_emppayid, EMPID: empid, COMPONENTCODE: 'Net')

        pay.first.COMPONENTAMOUNT
      rescue => e
        Rails.logger.error("Error fetching distinct component amount: #{e.message}")
        nil
      end
    end
  end
end

# empid = 50275
# distinct_component_amount = Icbs::PayDetail.distinct_component_amount(empid)
