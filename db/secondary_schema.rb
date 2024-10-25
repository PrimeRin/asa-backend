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

