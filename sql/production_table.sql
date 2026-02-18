CREATE TABLE bank_loan_data (
    id INT,
    member_id BIGINT,

    address_state VARCHAR(50),
    application_type VARCHAR(50),
    emp_length VARCHAR(50),
    emp_title VARCHAR(255),

    grade VARCHAR(10),
    sub_grade VARCHAR(10),

    home_ownership VARCHAR(50),
    loan_status VARCHAR(50),
    purpose VARCHAR(100),
    term VARCHAR(50),
    verification_status VARCHAR(50),

    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    next_payment_date DATE,

    annual_income DECIMAL(12,2),
    installment DECIMAL(10,2),

    loan_amount INT,
    total_payment INT,
    total_acc INT,

    int_rate DECIMAL(6,4),
    dti DECIMAL(6,4)
);
