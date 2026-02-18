use Bank_Load_DB;

BEGIN TRAN;

TRUNCATE TABLE bank_loan_data;

INSERT INTO bank_loan_data (
 id,
 member_id,
 address_state,
 application_type,
 emp_length,
 emp_title,
 grade,
 sub_grade,
 home_ownership,
 loan_status,
 purpose,
 term,
 verification_status,
 issue_date,
 last_credit_pull_date,
 last_payment_date,
 next_payment_date,
 annual_income,
 installment,
 loan_amount,
 total_payment,
 total_acc,
 int_rate,
 dti
)
SELECT

TRY_CONVERT(INT,
 REPLACE(REPLACE(LTRIM(RTRIM(id)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(BIGINT,
 REPLACE(REPLACE(LTRIM(RTRIM(member_id)),CHAR(13),''),CHAR(10),'')
),

address_state,
application_type,
emp_length,
emp_title,
grade,
sub_grade,
home_ownership,
loan_status,
purpose,
term,
verification_status,

TRY_CONVERT(date,issue_date,105),
TRY_CONVERT(date,last_credit_pull_date,105),
TRY_CONVERT(date,last_payment_date,105),
TRY_CONVERT(date,next_payment_date,105),

TRY_CONVERT(decimal(12,2),
 REPLACE(REPLACE(LTRIM(RTRIM(annual_income)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(decimal(10,2),
 REPLACE(REPLACE(LTRIM(RTRIM(installment)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(INT,
 REPLACE(REPLACE(LTRIM(RTRIM(loan_amount)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(INT,
 REPLACE(REPLACE(LTRIM(RTRIM(total_payment)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(INT,
 REPLACE(REPLACE(LTRIM(RTRIM(total_acc)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(decimal(6,4),
 REPLACE(REPLACE(LTRIM(RTRIM(int_rate)),CHAR(13),''),CHAR(10),'')
),

TRY_CONVERT(decimal(6,4),
 REPLACE(REPLACE(LTRIM(RTRIM(dti)),CHAR(13),''),CHAR(10),'')
)

FROM bank_load_staging;

COMMIT;
