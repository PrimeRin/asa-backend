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

  create_table "inr_pilgrim", id: false, force: :cascade do |t|
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

  create_table "inr_smerchant", id: false, force: :cascade do |t|
    t.date "tran_date", null: false
    t.string "name", limit: 200, null: false
    t.string "voterid", limit: 50
    t.decimal "amount"
    t.decimal "contact"
    t.string "u_name", limit: 50
    t.decimal "userid"
    t.string "address", limit: 200
  end

  create_table "inr_tourpackage", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "org_name", limit: 100
    t.string "org_cid", limit: 11
    t.string "invoice_no", limit: 20
    t.integer "noofpassenger", precision: 38
    t.string "destination", limit: 100
    t.decimal "amount"
    t.string "remarks", limit: 500
    t.string "bank", limit: 500
    t.string "creator", limit: 50
  end

  create_table "inr_transacstion_10062022", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 100
    t.decimal "id_card_no"
    t.decimal "amount"
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.decimal "creator", null: false
  end

  create_table "inr_transaction", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 100
    t.decimal "id_card_no"
    t.decimal "amount"
    t.string "purpose", limit: 100
    t.string "instrument_type", limit: 100
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.decimal "userid", null: false
  end

  create_table "inr_transaction_bkup", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.string "name", limit: 100
    t.decimal "id_card_no"
    t.decimal "amount"
    t.string "purpose", limit: 100
    t.string "instrument_type", limit: 100
    t.string "remarks", limit: 500
    t.string "bank", limit: 500, null: false
    t.decimal "userid", null: false
  end

  create_table "inrinout", id: false, force: :cascade do |t|
    t.date "txn_date"
    t.string "tran_type", limit: 200
    t.string "agency", limit: 200
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
    t.string "agency_name", limit: 200
    t.string "tran_status", limit: 100
    t.integer "row_id", precision: 38
    t.date "value_date"
    t.string "merchantid", limit: 200
  end

  create_table "ipg_feedback", primary_key: "complain_id", force: :cascade do |t|
    t.string "transfer_mode", limit: 20
    t.string "bank", limit: 20
    t.string "full_name", limit: 100
    t.string "email_address", limit: 100
    t.string "reference_no", limit: 100
    t.string "feedback", limit: 500
    t.string "created_date", limit: 20
    t.string "im_remark", limit: 500
    t.string "bank_remark", limit: 500
    t.string "rma_remark", limit: 500
    t.string "status", limit: 20
    t.string "im_updatedby", limit: 20
    t.date "im_updateddate"
    t.string "b_updatedby", limit: 20
    t.date "b_updateddate"
    t.string "rma_updatedby", limit: 20
    t.date "rma_updateddate"
  end

  create_table "ipg_transfer_moe", id: false, force: :cascade do |t|
    t.integer "id", precision: 38
    t.string "description_code", limit: 20
    t.string "status", limit: 20
  end

  create_table "ipg_web_profile", id: false, force: :cascade do |t|
    t.decimal "int"
    t.string "name", limit: 20
    t.string "status", limit: 20
  end

  create_table "itd_surrender", id: false, force: :cascade do |t|
    t.integer "lawid", precision: 38
    t.date "createdate"
    t.string "item_no", limit: 20
    t.string "item", limit: 20
    t.string "loaction", limit: 20
    t.string "remark", limit: 300
  end

  create_table "loanoutstanding", id: false, force: :cascade do |t|
    t.string "employeecode", limit: 20
    t.string "employeename", limit: 100
    t.decimal "emi"
    t.decimal "outstandingbal"
    t.date "asondate"
  end

  create_table "log_idx_stats_temp", id: false, force: :cascade do |t|
    t.decimal "height"
    t.decimal "blocks"
    t.string "name", limit: 30
    t.string "partition_name", limit: 30
    t.decimal "lf_rows"
    t.decimal "lf_blks"
    t.decimal "lf_rows_len"
    t.decimal "lf_blk_len"
    t.decimal "br_rows"
    t.decimal "br_blks"
    t.decimal "br_rows_len"
    t.decimal "br_blk_len"
    t.decimal "del_lf_rows"
    t.decimal "del_lf_rows_len"
    t.decimal "distinct_keys"
    t.decimal "most_repeated_key"
    t.decimal "btree_space"
    t.decimal "used_space"
    t.decimal "pct_used"
    t.decimal "rows_per_key"
    t.decimal "blks_gets_per_access"
    t.decimal "pre_rows"
    t.decimal "pre_rows_len"
    t.decimal "opt_cmpr_count"
    t.decimal "opt_cmpr_pctsave"
  end

  create_table "mainassetlist_passang", id: false, force: :cascade do |t|
    t.decimal "srlno"
    t.date "assetinservicedate"
    t.string "parentassetcode", limit: 35
    t.string "assetname", limit: 60
    t.decimal "basecost", precision: 12, scale: 2
    t.decimal "currentdepre", precision: 12, scale: 2
    t.decimal "accudepre", precision: 12, scale: 2
    t.decimal "closingvalue", precision: 12, scale: 2
    t.string "currentstatus", limit: 1
    t.decimal "writeoffvalue", precision: 12, scale: 2
  end

  create_table "menu_mst", id: false, force: :cascade do |t|
    t.string "menuid", limit: 10, null: false
    t.string "parentmenuid", limit: 10
    t.string "menuname", limit: 100
    t.string "url", limit: 200
    t.string "menu_hier", limit: 200
  end

  create_table "menu_mst_031109", id: false, force: :cascade do |t|
    t.string "menuid", limit: 10, null: false
    t.string "parentmenuid", limit: 10
    t.string "menuname", limit: 100
    t.string "url", limit: 200
    t.string "menu_hier", limit: 200
  end

  create_table "menu_mst_121107", id: false, force: :cascade do |t|
    t.string "menuid", limit: 10, null: false
    t.string "parentmenuid", limit: 10
    t.string "menuname", limit: 100
    t.string "url", limit: 200
    t.string "menu_hier", limit: 200
  end

  create_table "menu_mst_bak", id: false, force: :cascade do |t|
    t.string "menuid", limit: 10, null: false
    t.string "parentmenuid", limit: 10
    t.string "menuname", limit: 100
    t.string "url", limit: 200
    t.string "menu_hier", limit: 200
  end

  create_table "official_gold_mst", id: false, force: :cascade do |t|
    t.string "off_letter_no", limit: 500
    t.string "off_department_name", limit: 2000
    t.decimal "quantity"
    t.string "selling_price", limit: 100
    t.decimal "commission"
    t.decimal "net_balance"
    t.decimal "total_balance"
    t.string "nam", limit: 100
    t.string "designation", limit: 500
    t.date "cur_dat"
  end

  create_table "official_silver_mst", id: false, force: :cascade do |t|
    t.string "off_letter_no", limit: 100
    t.string "off_department_name", limit: 100
    t.decimal "quantity"
    t.string "selling_price", limit: 100
    t.decimal "commission"
    t.decimal "net_balance"
    t.decimal "total_balance"
    t.string "nam", limit: 100
    t.string "designation", limit: 100
    t.date "cur_dat"
  end

  create_table "ors_book_con_board", force: :cascade do |t|
    t.string "order_number", limit: 50, null: false
    t.string "application_status", limit: 10
    t.string "department_id", limit: 10
    t.string "duration", limit: 30
    t.datetime "from_date"
    t.string "items", limit: 500
    t.string "other", limit: 200
    t.integer "purpose", precision: 38
    t.string "remark", limit: 500
    t.datetime "to_date"
    t.string "createdby", limit: 100
    t.date "createddate"
    t.string "department_name", limit: 200
    t.string "verified_by", limit: 100
    t.date "verified_date"
    t.string "approved_by", limit: 100
    t.date "approve_date"
    t.integer "room", precision: 38
    t.string "approver_remark", limit: 500
    t.string "email"
    t.string "applicant", limit: 100
  end

  create_table "ors_hospitality", id: false, force: :cascade do |t|
    t.string "order_number", limit: 20, null: false
    t.date "application_date"
    t.integer "head_count", precision: 38
    t.string "item", limit: 200
    t.string "other_item", limit: 200
    t.string "attachment", limit: 500
    t.string "application_status", limit: 5
    t.string "file_location"
    t.string "file_name"
    t.string "file_type", limit: 200
    t.string "createdby", limit: 200
    t.date "createddate"
    t.string "approved_by", limit: 20
    t.date "approved_date"
    t.string "remark", limit: 500
    t.string "approve_remark", limit: 500
    t.integer "id", precision: 38
    t.string "email"
    t.integer "department_id", precision: 38
    t.string "applicant", limit: 100
    t.string "department_name", limit: 100
    t.string "location", limit: 200
    t.string "reason", limit: 200
    t.datetime "from_date"
    t.datetime "to_date"
  end

  create_table "ors_sa_committe", force: :cascade do |t|
    t.integer "application_type", precision: 38, comment: "1- Stationary Item Requisition, 2- Protocal & Hospitality. 3- Conference or board room booking"
    t.decimal "department", null: false
    t.string "employee_code"
    t.string "employee_name", limit: 100
    t.string "role", limit: 20
    t.string "createdby", limit: 200
    t.date "createddate"
  end

  create_table "pd_grn_fifo", id: false, force: :cascade do |t|
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

  create_table "pkconfig", id: false, force: :cascade do |t|
    t.decimal "recordid", null: false
    t.string "tablename", limit: 35, null: false
    t.string "fieldname", limit: 35, null: false
    t.decimal "pkvalue"
  end

  create_table "pkconfig_03102023", id: false, force: :cascade do |t|
    t.decimal "recordid", null: false
    t.string "tablename", limit: 35, null: false
    t.string "fieldname", limit: 35, null: false
    t.decimal "pkvalue"
  end

  create_table "pkconfig_04102021", id: false, force: :cascade do |t|
    t.decimal "recordid", null: false
    t.string "tablename", limit: 35, null: false
    t.string "fieldname", limit: 35, null: false
    t.decimal "pkvalue"
  end

  create_table "pkconfig_24102022", id: false, force: :cascade do |t|
    t.decimal "recordid", null: false
    t.string "tablename", limit: 35, null: false
    t.string "fieldname", limit: 35, null: false
    t.decimal "pkvalue"
  end

  create_table "pkconfig_30062024", id: false, force: :cascade do |t|
    t.decimal "recordid", null: false
    t.string "tablename", limit: 35, null: false
    t.string "fieldname", limit: 35, null: false
    t.decimal "pkvalue"
  end

  create_table "pkconfig_bkup", id: false, force: :cascade do |t|
    t.decimal "recordid"
    t.string "tablename", limit: 35
    t.string "fieldname", limit: 35
    t.decimal "pkvalue"
  end

