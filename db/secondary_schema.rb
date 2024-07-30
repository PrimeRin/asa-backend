# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_07_17_070914) do
  create_table "abc", id: false, force: :cascade do |t|
    t.decimal "bk08id", null: false
    t.string "vchno", limit: 20, null: false
    t.date "txndate", null: false
    t.date "valuedate", null: false
    t.string "benefname", limit: 100
    t.string "benefnumber", limit: 40
    t.string "extreference", limit: 250
    t.string "transflag", limit: 1, null: false
    t.decimal "bullionamount"
    t.decimal "currencyid", null: false
    t.decimal "holdingrate", null: false
    t.decimal "sellingrate", null: false
    t.decimal "fcamount", null: false
    t.decimal "nuamount", null: false
    t.decimal "commission"
    t.decimal "totalamount", null: false
    t.string "particulars", limit: 250, null: false
    t.decimal "finyrid"
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.string "rejectedby", limit: 5
    t.date "rejectdate"
    t.string "rejremarks", limit: 250
    t.date "authdate"
    t.string "authorisedby", limit: 5
    t.date "verifydate"
    t.string "verifiedby", limit: 5
    t.string "reversible", limit: 1
    t.decimal "reverseid"
    t.date "originalvdate"
    t.decimal "originmodule"
    t.decimal "status", null: false
    t.decimal "txnid", null: false
    t.decimal "currencyglid"
    t.decimal "gainloss"
    t.string "independentbank", limit: 1
    t.decimal "bankid"
    t.string "paymentmode", limit: 1
    t.decimal "bankacglid"
    t.decimal "purposeid"
    t.decimal "debitbankglid"
    t.string "debitrefno", limit: 40
    t.decimal "nuglid"
    t.decimal "fcglid"
    t.decimal "bankacid"
    t.decimal "debitbankacid"
  end

  create_table "action_mst", id: false, force: :cascade do |t|
    t.string "actionid", limit: 5, null: false
    t.string "menuid", limit: 25
    t.string "actionname", limit: 25
  end

  create_table "application", primary_key: "loan_txn_id", id: { limit: 10, precision: 10 }, force: :cascade do |t|
    t.decimal "emi", precision: 19, scale: 2
    t.decimal "amount", precision: 19, scale: 2
    t.datetime "application_date"
    t.string "application_no"
    t.string "bank_acc_id"
    t.string "bankglid"
    t.string "bank_ref_no"
    t.datetime "closing_date"
    t.datetime "create_date"
    t.string "created_by"
    t.decimal "disburse_amt", precision: 19, scale: 2
    t.datetime "disburse_date"
    t.string "disburse_no"
    t.string "disburse_ref_no"
    t.integer "edr_id", limit: 10, precision: 10
    t.decimal "eligible_amt", precision: 19, scale: 2
    t.integer "emp_id", limit: 10, precision: 10
    t.string "employee_code"
    t.string "employee_name"
    t.datetime "first_repay_date"
    t.string "fully_repay"
    t.decimal "instalment_amt", precision: 19, scale: 2
    t.decimal "interest_rate", precision: 19, scale: 2
    t.string "interest_type"
    t.string "loan_acc_no"
    t.decimal "loan_amount", precision: 19, scale: 2
    t.integer "loan_id", limit: 10, precision: 10
    t.decimal "max_amount", precision: 19, scale: 2
    t.integer "max_repay_period", limit: 10, precision: 10
    t.string "modify_by"
    t.datetime "modify_date"
    t.decimal "net_pay", precision: 19, scale: 2
    t.integer "no_of_instalment", limit: 10, precision: 10
    t.integer "penalty_charge_period", limit: 10, precision: 10
    t.decimal "penalty_rate", precision: 19, scale: 2
    t.string "penalty_type"
    t.integer "recovery_period", limit: 10, precision: 10
    t.string "rejected_by"
    t.datetime "rejected_date"
    t.string "remarks"
    t.string "repay_unit"
    t.string "repayment_frequency"
    t.decimal "sanction_amt", precision: 19, scale: 2
    t.datetime "sanction_date"
    t.string "sanction_no"
    t.string "status"
    t.string "transaction_mode"
    t.integer "txn_id", limit: 10, precision: 10
    t.string "vch_no"
    t.datetime "verification_date"
    t.string "verified_by"
    t.string "verify_remarks"
  end

  create_table "asset_experiment", id: false, force: :cascade do |t|
    t.decimal "groupid"
    t.string "assetcode", limit: 25
  end

  create_table "assetissuetrans_pema", id: false, force: :cascade do |t|
    t.string "assetcode", limit: 35, null: false
    t.string "groupcode", limit: 25
    t.string "subgroupcode", limit: 25
    t.decimal "olddivision"
    t.decimal "oldempid"
  end

  create_table "assetmst_pema", id: false, force: :cascade do |t|
    t.string "assetcode", limit: 35, null: false
    t.string "groupcode", limit: 25
    t.string "subgroupcode", limit: 25
    t.string "assetname", limit: 110
    t.string "mfgsrlno", limit: 35
    t.decimal "olddivision"
    t.decimal "oldempid"
    t.index ["assetcode"], name: "sys_c00150448", unique: true, tablespace: "icbs"
  end

  create_table "banking", primary_key: "rbinfo_id", id: { type: :decimal, precision: 19, scale: 2 }, force: :cascade do |t|
    t.string "createdby"
    t.datetime "createddate"
    t.string "rbinfo_currency"
    t.string "rbinfo_name"
    t.string "rbinfo_status"
    t.string "rbinfo_units"
    t.datetime "rbinfo_effectivedate"
    t.decimal "rbinfo_value", precision: 19, scale: 2
  end

  create_table "board_of_directors", id: false, force: :cascade do |t|
    t.decimal "fiid", null: false
    t.string "filngname", limit: 60, null: false
    t.decimal "firefyear", null: false
    t.decimal "firefmonth", null: false
    t.string "firefmonth_words", limit: 25
    t.string "fibodname", limit: 40, null: false
    t.string "fibodposition", limit: 16
    t.string "fibodoccup", limit: 100, null: false
    t.string "joindate", limit: 10
  end

  create_table "cc_special_tran", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 200
    t.string "passno", limit: 200
    t.date "issue_date"
    t.date "exp_date"
    t.date "dep_date"
    t.string "amount", limit: 200
    t.string "remark", limit: 200
    t.string "cid", limit: 30
    t.string "currency", limit: 100
    t.string "creator", limit: 100
    t.decimal "applied_rate", precision: 38, scale: 28
    t.string "currency_amount", limit: 200
    t.string "ref_no", limit: 50
  end

  create_table "ccinout", id: false, force: :cascade do |t|
    t.date "txn_date"
    t.string "tran_type", limit: 200
    t.string "agency", limit: 200
    t.string "agency_name", limit: 200
    t.string "remitter_name", limit: 200
    t.string "remitter_country", limit: 200
    t.string "remitter_accno", limit: 200
    t.string "beneficiary_name", limit: 200
    t.string "beneficiary_accno", limit: 200
    t.string "beneficiary_country", limit: 200
    t.string "pc1", limit: 200
    t.string "pc2", limit: 200
    t.string "mode_payment", limit: 200
    t.string "amount", limit: 200
    t.string "remark", limit: 200
    t.string "creator", limit: 200
    t.string "id", limit: 200
    t.string "pc3", limit: 200
    t.string "currency", limit: 200
    t.string "tran_status", limit: 200
    t.date "value_date"
    t.integer "row_id", precision: 38
  end

  create_table "clientmst_pema", id: false, force: :cascade do |t|
    t.decimal "divid"
    t.decimal "clientid"
    t.string "clienttitle", limit: 5
    t.string "clientname", limit: 40
    t.string "clientdesig", limit: 40
  end

  create_table "closing_0708", id: false, force: :cascade do |t|
    t.decimal "glid", null: false
    t.decimal "slid", null: false
    t.string "slcode", limit: 25, null: false
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
  end

  create_table "conf_glsubgroup", id: false, force: :cascade do |t|
    t.decimal "subgroupid"
    t.string "subgroupcode", limit: 20
    t.string "subgroupname", limit: 50
  end

  create_table "conf_rsglsubgroup", id: false, force: :cascade do |t|
    t.decimal "glsubgroupid"
    t.string "glsubgroupcode", limit: 25
    t.string "glsubgroupname", limit: 70
  end

  create_table "config_feinflow", id: false, force: :cascade do |t|
    t.string "purpose_code", limit: 25
    t.decimal "purpose_id"
    t.string "purpose_desc", limit: 100
    t.decimal "count_space"
  end

  create_table "config_feoutflow", id: false, force: :cascade do |t|
    t.string "purpose_code", limit: 25
    t.decimal "purpose_id"
    t.string "purpose_desc", limit: 100
    t.decimal "count_space"
  end

  create_table "config_feoutflow1", id: false, force: :cascade do |t|
    t.string "purpose_code", limit: 25
    t.decimal "purpose_id"
    t.string "purpose_desc", limit: 100
    t.decimal "count_space"
  end

  create_table "config_gapanalysis", id: false, force: :cascade do |t|
    t.string "type", limit: 1
    t.string "particulars", limit: 100
    t.string "tranche_type", limit: 1
    t.string "intt_bearing", limit: 1
    t.string "ref_code", limit: 10
    t.decimal "srl_no"
    t.string "int_particulars", limit: 100
  end

  create_table "config_inflowoutflow", id: false, force: :cascade do |t|
    t.string "type", limit: 1
    t.string "head_name", limit: 100
    t.string "ref_code", limit: 10
    t.decimal "srl"
    t.string "show_only_positive", limit: 1
  end

  create_table "config_inflowoutflow1", id: false, force: :cascade do |t|
    t.string "type", limit: 1
    t.string "head_name", limit: 100
    t.string "ref_code", limit: 10
    t.decimal "srl"
    t.string "show_only_positive", limit: 1
  end

  create_table "config_issue", id: false, force: :cascade do |t|
    t.string "config_srl", limit: 10
    t.string "account_head", limit: 40
    t.string "glsubgroupcode", limit: 5
    t.string "flag1", limit: 1
    t.string "flag2", limit: 1
    t.string "flag3", limit: 1
    t.decimal "srl_no"
    t.string "glcode", limit: 7
  end

  create_table "config_issue1", id: false, force: :cascade do |t|
    t.string "config_srl", limit: 10
    t.string "account_head", limit: 40
    t.string "glsubgroupcode", limit: 5
    t.string "flag1", limit: 1
    t.string "flag2", limit: 1
    t.string "flag3", limit: 1
    t.decimal "srl_no"
    t.string "glcode", limit: 7
  end

  create_table "config_tblacademicgroup", id: false, force: :cascade do |t|
    t.string "academicqualigroup", limit: 1
    t.string "academicqualigroupdesc", limit: 50
    t.decimal "rank", default: "0.0"
    t.decimal "fullmarkswritten", default: "0.0"
    t.decimal "fullmarksinterview", default: "0.0"
    t.decimal "weightedpcntaca", default: "0.0"
    t.decimal "weightedpcntwritten", default: "0.0"
    t.decimal "weightedpcntinterview", default: "0.0"
  end

  create_table "config_tblalert", id: false, force: :cascade do |t|
    t.string "action", limit: 40
    t.decimal "days"
  end

  create_table "config_tblitemcategorygllink", id: false, force: :cascade do |t|
    t.string "item_type", limit: 25
    t.string "gl_code_type", limit: 20
  end

  create_table "configcmmdenomglmap", id: false, force: :cascade do |t|
    t.decimal "dinomid"
    t.decimal "unitvalue"
    t.string "denomdesc", limit: 25
    t.decimal "glid"
  end

  create_table "configcmmfreshnotegl", id: false, force: :cascade do |t|
    t.string "glcode", limit: 40
    t.string "currencytype", limit: 40
    t.decimal "unitvalue"
  end

  create_table "conftbl_reportmap", id: false, force: :cascade do |t|
    t.string "label_1", limit: 25
    t.string "label_2", limit: 25
    t.decimal "denom_id"
    t.decimal "circulation_glid"
    t.decimal "exchange_glid"
    t.decimal "newstock_glid"
    t.decimal "sortorder"
    t.string "cyabbrev", limit: 5
    t.string "type", limit: 5
    t.decimal "destroy_glid"
    t.decimal "nonissueable"
    t.decimal "destamt"
  end

  create_table "conftblcmmprocess", id: false, force: :cascade do |t|
    t.string "processname", limit: 25, null: false
    t.decimal "category_id"
    t.decimal "type_id"
    t.decimal "cy_id"
  end

  create_table "conftblformulamst", id: false, force: :cascade do |t|
    t.string "table_name", limit: 50, null: false
    t.string "table_display_name", limit: 50, null: false
    t.string "column_name", limit: 50, null: false
    t.string "column_display_name", limit: 50, null: false
  end

  create_table "conftblintcalmst", id: false, force: :cascade do |t|
    t.string "table_name", limit: 50, null: false
    t.string "table_display_name", limit: 50, null: false
    t.string "column_name", limit: 50, null: false
    t.string "column_display_name", limit: 50, null: false
  end

  create_table "conftblpayvchtax", primary_key: "payvchtaxid", id: :decimal, force: :cascade do |t|
    t.string "taxname", limit: 40
    t.decimal "taxglid"
    t.decimal "taxpercent"
    t.string "active", limit: 1
  end

  create_table "conftblrmmratecurrencies", id: false, force: :cascade do |t|
    t.string "cyabbrev", limit: 10
    t.decimal "cy_id"
    t.string "spot_rate", limit: 1
    t.string "holding_rate", limit: 1
    t.string "rbi_rate", limit: 1
    t.decimal "spot_order"
    t.decimal "holding_order"
    t.decimal "rbi_order"
    t.decimal "other_rate_order", default: "0.0"
    t.string "special_rate", limit: 1
    t.string "currencydistribution", limit: 1
    t.string "exchangegainloss", limit: 1
  end

  create_table "conftblwebratecurrency", id: false, force: :cascade do |t|
    t.string "cyabbrev", limit: 10
    t.decimal "currencyid"
    t.string "spot_rate", limit: 1
    t.decimal "spot_order"
  end

  create_table "country", primary_key: "country_id", force: :cascade do |t|
    t.string "country_code", limit: 10, null: false
    t.string "country", limit: 4000, null: false
    t.string "currency", limit: 4
    t.index ["country_code"], name: "country_code_unique", unique: true
  end

  create_table "currencyinflowoutflowhdr", id: false, force: :cascade do |t|
    t.string "hdrid", limit: 100
    t.string "year", limit: 6
    t.string "month", limit: 2
    t.string "openingbalus", limit: 100
    t.string "openingbalrs", limit: 100
    t.string "closingbalus", limit: 100
    t.string "closingbalrs", limit: 100
  end

  create_table "currenyinflowoutflow", id: false, force: :cascade do |t|
    t.string "in_outflow", limit: 20
    t.string "items", limit: 30
    t.string "valueus", limit: 20
    t.string "year", limit: 6
    t.string "month", limit: 4
    t.string "openingbalus", limit: 100
    t.string "closingbalus", limit: 100
    t.string "valuers", limit: 100
    t.string "openingbalrs", limit: 100
    t.string "closingbalrs", limit: 100
    t.string "revaluation_gl", limit: 100
  end

  create_table "cust_comp", id: false, force: :cascade do |t|
    t.string "finame", limit: 200, null: false
    t.string "name", limit: 200, null: false
    t.string "address", limit: 1000, null: false
    t.integer "phone", precision: 38, null: false
    t.string "tcomplaint", limit: 100
    t.string "ncomplaint", limit: 1000
    t.string "resolve", limit: 100
  end

  create_table "dash_inflow_outflow", id: false, force: :cascade do |t|
    t.date "tdate", null: false
    t.decimal "grants", null: false
    t.decimal "loans", null: false
    t.decimal "interest_income", null: false
    t.decimal "in_pfcb", null: false
    t.decimal "in_others", null: false
    t.decimal "debt_service_payments", null: false
    t.decimal "sale_to_commercial_banks", null: false
    t.decimal "sale_of_usd_for_inr", null: false
    t.decimal "out_pfcb", null: false
    t.decimal "out_others", null: false
    t.decimal "in_commercial_banks", null: false
    t.decimal "out_commercial_banks", null: false
  end

  create_table "dash_reserve_status", force: :cascade do |t|
    t.date "res_date", null: false
    t.decimal "rma_cc", null: false
    t.decimal "rma_inr", null: false
    t.decimal "bank_cc", null: false
    t.decimal "bank_inr", null: false
  end

  create_table "datearray", id: false, force: :cascade do |t|
    t.date "dt"
  end

  create_table "debt_indicator_foreign", id: false, force: :cascade do |t|
    t.string "bopcode", limit: 25
    t.string "bopname", limit: 200
    t.decimal "y1", precision: 15, scale: 2
    t.decimal "y2", precision: 15, scale: 2
    t.decimal "y3", precision: 15, scale: 2
    t.decimal "y4", precision: 15, scale: 2
    t.decimal "y5", precision: 15, scale: 2
    t.decimal "y6", precision: 15, scale: 2
    t.decimal "y7", precision: 15, scale: 2
    t.decimal "y8", precision: 15, scale: 2
    t.decimal "y9", precision: 15, scale: 2
    t.decimal "y10", precision: 15, scale: 2
    t.decimal "projectmstdtlid"
  end

  create_table "debt_indicator_foreign_qtr", id: false, force: :cascade do |t|
    t.string "bopcode", limit: 25
    t.string "bopname", limit: 200
    t.decimal "y1", precision: 15, scale: 2
    t.decimal "y2", precision: 15, scale: 2
    t.decimal "y3", precision: 15, scale: 2
    t.decimal "y4", precision: 15, scale: 2
    t.decimal "y5", precision: 15, scale: 2
    t.decimal "y6", precision: 15, scale: 2
    t.decimal "y7", precision: 15, scale: 2
    t.decimal "y8", precision: 15, scale: 2
    t.decimal "y9", precision: 15, scale: 2
    t.decimal "y10", precision: 15, scale: 2
    t.decimal "quarter", precision: 15, scale: 2
    t.decimal "projectmstdtlid"
  end

  create_table "debt_indicator_rupee", id: false, force: :cascade do |t|
    t.string "bopcode", limit: 25
    t.string "bopname", limit: 200
    t.decimal "y1", precision: 15, scale: 2
    t.decimal "y2", precision: 15, scale: 2
    t.decimal "y3", precision: 15, scale: 2
    t.decimal "y4", precision: 15, scale: 2
    t.decimal "y5", precision: 15, scale: 2
    t.decimal "y6", precision: 15, scale: 2
    t.decimal "y7", precision: 15, scale: 2
    t.decimal "y8", precision: 15, scale: 2
    t.decimal "y9", precision: 15, scale: 2
    t.decimal "y10", precision: 15, scale: 2
    t.decimal "projectmstdtlid"
  end

  create_table "debt_indicator_rupee_qtr", id: false, force: :cascade do |t|
    t.string "bopcode", limit: 25
    t.string "bopname", limit: 200
    t.decimal "y1", precision: 15, scale: 2
    t.decimal "y2", precision: 15, scale: 2
    t.decimal "y3", precision: 15, scale: 2
    t.decimal "y4", precision: 15, scale: 2
    t.decimal "y5", precision: 15, scale: 2
    t.decimal "y6", precision: 15, scale: 2
    t.decimal "y7", precision: 15, scale: 2
    t.decimal "y8", precision: 15, scale: 2
    t.decimal "y9", precision: 15, scale: 2
    t.decimal "y10", precision: 15, scale: 2
    t.decimal "quarter", precision: 15, scale: 2
    t.decimal "projectmstdtlid"
  end

  create_table "divmst_pema", id: false, force: :cascade do |t|
    t.decimal "divid"
    t.string "divname", limit: 40
  end

  create_table "dummy_leave_bal", id: false, force: :cascade do |t|
    t.decimal "leavetypeid", null: false
    t.decimal "employeeid", null: false
    t.decimal "categoryid"
    t.decimal "openingbalance"
    t.decimal "leaveatcredit"
    t.decimal "leavedebit"
    t.decimal "closingbalance"
    t.string "remarks", limit: 250
    t.string "creditentireservice", limit: 1
    t.string "crediteveryyear", limit: 1
    t.string "crediteverymonth", limit: 1
    t.string "activeflag", limit: 1
    t.decimal "extra"
  end

  create_table "dummy_test", primary_key: "empid", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.decimal "el", precision: 16, scale: 2, null: false
  end

  create_table "dummy_yearly_balance", primary_key: "empid", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.decimal "leave_bal", precision: 18, scale: 2
  end

  create_table "employee_mst", id: false, force: :cascade do |t|
    t.string "empid", limit: 5, null: false
    t.string "empname", limit: 100
    t.string "divisionname", limit: 100
    t.string "designation", limit: 100
  end

  create_table "excel_file_passwords", id: false, force: :cascade do |t|
    t.string "work_book_password", limit: 500
    t.string "work_sheet_password", limit: 500
  end

  create_table "glbalance", id: false, force: :cascade do |t|
    t.decimal "glbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25
    t.decimal "glid", null: false
    t.string "glcode", limit: 25
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
    t.index ["currencyid"], name: "glbalance_currencyid"
    t.index ["finyrid"], name: "glbalance_finyrid"
    t.index ["glbalanceid"], name: "glbalance_id"
    t.index ["glid", "glcode"], name: "glbalance_glidandcode"
  end

  create_table "glbalance_22_03_2016", id: false, force: :cascade do |t|
    t.decimal "glbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25
    t.decimal "glid", null: false
    t.string "glcode", limit: 25
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "glbalance_bk", primary_key: ["glbalanceid", "finyrid", "glid"], force: :cascade do |t|
    t.decimal "glbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25
    t.decimal "glid", null: false
    t.string "glcode", limit: 25
    t.decimal "openingdr", precision: 20, scale: 2, default: "0.0"
    t.decimal "openingcr", precision: 20, scale: 2, default: "0.0"
    t.decimal "closingdr", precision: 20, scale: 2, default: "0.0"
    t.decimal "closingcr", precision: 20, scale: 2, default: "0.0"
    t.decimal "prevyrclosebal", default: "0.0"
    t.decimal "currencyid"
    t.index ["currencyid"], name: "pk_glbalance3"
    t.index ["finyrid"], name: "pk_glbalance1"
    t.index ["glid"], name: "pk_glbalance2"
  end

  create_table "glbalance_bkup010811", id: false, force: :cascade do |t|
    t.decimal "glbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25
    t.decimal "glid", null: false
    t.string "glcode", limit: 25
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "grn_fifo", id: false, force: :cascade do |t|
    t.decimal "grnid", null: false
    t.string "grnnumber", limit: 35, null: false
    t.date "grndate", null: false
    t.decimal "itemid", null: false
    t.decimal "grnqty"
    t.decimal "rate", precision: 12, scale: 2
    t.decimal "grnbalqty"
    t.decimal "issueid"
    t.decimal "issueqty"
  end

  create_table "grn_fifo_back", id: false, force: :cascade do |t|
    t.decimal "grnid", null: false
    t.string "grnnumber", limit: 35, null: false
    t.date "grndate", null: false
    t.decimal "itemid", null: false
    t.decimal "grnqty"
    t.decimal "rate", precision: 12, scale: 2
    t.decimal "grnbalqty"
    t.decimal "issueid"
    t.decimal "issueqty"
  end

  create_table "incomeexpnstmt", id: false, force: :cascade do |t|
    t.string "currfinyrcode", limit: 15
    t.string "oldfinyrcode", limit: 15
    t.string "glclass", limit: 50
    t.string "glgroup", limit: 50
    t.string "glsubgroup", limit: 50
    t.string "sch", limit: 10
    t.decimal "curramount"
    t.decimal "oldamount"
    t.date "currfinyrdate"
    t.date "oldfinyrdate"
    t.string "userid", limit: 50
    t.string "username", limit: 50
  end

  create_table "inr_ats", id: false, force: :cascade do |t|
    t.date "tran_date", null: false
    t.string "name", limit: 50, null: false
    t.string "occup", limit: 50, null: false
    t.decimal "cid", null: false
    t.decimal "amount", null: false
    t.string "source", limit: 50, null: false
    t.string "dest", limit: 50, null: false
    t.decimal "contact", null: false
    t.string "u_name", limit: 500
    t.decimal "userid"
    t.string "agency", limit: 300
    t.string "refno", limit: 500
  end

  create_table "inr_ats_limit", id: false, force: :cascade do |t|
    t.string "scheme_name", limit: 20
    t.decimal "max_limit"
    t.decimal "min_limit"
  end

  create_table "inr_cashless", id: false, force: :cascade do |t|
    t.date "txn_date"
    t.string "rem_nam", limit: 200
    t.string "ben_nam", limit: 200
    t.decimal "amount"
    t.string "instrument", limit: 200
    t.string "branch", limit: 200
    t.integer "rem_con", limit: 20, precision: 20
  end

  create_table "inr_education", id: false, force: :cascade do |t|
    t.date "tran_date"
    t.string "nam", limit: 100
    t.string "id_crd", limit: 50
    t.string "add_bhutan", limit: 500
    t.string "nam_add_inst", limit: 500
    t.string "t_free", limit: 100
    t.string "l_allowance", limit: 100
    t.string "t_amt", limit: 100
    t.string "pay_t", limit: 10
    t.string "pay_a", limit: 10
    t.string "ben_details", limit: 500
    t.string "remarks", limit: 500
    t.string "bank", limit: 100, null: false
    t.string "userid", limit: 100, null: false
  end

  create_table "inr_education_bck07062022", id: false, force: :cascade do |t|
    t.date "tran_date"
    t.string "nam", limit: 100
    t.string "id_crd", limit: 50
    t.string "add_bhutan", limit: 500
    t.string "nam_add_inst", limit: 500
    t.string "t_free", limit: 100
    t.string "l_allowance", limit: 100
    t.string "t_amt", limit: 100
    t.string "pay_t", limit: 10
    t.string "pay_a", limit: 10
    t.string "ben_details", limit: 500
    t.string "remarks", limit: 500
    t.string "bank", limit: 100, null: false
    t.string "userid", limit: 100, null: false
  end

  create_table "inr_export", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.date "due_date"
    t.string "nam", limit: 100
    t.string "bank_name", limit: 100
    t.string "acc_no", limit: 50
    t.string "invoice_value", limit: 50
    t.string "status", limit: 10, default: "Open"
    t.string "invoice_no", limit: 50
    t.string "tpn", limit: 20
    t.string "drc_entry_no", limit: 50
    t.string "currency", limit: 50
  end

  create_table "inr_freight", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "importer_expoter_name", limit: 100
    t.string "tpn", limit: 11
    t.string "lc_no", limit: 20
    t.string "commodity", limit: 100
    t.integer "noofbtntruck", precision: 38
    t.integer "noofindtruck", precision: 38
    t.decimal "amount"
    t.string "remarks", limit: 500
    t.string "bank", limit: 500
    t.string "creator", limit: 50
    t.string "destination", limit: 400
  end

  create_table "inr_immigration", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 200
    t.string "cust_id", limit: 200
    t.string "permit_no", limit: 200
    t.decimal "amount"
    t.date "permit_issue_date"
    t.date "exit_date"
    t.date "permit_expiry_date"
    t.decimal "amount_exit"
    t.string "ref_no", limit: 300
    t.string "creator", limit: 100
    t.string "remark", limit: 500
    t.decimal "inr1"
    t.decimal "inr2"
    t.decimal "inr5"
    t.decimal "inr10"
    t.decimal "inr20"
    t.decimal "inr50"
    t.decimal "inr100"
    t.decimal "inr200"
    t.decimal "inr500"
    t.decimal "inr2000"
    t.decimal "btn1"
    t.decimal "btn5"
    t.decimal "btn10"
    t.decimal "btn20"
    t.decimal "btn50"
    t.decimal "btn100"
    t.decimal "btn500"
    t.decimal "btn1000"
  end

  create_table "inr_immigration_exit", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "permit_no", limit: 200
    t.string "name", limit: 200
    t.date "permit_issue_date"
    t.date "permit_expiry_date"
    t.decimal "amount"
    t.string "remark", limit: 500
    t.string "ref_no", limit: 300
    t.string "creator", limit: 100
    t.string "cust_id", limit: 200
    t.decimal "inr1"
    t.decimal "inr2"
    t.decimal "inr5"
    t.decimal "inr10"
    t.decimal "inr20"
    t.decimal "inr50"
    t.decimal "inr100"
    t.decimal "inr200"
    t.decimal "inr500"
    t.decimal "inr2000"
    t.decimal "btn1"
    t.decimal "btn5"
    t.decimal "btn10"
    t.decimal "btn20"
    t.decimal "btn50"
    t.decimal "btn100"
    t.decimal "btn500"
    t.decimal "btn1000"
  end

  create_table "inr_import", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 500
    t.string "id_card_no_bit", limit: 500
    t.string "drc_entry_no", limit: 500
    t.string "invoice_value", limit: 500
    t.string "payment_type", limit: 500
    t.string "import_category", limit: 500
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.string "userid", limit: 500, null: false
    t.date "due_date"
    t.string "status", limit: 100
    t.string "mop", limit: 50
  end

  create_table "inr_labour", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "owner_name", limit: 100
    t.string "owner_id_card_no", limit: 500
    t.string "molhr_approved_no", limit: 500
    t.string "labour_approved", limit: 500
    t.string "amount", limit: 500
    t.string "total_amount", limit: 500
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.string "userid", limit: 500, null: false
  end

  create_table "inr_labour_bkup", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "owner_name", limit: 100
    t.string "owner_id_card_no", limit: 500
    t.string "molhr_approved_no", limit: 500
    t.string "labour_approved", limit: 500
    t.string "amount", limit: 500
    t.string "total_amount", limit: 500
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.string "userid", limit: 500, null: false
  end

  create_table "inr_medical", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 500
    t.string "id_card_no", limit: 500
    t.decimal "amount"
    t.string "document", limit: 500
    t.string "remarks", limit: 500
    t.string "bank", limit: 500
    t.decimal "userid"
  end

  create_table "inr_merchant", id: false, force: :cascade do |t|
    t.date "txn_date"
    t.string "rem_nam", limit: 200
    t.string "ben_nam", limit: 200
    t.string "card", limit: 200
    t.decimal "amount"
    t.string "instrument", limit: 200
    t.string "branch", limit: 200
    t.string "rem_add", limit: 500
    t.integer "rem_con", limit: 20, precision: 20
  end

  create_table "inr_official", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 100
    t.decimal "id_card_no"
    t.decimal "amount"
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.decimal "creator", null: false
  end

