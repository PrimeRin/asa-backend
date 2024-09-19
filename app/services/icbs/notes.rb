DECLARE
    v_nextTxnID NUMBER;  
BEGIN
    ASA_GENERATE_VOUCHER (
        txnDATE      => TO_DATE('2024-09-10', 'YYYY-MM-DD'),    
        txnVALUEDATE => TO_DATE('2024-09-10', 'YYYY-MM-DD'),   
        particulars  => 'Sample transaction',                   
        vchType  => 'Salary Advance',  
        createBy     => '2005022',                                  
        theAMOUNT  => 12000,                                   
        drGLCode       => 1302004,                                    
        crGLCode       => 1202002,                                                
        empCode  => 2022012,      
        monthlyRecoveryAmount  => 4000,    
        fromDate => TO_DATE('2024-09-01', 'YYYY-MM-DD'),
        toDate => TO_DATE('2024-11-30', 'YYYY-MM-DD'),
        loanID       => 10012,
        nextTxnID    => v_nextTxnID                            
    );
    
    DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_nextTxnID);   
END;




ADVANCE_TYPE = {
    'salary_advance' => '1302004',
    'other_advance' => '1302008',
    'tour_advance' => '1302003',
  }.freeze

  Icbs::VoucherGenerator.generate_voucher(
  txn_date: Date.new(2024, 9, 12),                     # Transaction date
  txn_value_date: Date.new(2024, 9, 12),               # Value date
  particulars: 'Payment for services',                 # Particulars
  vch_type: 'Salary Advance',                          # Voucher type
  created_by: '2005022',                                # Created by employee code
  amount: 1000.50,                                     # Amount
  dr_gl_code: 1302004,                                   # Debit GL code
  cr_gl_code: 1202002,                                   # Credit GL code
  emp_code: 2022012,                                       # Employee code
  monthly_recovery_amount: 200.00,                     # Monthly recovery amount
  from_date: Date.new(2024, 1, 1),                     # From date
  to_date: Date.new(2024, 12, 31),                     # To date
  loan_id: 9876                                        # Loan ID
)
  


-- INCOUNTRY 
# TRAINING - 4703003
# oFFICE TOUR - 4703001

-- OUTISIDE
# MEETTING N SEMI - 4703002
# TRAINING - 4703003


ADMISTRATIVE -CR 1202002


DR - SLCODE ---> EMPLOYEEID



DECLARE
    v_nextTxnID NUMBER;  
BEGIN
    ASA_GENERATE_VOUCHER (
        txnDATE      => TO_DATE('Thu, 12 Sep 2024', 'YYYY-MM-DD'),    
        txnVALUEDATE => TO_DATE('Thu, 12 Sep 2024', 'YYYY-MM-DD'),   
        particulars  => 'other',                   
        vchType  => 'other_advance',  
        createBy     => '2005022',                                  
        theAMOUNT  => 2000,                                   
        drGLCode       => 1302008,                                    
        crGLCode       => 1202002,                                                
        empCode  => '2005023',      
        monthlyRecoveryAmount  => 0,    
        fromDate => null,
        toDate => null,
        loanID       => null,
        nextTxnID    => v_nextTxnID                            
    );
    
    DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_nextTxnID);   
END;


Advance.where(advance_type: 'salary_advance').update_all(tour_type: 'salary_advance')
Advance.where(advance_type: 'other_advance').update_all(tour_type: 'other_advance')
Advance.where(advance_type: 'in_country_tour_advance').update_all(tour_type:  'office tour')
Advance.where(advance_type: 'ex_country_tour_advance').update_all(tour_type: 'training')
Advance.where(advance_type: 'in_country_dsa_claim').update_all(tour_type:  'office tour')
Advance.where(advance_type: 'ex_country_dsa_claim').update_all(tour_type: 'training')

