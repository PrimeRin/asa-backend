module Icbs
  class VoucherGenerator
    def self.generate_voucher(txn_date:, txn_value_date:, particulars:, vch_type:, created_by:, amount:, dr_gl_code:, total_amount:, cr_gl_code:, new_cr_gl_code:, emp_code:, monthly_recovery_amount:, from_date:, to_date:, loan_id:)
      oracle_formatted_txn_date = txn_date ? txn_date.strftime('%d-%b-%Y').upcase : nil
      oracle_formatted_value_date = txn_value_date ? txn_value_date.strftime('%d-%b-%Y').upcase : nil
      oracle_formatted_from_date = from_date ? from_date.strftime('%d-%b-%Y').upcase : nil
      oracle_formatted_to_date = to_date ? to_date.strftime('%d-%b-%Y').upcase : nil
      next_txn_id = nil

      secondary_db_config = Rails.configuration.database_configuration[Rails.env]['secondary']
      ActiveRecord::Base.establish_connection(secondary_db_config)
      
      begin
        sql = <<-SQL
          DECLARE
            v_next_txn_id NUMBER;
          BEGIN
            ASA_GENERATE_VOUCHER(
              TO_DATE('#{oracle_formatted_txn_date}', 'DD-MON-YYYY'),
              TO_DATE('#{oracle_formatted_value_date}', 'DD-MON-YYYY'),
              '#{particulars}',
              '#{vch_type}',
              '#{created_by}',
              #{amount},
              #{total_amount},
              #{dr_gl_code},
              #{cr_gl_code},
              #{new_cr_gl_code},
              #{emp_code},
              #{monthly_recovery_amount},
              #{oracle_formatted_from_date ? "TO_DATE('#{oracle_formatted_from_date}', 'DD-MON-YYYY')" : 'NULL'},
              #{oracle_formatted_to_date ? "TO_DATE('#{oracle_formatted_to_date}', 'DD-MON-YYYY')" : 'NULL'},
              #{loan_id ? loan_id : 'NULL'},
              v_next_txn_id
            );
            :next_txn_id := v_next_txn_id;
          END;
        SQL

        connection = ActiveRecord::Base.connection.raw_connection
        cursor = connection.parse(sql)
        cursor.bind_param(':next_txn_id', next_txn_id, Integer)
        cursor.exec
        next_txn_id = cursor[':next_txn_id']
        next_txn_id  

      rescue ActiveRecord::StatementInvalid => e
        puts "An error occurred: #{e.message}"
        nil
      ensure
        ActiveRecord::Base.establish_connection(:primary)
      end
    end
  end
end
