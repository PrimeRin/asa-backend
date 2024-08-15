module Icbs
  class BalanceFetcher
    def self.fetch_balance(slcode, glcode)
      oracle_formatted_date = Date.today.strftime('%d-%b-%Y').upcase
      secondary_db_config = Rails.configuration.database_configuration[Rails.env]['secondary']
      ActiveRecord::Base.establish_connection(secondary_db_config)

      sql = <<-SQL
        SELECT GETSLCLOSEBAL1(TO_DATE('#{oracle_formatted_date}', 'DD-MON-YYYY'), b.slid) AS balance
        FROM Tblglmst a
        INNER JOIN Tblslmst b ON a.glid = b.glid
        WHERE b.slcode = '#{slcode}'
        AND a.glcode = '#{glcode}'
      SQL

      begin
        cursor = ActiveRecord::Base.connection.execute(sql)

        balance = nil
        cursor.fetch do |row|
          balance = row[0]
        end

        balance
      rescue ActiveRecord::StatementInvalid => e
        puts "An error occurred: #{e.message}"
        nil
      ensure
        # Ensure that the connection is reset to the primary database
        ActiveRecord::Base.establish_connection(:primary)
      end
    end
  end
end