# Could not dump table "plan_table" because of following StandardError
#   Unknown type 'LONG' for column 'other'

  create_table "pradipleave", id: false, force: :cascade do |t|
    t.string "yearcode", limit: 4
    t.decimal "employeeid"
    t.decimal "leavetypeid"
    t.date "transactiondate"
    t.decimal "bbffromprevyear"
  end

  create_table "pradipleave_new", id: false, force: :cascade do |t|
    t.string "yearcode", limit: 4
    t.decimal "employeeid"
    t.decimal "leavetypeid"
    t.date "transactiondate"
    t.decimal "bbffromprevyear"
  end

  create_table "private_gold_mst", id: false, force: :cascade do |t|
    t.string "pri_name", limit: 100
    t.string "pri_cid", limit: 20
    t.decimal "quantity"
    t.decimal "selling_price"
    t.decimal "commission"
    t.decimal "net_balance"
    t.decimal "total_balance"
    t.string "nam", limit: 100
    t.string "designation", limit: 500
    t.date "cur_dat"
  end

  create_table "private_silver_mst", id: false, force: :cascade do |t|
    t.string "pri_name", limit: 100
    t.string "pri_cid", limit: 100
    t.decimal "quantity"
    t.decimal "selling_price"
    t.decimal "commission"
    t.decimal "net_balance"
    t.decimal "total_balance"
    t.string "nam", limit: 100
    t.string "designation", limit: 100
    t.date "cur_dat"
  end

  create_table "profile_mst", id: false, force: :cascade do |t|
    t.string "profileid", limit: 5, null: false
    t.string "profilename", limit: 25
  end

  create_table "profile_rights", id: false, force: :cascade do |t|
    t.string "profileid", limit: 5
    t.string "menuid", limit: 10
    t.string "actionid", limit: 5
  end

  create_table "quest_com_product_privs", primary_key: ["product_id", "install_user", "privilege_id"], force: :cascade do |t|
    t.decimal "product_id", null: false
    t.string "privilege_id", limit: 60, null: false
    t.string "privilege_description", limit: 256, null: false
    t.string "validation_routine", limit: 2000
    t.string "privilege_level", limit: 256
    t.string "install_user", limit: 30, null: false
  end

# Could not dump table "quest_com_products" because of following StandardError
#   Unknown type 'LONG' for column 'deinstall_script'

  create_table "quest_com_products_used_by", primary_key: ["product_id", "install_user", "used_by_product_id"], force: :cascade do |t|
    t.decimal "product_id", null: false
    t.decimal "used_by_product_id", null: false
    t.string "product_version", limit: 20
    t.string "install_user", limit: 30, default: "<UNKNOWN>", null: false
  end

  create_table "quest_com_user_privileges", primary_key: ["product_id", "install_user", "user_id", "privilege_id"], force: :cascade do |t|
    t.decimal "product_id", null: false
    t.decimal "user_id", null: false
    t.string "privilege_id", limit: 60, null: false
    t.string "privilege_level", limit: 2000
    t.string "install_user", limit: 30, null: false
  end

  create_table "quest_com_users", primary_key: ["user_id", "product_id", "install_user"], force: :cascade do |t|
    t.decimal "user_id", null: false
    t.decimal "product_id", null: false
    t.string "authorization_level", limit: 60
    t.string "install_user", limit: 30, null: false
  end

  create_table "rma_labour", id: false, force: :cascade do |t|
    t.date "transaction_date"
    t.date "due_date"
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

  create_table "rpt_mid_balance", id: false, force: :cascade do |t|
    t.decimal "cy_id"
    t.decimal "cytype_id"
    t.decimal "denom_motif_id"
    t.date "from_date"
    t.date "to_date"
    t.decimal "opening_balance_pieces", default: "0.0"
    t.decimal "opening_balance_value", default: "0.0"
    t.decimal "trans_balance_pieces", default: "0.0"
    t.decimal "trans_balance_amount", default: "0.0"
    t.decimal "rpt_mid_id"
  end

  create_table "rptanexure1", id: false, force: :cascade do |t|
    t.string "empcode", limit: 10
    t.string "empname", limit: 100
    t.string "joindate", limit: 20
    t.string "acno", limit: 40
    t.decimal "contriamt", precision: 12, scale: 2
    t.decimal "arrers", precision: 12, scale: 2
    t.decimal "balance", precision: 12, scale: 2
  end

  create_table "rptbudgetwktbl1", id: false, force: :cascade do |t|
    t.decimal "groupid"
    t.string "groupname", limit: 50
    t.decimal "subgroupid"
    t.string "subgroupname", limit: 50
    t.decimal "glid"
    t.string "glname", limit: 50
    t.decimal "finyr1", precision: 15, scale: 2
    t.decimal "finyr2", precision: 15, scale: 2
    t.decimal "finyr3", precision: 15, scale: 2
    t.decimal "finyr4", precision: 15, scale: 2
    t.decimal "finyr5", precision: 15, scale: 2
  end

  create_table "rptbudgetwktbl2", id: false, force: :cascade do |t|
    t.decimal "glid"
    t.decimal "amount", precision: 15, scale: 2
  end

  create_table "sa_branch", primary_key: "br_code", id: { limit: 10, precision: 10 }, force: :cascade do |t|
    t.string "createdby", null: false
    t.datetime "createddate", null: false
    t.string "modifiedby"
    t.datetime "modifieddate"
    t.string "br_name"
    t.integer "br_status", limit: 10, precision: 10
  end

  create_table "sa_employee_details", primary_key: "employee_id", id: :string, force: :cascade do |t|
    t.string "createdby", null: false
    t.datetime "createddate", null: false
    t.string "modifiedby"
    t.datetime "modifieddate"
    t.string "agency"
    t.string "cid"
    t.string "division"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "position_level"
    t.string "position_title"
    t.string "second_name"
    t.integer "status", limit: 10, precision: 10
  end

  create_table "sa_group_permission", primary_key: "permissionid", id: { limit: 19, precision: 19 }, force: :cascade do |t|
    t.string "createdby", null: false
    t.datetime "createddate", null: false
    t.string "modifiedby"
    t.datetime "modifieddate"
    t.integer "group_id", limit: 10, precision: 10
    t.string "isdelete", limit: 1
    t.string "isedit", limit: 1
    t.string "issave", limit: 1
    t.string "isview", limit: 1
    t.string "screenid"
  end

  create_table "sa_password_policy", primary_key: "pass_id", id: { limit: 10, precision: 10 }, force: :cascade do |t|
    t.string "createdby", null: false
    t.datetime "createddate", null: false
    t.string "modifiedby"
    t.datetime "modifieddate"
    t.boolean "pass_enforce"
    t.boolean "pass_valid"
    t.boolean "pass_length"
    t.boolean "pass_special"
  end

  create_table "sa_user", primary_key: "userid", id: { limit: 19, precision: 19 }, force: :cascade do |t|
    t.string "createdby", null: false
    t.datetime "createddate", null: false
    t.string "modifiedby"
    t.datetime "modifieddate"
    t.string "emailid"
    t.string "employeeid"
    t.string "fullname", null: false
    t.integer "groupid", limit: 10, precision: 10, null: false
    t.boolean "badcredential"
    t.string "password", null: false
    t.datetime "passwordexpirydate"
    t.string "status", limit: 1, null: false
    t.string "username", null: false
    t.index ["username"], name: "uk_t6gtu8c0k6ivwu4myah7n8gok", unique: true
  end

  create_table "slbalance", primary_key: ["slbalanceid", "finyrid", "glid", "slid"], force: :cascade do |t|
    t.decimal "slbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25, null: false
    t.decimal "glid", null: false
    t.decimal "slid", null: false
    t.string "slcode", limit: 25, null: false
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "slbalance100218", id: false, force: :cascade do |t|
    t.decimal "slbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25, null: false
    t.decimal "glid", null: false
    t.decimal "slid", null: false
    t.string "slcode", limit: 25, null: false
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "slbalance_14052016", id: false, force: :cascade do |t|
    t.decimal "slbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25, null: false
    t.decimal "glid", null: false
    t.decimal "slid", null: false
    t.string "slcode", limit: 25, null: false
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "slbalance_22032016", id: false, force: :cascade do |t|
    t.decimal "slbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25, null: false
    t.decimal "glid", null: false
    t.decimal "slid", null: false
    t.string "slcode", limit: 25, null: false
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "slbalance_bkup", id: false, force: :cascade do |t|
    t.decimal "slbalanceid", null: false
    t.decimal "finyrid", null: false
    t.string "finyrcode", limit: 25, null: false
    t.decimal "glid", null: false
    t.decimal "slid", null: false
    t.string "slcode", limit: 25, null: false
    t.decimal "openingdr", precision: 20, scale: 2
    t.decimal "openingcr", precision: 20, scale: 2
    t.decimal "closingdr", precision: 20, scale: 2
    t.decimal "closingcr", precision: 20, scale: 2
    t.decimal "prevyrclosebal"
    t.decimal "currencyid"
  end

  create_table "stats_icbs_091211", id: false, force: :cascade do |t|
    t.string "statid", limit: 30
    t.string "type", limit: 1
    t.decimal "version"
    t.decimal "flags"
    t.string "c1", limit: 30
    t.string "c2", limit: 30
    t.string "c3", limit: 30
    t.string "c4", limit: 30
    t.string "c5", limit: 30
    t.decimal "n1"
    t.decimal "n2"
    t.decimal "n3"
    t.decimal "n4"
    t.decimal "n5"
    t.decimal "n6"
    t.decimal "n7"
    t.decimal "n8"
    t.decimal "n9"
    t.decimal "n10"
    t.decimal "n11"
    t.decimal "n12"
    t.date "d1"
    t.raw "r1", limit: 32
    t.raw "r2", limit: 32
    t.string "ch1", limit: 1000
    t.text "cl1"
    t.index ["statid", "type", "c5", "c1", "c2", "c3", "c4", "version"], name: "stats_icbs_091211"
  end

  create_table "sudip", id: false, force: :cascade do |t|
    t.decimal "audit_sessions_id"
    t.decimal "user_id", null: false
    t.date "session_start", null: false
  end

  create_table "sudip_astabrata", id: false, force: :cascade do |t|
    t.string "code", limit: 100
    t.decimal "value1", precision: 15, scale: 2
    t.decimal "value2", precision: 15, scale: 2
    t.decimal "value3", precision: 15, scale: 2
  end

  create_table "sudip_astabrata2", id: false, force: :cascade do |t|
    t.string "code", limit: 100
    t.decimal "value1", precision: 15, scale: 2
    t.decimal "value2", precision: 15, scale: 2
    t.decimal "value3", precision: 15, scale: 2
  end

  create_table "sudip_astabrata3", id: false, force: :cascade do |t|
    t.string "code", limit: 100
    t.decimal "value1", precision: 15, scale: 2
    t.decimal "value2", precision: 15, scale: 2
    t.decimal "value3", precision: 15, scale: 2
    t.decimal "value4", precision: 15, scale: 2
    t.decimal "value5", precision: 15, scale: 2
  end

  create_table "sudip_astabrata4", id: false, force: :cascade do |t|
    t.string "code", limit: 100
    t.decimal "value1", precision: 15, scale: 2
    t.decimal "value2", precision: 15, scale: 2
    t.decimal "value3", precision: 15, scale: 2
  end

  create_table "sus", id: false, force: :cascade do |t|
    t.string "comp_name", limit: 100
    t.decimal "comp_value"
    t.decimal "rs"
    t.decimal "ma"
    t.decimal "fs"
    t.decimal "weight"
    t.decimal "prod"
    t.string "raw_status", limit: 20
    t.decimal "rid"
    t.string "filngname", limit: 40
    t.string "return_year", limit: 4
    t.string "return_month", limit: 9
    t.string "ratio_type", limit: 9
    t.decimal "perf"
    t.decimal "manuals"
    t.decimal "ordernum"
    t.decimal "ir"
    t.decimal "ratio_index"
    t.decimal "compo"
    t.string "ews1", limit: 250
    t.string "ews2", limit: 250
    t.string "ews3", limit: 250
    t.string "ews4", limit: 250
  end

  create_table "sys_export_full_01", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_00004701f_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_00004701f_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170914", unique: true
  end

  create_table "sys_export_full_02", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_0000498d0_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_0000498d0_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170915", unique: true
  end

  create_table "sys_export_full_03", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000055049_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000055049_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170932", unique: true
  end

  create_table "sys_export_full_04", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000055303_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000055303_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170933", unique: true
  end

  create_table "sys_export_full_05", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000056847_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000056847_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170934", unique: true
  end

  create_table "sys_export_full_06", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000056b4f_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000056b4f_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170935", unique: true
  end

  create_table "sys_export_full_07", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000056e57_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000056e57_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170936", unique: true
  end

  create_table "sys_export_full_08", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_00005715f_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_00005715f_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170937", unique: true
  end

  create_table "sys_export_full_09", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000057314_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000057314_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170938", unique: true
  end

  create_table "sys_export_full_10", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_0000573e8_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_0000573e8_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170939", unique: true
  end

  create_table "sys_export_full_11", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_00005744a_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_00005744a_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170940", unique: true
  end

  create_table "sys_export_full_12", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_0000576e1_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_0000576e1_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170941", unique: true
  end

  create_table "sys_export_full_13", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000057743_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000057743_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170942", unique: true
  end

  create_table "sys_export_full_14", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000058391_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000058391_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170943", unique: true
  end

  create_table "sys_export_full_15", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_000058628_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_000058628_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170944", unique: true
  end

  create_table "sys_export_full_16", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_00005868a_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_00005868a_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170945", unique: true
  end

  create_table "sys_export_full_17", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_00005ae5f_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_00005ae5f_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170946", unique: true
  end

  create_table "sys_export_full_18", id: false, comment: "Data Pump Master Table EXPORT                         FULL                          ", force: :cascade do |t|
    t.decimal "process_order"
    t.decimal "duplicate"
    t.decimal "dump_fileid"
    t.decimal "dump_position"
    t.decimal "dump_length"
    t.decimal "dump_orig_length"
    t.decimal "dump_allocation"
    t.decimal "completed_rows"
    t.decimal "error_count"
    t.decimal "elapsed_time"
    t.string "object_type_path", limit: 200
    t.decimal "object_path_seqno"
    t.string "object_type", limit: 30
    t.string "in_progress", limit: 1
    t.string "object_name", limit: 500
    t.string "object_long_name", limit: 4000
    t.string "object_schema", limit: 30
    t.string "original_object_schema", limit: 30
    t.string "original_object_name", limit: 4000
    t.string "partition_name", limit: 30
    t.string "subpartition_name", limit: 30
    t.decimal "dataobj_num"
    t.decimal "flags"
    t.decimal "property"
    t.decimal "trigflag"
    t.decimal "creation_level"
    t.date "completion_time"
    t.string "object_tablespace", limit: 30
    t.decimal "size_estimate"
    t.decimal "object_row"
    t.string "processing_state", limit: 1
    t.string "processing_status", limit: 1
    t.decimal "base_process_order"
    t.string "base_object_type", limit: 30
    t.string "base_object_name", limit: 30
    t.string "base_object_schema", limit: 30
    t.decimal "ancestor_process_order"
    t.decimal "domain_process_order"
    t.decimal "parallelization"
    t.decimal "unload_method"
    t.decimal "load_method"
    t.decimal "granules"
    t.decimal "scn"
    t.string "grantor", limit: 30
    t.text "xml_clob"
    t.decimal "parent_process_order"
    t.string "name", limit: 30
    t.string "value_t", limit: 4000
    t.decimal "value_n"
    t.decimal "is_default"
    t.decimal "file_type"
    t.string "user_directory", limit: 4000
    t.string "user_file_name", limit: 4000
    t.string "file_name", limit: 4000
    t.decimal "extend_size"
    t.decimal "file_max_size"
    t.string "process_name", limit: 30
    t.date "last_update"
    t.string "work_item", limit: 30
    t.decimal "object_number"
    t.decimal "completed_bytes"
    t.decimal "total_bytes"
    t.decimal "metadata_io"
    t.decimal "data_io"
    t.decimal "cumulative_time"
    t.decimal "packet_number"
    t.decimal "instance_id"
    t.string "old_value", limit: 4000
    t.decimal "seed"
    t.decimal "last_file"
    t.string "user_name", limit: 30
    t.string "operation", limit: 30
    t.string "job_mode", limit: 30
    t.decimal "queue_tabnum"
    t.string "control_queue", limit: 30
    t.string "status_queue", limit: 30
    t.string "remote_link", limit: 4000
    t.decimal "version"
    t.string "job_version", limit: 30
    t.string "db_version", limit: 30
    t.string "timezone", limit: 64
    t.string "state", limit: 30
    t.decimal "phase"
    t.raw "guid", limit: 16
    t.date "start_time"
    t.decimal "block_size"
    t.decimal "metadata_buffer_size"
    t.decimal "data_buffer_size"
    t.decimal "degree"
    t.string "platform", limit: 101
    t.decimal "abort_step"
    t.string "instance", limit: 60
    t.decimal "cluster_ok"
    t.string "service_name", limit: 100
    t.string "object_int_oid", limit: 32
    t.index ["base_process_order"], name: "sys_mtable_00005b167_ind_2"
    t.index ["object_schema", "object_name", "object_type"], name: "sys_mtable_00005b167_ind_1"
    t.index ["process_order", "duplicate"], name: "sys_c00170947", unique: true
  end

  create_table "tbl_banking", id: false, force: :cascade do |t|
    t.integer "lawid", precision: 38, null: false
    t.string "lawheading", limit: 100
    t.text "lawdescription"
    t.string "status", limit: 1
    t.string "firstfilename", limit: 100
    t.string "secondfilename", limit: 100
    t.string "thirdfilename", limit: 100
    t.binary "firstfile"
    t.binary "secondfile"
    t.binary "thirdfile"
    t.string "createdate", limit: 50
  end

  create_table "tbl_chest_gl_mapping", id: false, force: :cascade do |t|
    t.decimal "chest_glid"
    t.decimal "glid"
  end

  create_table "tbl_chestonline", id: false, force: :cascade do |t|
    t.integer "lawid", precision: 38, null: false
    t.string "lawheading", limit: 100
    t.text "lawdescription"
    t.string "status", limit: 1
    t.string "firstfilename", limit: 100
    t.string "secondfilename", limit: 100
    t.string "thirdfilename", limit: 100
    t.binary "firstfile"
    t.binary "secondfile"
    t.binary "thirdfile"
    t.string "createdate", limit: 50
  end

  create_table "tbl_drc", id: false, force: :cascade do |t|
    t.integer "lawid", precision: 38, null: false
    t.string "lawheading", limit: 100
    t.text "lawdescription"
    t.string "status", limit: 1
    t.string "firstfilename", limit: 100
    t.string "secondfilename", limit: 100
    t.string "thirdfilename", limit: 100
    t.binary "firstfile"
    t.binary "secondfile"
    t.binary "thirdfile"
    t.string "createdate", limit: 50
  end

  create_table "tbl_intweb", primary_key: "headingid", id: :decimal, force: :cascade do |t|
    t.string "heading", limit: 500
    t.date "showdate"
  end

  create_table "tbl_reconciliation", id: false, force: :cascade do |t|
    t.integer "lawid", precision: 38, null: false
    t.string "lawheading", limit: 100
    t.text "lawdescription"
    t.string "status", limit: 1
    t.string "firstfilename", limit: 100
    t.string "secondfilename", limit: 100
    t.string "thirdfilename", limit: 100
    t.binary "firstfile"
    t.binary "secondfile"
    t.binary "thirdfile"
    t.string "createdate", limit: 50
  end

  create_table "tbl_reconciliation_bkup", id: false, force: :cascade do |t|
    t.integer "lawid", precision: 38, null: false
    t.string "lawheading", limit: 100
    t.text "lawdescription"
    t.string "status", limit: 1
    t.string "firstfilename", limit: 100
    t.string "secondfilename", limit: 100
    t.string "thirdfilename", limit: 100
    t.binary "firstfile"
    t.binary "secondfile"
    t.binary "thirdfile"
    t.string "createdate", limit: 50
  end

  create_table "tbl_reg_dtl", primary_key: "emp_id", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "particulars", limit: 200
    t.decimal "quantity"
    t.string "remarks", limit: 300
  end

  create_table "tbl_reg_hdr", primary_key: "emp_id", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "emp_name", limit: 100
    t.string "division", limit: 100
  end

  create_table "tbl_return_file_history", id: false, force: :cascade do |t|
    t.string "file_name", limit: 150
    t.integer "submission_user", precision: 38
    t.string "submission_maker_comment", limit: 200
    t.string "submission_checker_comment", limit: 200
    t.string "submission_user_type", limit: 150
    t.date "submission_time"
    t.integer "acceptance_flag", precision: 38
    t.string "received_rejected_cause", limit: 200
    t.integer "rma_fisd_user", precision: 38
    t.date "received_rejected_time"
    t.integer "fi_id", precision: 38
    t.string "return_month", limit: 20
    t.decimal "return_year"
    t.string "maker", limit: 200
    t.string "checker", limit: 200
    t.string "version", limit: 5
  end

  create_table "tbl_return_file_history_bak", id: false, force: :cascade do |t|
    t.string "file_name", limit: 150
    t.integer "submission_user", precision: 38
    t.string "submission_maker_comment", limit: 200
    t.string "submission_checker_comment", limit: 200
    t.string "submission_user_type", limit: 150
    t.date "submission_time"
    t.integer "acceptance_flag", precision: 38
    t.string "received_rejected_cause", limit: 200
    t.integer "rma_fisd_user", precision: 38
    t.date "received_rejected_time"
    t.integer "fi_id", precision: 38
    t.string "return_month", limit: 20
    t.decimal "return_year"
    t.string "maker", limit: 200
    t.string "checker", limit: 200
    t.string "version", limit: 5
  end

  create_table "tbl_suspicious_transaction", id: false, force: :cascade do |t|
    t.decimal "fi_id"
    t.decimal "foryear"
    t.string "formonth", limit: 25
    t.string "customername", limit: 200
    t.string "presentaddress", limit: 400
    t.string "accountno", limit: 100
    t.decimal "tran_amount", precision: 15, scale: 2
    t.string "debit_credit", limit: 100
    t.date "transaction_date"
    t.string "tran_nature", limit: 50
    t.string "org_ben_details", limit: 400
  end

  create_table "tbl_swf_committee", id: false, force: :cascade do |t|
    t.decimal "id"
    t.string "employeecode", limit: 20
    t.string "designation", limit: 100
    t.string "emailid", limit: 100
    t.string "role", limit: 50
    t.string "status", limit: 1
    t.string "employeename", limit: 100
    t.decimal "department"
    t.decimal "screenid"
  end

  create_table "tbl_swf_empcontribution", id: false, force: :cascade do |t|
    t.decimal "id"
    t.string "employeecode", limit: 20
    t.string "employeename", limit: 200
    t.decimal "year"
    t.decimal "month"
    t.decimal "amount", precision: 18, scale: 2
    t.string "createdby", limit: 200
    t.date "createddate", null: false
    t.decimal "divisionid"
  end

  create_table "tbl_swf_empgrant", id: { limit: 10, precision: 10 }, force: :cascade do |t|
    t.string "cidno"
    t.string "createdby"
    t.datetime "createddate"
    t.datetime "deathdate"
    t.string "deathplace"
    t.string "deathtime"
    t.string "deceasedname"
    t.string "division"
    t.integer "empcontribution", limit: 10, precision: 10
    t.string "employeecode"
    t.integer "grantclaimed", limit: 10, precision: 10
    t.integer "officecontribution", limit: 10, precision: 10
    t.string "relationship"
    t.datetime "releaseddate"
    t.string "employeename", limit: 100
    t.string "designation", limit: 100
    t.decimal "divisionid"
  end

  create_table "tbl_swf_loan_application", primary_key: "applicationno", id: { type: :string, limit: 25 }, force: :cascade do |t|
    t.string "loanaccno", limit: 100
    t.integer "loanid", precision: 38
    t.decimal "employeeid"
    t.string "employeecode", limit: 20
    t.string "employeename", limit: 20
    t.date "applicationdate"
    t.decimal "loanamount", precision: 18, scale: 2
    t.decimal "netpay", precision: 18, scale: 2
    t.integer "recoveryperiod", precision: 38
    t.string "repaymentfrequency", limit: 20
    t.decimal "maxamount", precision: 18, scale: 2
    t.integer "noofinstalment", precision: 38
    t.decimal "interestrate", precision: 18, scale: 2
    t.date "disbursedate"
    t.decimal "disburseamt", precision: 18, scale: 2
    t.string "transactionmode", limit: 20
    t.decimal "emi", precision: 18, scale: 2
    t.date "firstrepaydate"
    t.integer "txnid", precision: 38
    t.integer "edrid", precision: 38
    t.string "interesttype", limit: 20
    t.string "repayunit", limit: 20
    t.string "fullyrepay", limit: 20
    t.date "closingdate"
    t.string "remarks", limit: 500
    t.decimal "penaltychargeperiod", precision: 18, scale: 2
    t.string "penaltytype", limit: 20
    t.decimal "penaltyrate", precision: 18, scale: 2
    t.decimal "maxrepayperiod", precision: 18, scale: 2
    t.string "bankaccid", limit: 20
    t.string "bankglid", limit: 20
    t.decimal "eligibleamt", precision: 18, scale: 2
    t.string "vchno", limit: 20
    t.decimal "verifiedamount", precision: 18, scale: 2
    t.string "status", limit: 20
    t.string "createdby", limit: 20
    t.date "createdate"
    t.string "modifyby", limit: 20
    t.date "modifydate"
    t.string "verifiedby", limit: 20
    t.date "verificationdate"
    t.string "verifyremarks", limit: 500
    t.string "rejectedby", limit: 20
    t.date "rejecteddate"
    t.string "approvedby", limit: 200
  end

  create_table "tbl_swf_loanapproval", primary_key: ["approverid", "loanno"], force: :cascade do |t|
    t.string "loanno", limit: 30, null: false
    t.string "approverid", null: false
    t.date "approverdate"
    t.string "approvername", limit: 100
    t.string "status", limit: 20
    t.string "remarks", limit: 500
  end

  create_table "tbl_swf_repayment", id: :decimal, force: :cascade do |t|
    t.string "employeecode", limit: 20
    t.string "employeename", limit: 200
    t.date "paymentdate"
    t.decimal "payyear"
    t.decimal "paymonth"
    t.decimal "emi", precision: 18, scale: 2
    t.string "createdby", limit: 200
    t.date "createddate"
    t.decimal "divisionid"
  end

  create_table "tbl_template_history", id: false, force: :cascade do |t|
    t.integer "id", precision: 38
    t.string "return_type", limit: 50
    t.string "temp_name", limit: 150
    t.string "sheet_name", limit: 200
    t.date "date_time"
    t.string "user_id", limit: 150
    t.string "cell", limit: 150
    t.string "cell_val", limit: 150
  end

  create_table "tbl_template_ver", id: false, force: :cascade do |t|
    t.integer "file_id", precision: 38
    t.string "file_type", limit: 5
    t.string "file_name", limit: 150
    t.string "user_name", limit: 100, default: "icbs"
    t.date "creation_date_time"
    t.string "remarks", limit: 200
    t.string "template_type", limit: 50
    t.string "user_id", limit: 5
  end

  create_table "tbl_template_ver_12012010", id: false, force: :cascade do |t|
    t.integer "file_id", precision: 38
    t.string "file_type", limit: 5
    t.string "file_name", limit: 150
    t.string "user_name", limit: 100
    t.date "creation_date_time"
    t.string "remarks", limit: 200
    t.string "template_type", limit: 50
    t.string "user_id", limit: 5
  end

  create_table "tbl_template_ver_bak", id: false, force: :cascade do |t|
    t.integer "file_id", precision: 38
    t.string "file_type", limit: 5
    t.string "file_name", limit: 150
    t.string "user_name", limit: 100
    t.date "creation_date_time"
    t.string "remarks", limit: 200
    t.string "template_type", limit: 50
    t.string "user_id", limit: 5
  end

  create_table "tbl_template_ver_bkup", id: false, force: :cascade do |t|
    t.integer "file_id", precision: 38
    t.string "file_type", limit: 5
    t.string "file_name", limit: 150
    t.string "remarks", limit: 200
    t.date "creation_date_time"
    t.string "user_name", limit: 100
  end

  create_table "tbl_template_ver_bkup1", id: false, force: :cascade do |t|
    t.integer "file_id", precision: 38
    t.string "file_type", limit: 5
    t.string "file_name", limit: 150
    t.string "remarks", limit: 200
    t.date "creation_date_time"
    t.string "user_name", limit: 100
  end

  create_table "tbl_test", id: false, force: :cascade do |t|
    t.decimal "slid", null: false
    t.string "slcode", limit: 12, null: false
    t.string "slhead", limit: 40, null: false
    t.decimal "glid"
    t.decimal "sltypeid", null: false
    t.date "createdate"
    t.date "modifydate"
    t.string "createdby", limit: 5
    t.string "modifiedby", limit: 5
  end

  create_table "tbl_test_bank", id: false, force: :cascade do |t|
    t.string "bold_yn", limit: 2
    t.decimal "slno", precision: 10, scale: 2
    t.decimal "sub_serial", precision: 10, scale: 2
    t.string "particulars", limit: 300
    t.string "loan_type", limit: 50
    t.decimal "bank1", precision: 15, scale: 2
    t.decimal "bank2", precision: 15, scale: 2
    t.decimal "bank3", precision: 15, scale: 2
    t.decimal "bank4", precision: 15, scale: 2
    t.decimal "bank5", precision: 15, scale: 2
    t.decimal "bank6", precision: 15, scale: 2
    t.decimal "bank7", precision: 15, scale: 2
    t.decimal "bank8", precision: 15, scale: 2
    t.decimal "bank9", precision: 15, scale: 2
    t.decimal "bank10", precision: 15, scale: 2
    t.decimal "bank11", precision: 15, scale: 2
    t.decimal "bank12", precision: 15, scale: 2
    t.decimal "bank_total", precision: 15, scale: 2
    t.decimal "nonbank_total", precision: 15, scale: 2
    t.decimal "grand_total", precision: 15, scale: 2
  end

  create_table "tbl_test_sam", id: false, force: :cascade do |t|
    t.decimal "fiid", null: false
    t.string "ficode", limit: 25, null: false
    t.string "fitype", limit: 4, null: false
    t.string "fishtname", limit: 10, null: false
    t.string "filngname", limit: 40, null: false
    t.string "fihoadrsln1", limit: 40, null: false
    t.string "fihoadrsln2", limit: 40
    t.string "fihoadrsln3", limit: 40
    t.string "fihoadrsln4", limit: 40
    t.string "fiphone", limit: 25
    t.string "fifax", limit: 25
    t.string "fiyearofestablishment", limit: 4, null: false
    t.string "fiemail", limit: 40
    t.string "fiservicetype", limit: 250
    t.string "filicenseno", limit: 40
    t.date "filicenseissuedate"
    t.string "filicenserenewalno", limit: 40
    t.date "filicenserenewaldate"
    t.decimal "filicenserenwalfees", precision: 14, scale: 2
    t.decimal "fifinstartmonth", null: false
    t.decimal "fifinendmonth", null: false
    t.decimal "fistaffstrength"
    t.string "firemarks", limit: 250
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.string "contactperson", limit: 40
    t.string "designation", limit: 40
    t.string "contemail", limit: 40
  end

  create_table "tblacademicqualificationdtl", primary_key: ["academicqualiid", "academicsubjectid"], force: :cascade do |t|
    t.decimal "academicqualiid", null: false
    t.decimal "academicsubjectid", null: false
    t.decimal "linenumber", null: false
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
  end

  create_table "tblacademicqualificationhdr", primary_key: "academicqualiid", id: :decimal, force: :cascade do |t|
    t.string "academicqualicode", limit: 25, null: false
    t.string "academicqualidesc", limit: 50, null: false
    t.string "academicqualigroup", limit: 1, null: false
    t.decimal "fullmarkswritten", null: false
    t.decimal "fullmarksinterview", null: false
    t.decimal "weightedpcntaca", null: false
    t.decimal "weightedpcntwritten", null: false
    t.decimal "weightedpcntinterview", null: false
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.index ["academicqualicode"], name: "unq_academicqualificationhdr", unique: true, tablespace: "icbs"
  end

  create_table "tblacademicsubjectmst", primary_key: "academicsubjectid", id: :decimal, force: :cascade do |t|
    t.string "academicsubjectcode", limit: 25, null: false
    t.string "academicsubjectdesc", limit: 40, null: false
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.index ["academicsubjectcode"], name: "unq_tblacademicsubjectmst", unique: true, tablespace: "icbs"
  end

  create_table "tblaccounttransfer", primary_key: "accounttransfer_id", id: :decimal, force: :cascade do |t|
    t.date "transferdate"
    t.decimal "transfer"
    t.decimal "charges"
    t.decimal "transferred"
    t.decimal "bank_id_a"
    t.decimal "branch_id_a"
    t.decimal "bankac_id_a"
    t.decimal "bank_id_b"
    t.decimal "branch_id_b"
    t.decimal "bank_id_c"
    t.decimal "branch_id_c"
    t.decimal "bankac_id_c"
    t.decimal "bank_id_d"
    t.decimal "branch_id_d"
    t.string "remarks", limit: 250
    t.decimal "verify_by"
    t.date "verify_date"
    t.decimal "reject_by"
    t.date "reject_date"
    t.decimal "auth_by"
    t.date "auth_date"
    t.decimal "created_by"
    t.date "create_date"
    t.decimal "modified_by"
    t.date "modify_date"
  end

  create_table "tblacctypemst", primary_key: "acc_type_id", id: :decimal, force: :cascade do |t|
    t.string "acc_type_code", limit: 25, null: false
    t.string "acc_type", limit: 40, null: false
    t.decimal "min_amount", precision: 15, scale: 2
    t.decimal "tranchetype_id", null: false
    t.string "status", limit: 1
    t.decimal "created_by"
    t.date "create_date"
    t.decimal "modified_by"
    t.date "modify_date"
    t.index ["acc_type"], name: "sys_c00150458", unique: true, tablespace: "icbs"
    t.index ["acc_type_code"], name: "sys_c00150457", unique: true, tablespace: "icbs"
  end

  create_table "tbladhocdeductiondtl", primary_key: "adhocdeductiondtlid", id: :decimal, force: :cascade do |t|
    t.decimal "adhocdeductionhdrid", null: false
    t.decimal "empid", null: false
    t.decimal "amount", null: false
  end

  create_table "tbladhocdeductionhdr", primary_key: "adhocdeductionhdrid", id: :decimal, force: :cascade do |t|
    t.date "effectivedate", null: false
    t.string "effectiveyearmonth", limit: 6, null: false
    t.decimal "glid", null: false
    t.decimal "amount", null: false
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.date "approvaldate"
    t.string "approvedby", limit: 5
    t.string "isapproved", limit: 1, default: "N"
    t.string "particulars", limit: 500
  end

  create_table "tbladvanceadjust", primary_key: "extloanid", id: :decimal, force: :cascade do |t|
    t.decimal "employeeid", null: false
    t.decimal "monthlyrecoveryamt", precision: 15, scale: 2
    t.date "fromdate"
    t.date "todate"
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.decimal "loanid"
    t.decimal "glid"
  end

  create_table "tbladvertisementdetail", primary_key: ["advid", "postcreationid", "designationid", "gradeid"], force: :cascade do |t|
    t.decimal "advid", null: false
    t.decimal "postcreationid", null: false
    t.decimal "designationid", null: false
    t.decimal "gradeid", null: false
    t.decimal "linenumber", null: false
    t.decimal "categoryid", null: false
    t.decimal "payscalemin", precision: 12, scale: 2
    t.decimal "payscaleincrement", precision: 12, scale: 2
    t.decimal "payscalemax", precision: 12, scale: 2
    t.decimal "noofpost"
    t.decimal "minimumage"
    t.decimal "maximumage"
    t.decimal "requiredqualification"
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.string "advtype", limit: 2
  end

  create_table "tbladvertisementheader", primary_key: "advid", id: :decimal, force: :cascade do |t|
    t.string "advnumber", limit: 35, null: false
    t.string "advreferenceno", limit: 35, null: false
    t.date "advreferencedate", null: false
    t.date "lastdateapply", null: false
    t.string "medianame", limit: 60
    t.date "advpublisheddate"
    t.decimal "advcost", precision: 12, scale: 2
    t.string "remarks", limit: 50
    t.string "statuslocked", limit: 1
    t.string "submissionplace", limit: 50
    t.string "submissiontime", limit: 10
    t.date "createdate", null: false
    t.date "modifydate"
    t.string "createdby", limit: 5, null: false
    t.string "modifiedby", limit: 5
    t.decimal "approverid"
    t.string "approverremarks", limit: 250
    t.decimal "compiledby"
    t.index ["advnumber"], name: "unq_tbladvertisementheader", unique: true, tablespace: "icbs"
  end

  create_table "tbladvertisementspecifications", primary_key: ["advid", "linenumber"], force: :cascade do |t|
    t.decimal "advid", null: false
    t.decimal "linenumber", null: false
    t.string "specifications", limit: 300, null: false
  end

  create_table "tblagencymst", primary_key: "agency_id", id: :decimal, force: :cascade do |t|
    t.string "agency_code", limit: 25
    t.string "agency_name", limit: 100
    t.string "agency_type", limit: 1
    t.decimal "created_by"
    t.decimal "modified_by"
    t.date "create_date"
    t.date "modify_date"
  end

  create_table "tblalternetapprovalmst", primary_key: "alt_approve_id", id: :decimal, force: :cascade do |t|
    t.decimal "vault_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.string "approval_to", limit: 5
    t.decimal "jc1_id"
    t.decimal "jc2_id"
    t.string "status", limit: 1, default: "A"
    t.string "remarks", limit: 250
    t.decimal "created_by"
    t.date "create_date"
    t.decimal "modified_by"
    t.date "modify_date"
  end

  create_table "tblamc_agencymst", primary_key: "tblamc_agencymst_sagencycode", id: :string, force: :cascade do |t|
    t.string "tblamc_agencymst_sagencyname", null: false
    t.string "tblamc_agencymst_sagencyadd", null: false
    t.decimal "tblamc_agencymst_sagencylocid", null: false
    t.string "tblamc_agencymst_sagencylicno", null: false
    t.string "tblamc_agencymst_sagencyfax"
    t.decimal "tblamc_agencymst_nagencytype", null: false
    t.date "tblamc_agencymst_dagencyvaldt", null: false
    t.string "tblamc_agencymst_sagencyphone"
    t.string "tblamc_agencymst_sagencyemail"
    t.decimal "tblamc_agencymst_nis_surrender", null: false
    t.index ["tblamc_agencymst_sagencyname"], name: "tblamc_agencymst_u01", unique: true
  end

  create_table "tblamc_agencytypemst", primary_key: "tblamc_agencytypemst_ntypeid", id: :decimal, force: :cascade do |t|
    t.string "tblamc_agencytypemst_stypename", null: false
    t.index ["tblamc_agencytypemst_stypename"], name: "tblamc_agencytypemst_u01", unique: true
  end

  create_table "tblamc_bankmst", primary_key: "tblamc_bankmst_nbankid", id: :decimal, force: :cascade do |t|
    t.string "tblamc_bankmst_sbankname", null: false
    t.decimal "tblamc_bankmst_nlocationid", null: false
    t.decimal "tblamc_bankmst_nbanknoofbranch", null: false
    t.index ["tblamc_bankmst_sbankname", "tblamc_bankmst_nlocationid"], name: "tblamc_bankmst_u01", unique: true
  end

  create_table "tblamc_cei_mst", primary_key: "tblamc_cei_mst_nreceiptno", id: :decimal, force: :cascade do |t|
    t.string "tblamc_cei_mst_sreceiptno", null: false
    t.date "tblamc_cei_mst_ddate", null: false
    t.string "tblamc_cei_mst_stran_type", limit: 5, null: false
    t.string "tblamc_cei_mst_sname", null: false
    t.string "tblamc_cei_mst_spassport", null: false
    t.decimal "tblamc_cei_mst_ncountry_id", null: false
    t.string "tblamc_cei_mst_saddress", null: false
    t.date "tblamc_cei_mst_drate_up_date", null: false
    t.string "tblamc_cei_mst_scurr_code", null: false
    t.decimal "tblamc_cei_mst_ncash", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_ntc", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_nlower_curr_amt", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_ncash_buy", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_ntc_buy", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_ncash_sell", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_ntc_sell", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_nlc_buy_rate", precision: 15, scale: 2, null: false
    t.decimal "tblamc_cei_mst_nequivalent_amt", precision: 15, scale: 2, null: false
    t.string "tblamc_cei_mst_sagent_code", null: false
    t.string "tblamc_cei_mst_suser_id", null: false
    t.index ["tblamc_cei_mst_sreceiptno"], name: "tblamc_cei_mst_u01", unique: true
  end

