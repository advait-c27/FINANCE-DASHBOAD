drop table if exists bank_lone_data;

create table bank_lone_data 
(	id	int,
	address_state	varchar(50),
	application_type	varchar(50),
	emp_length	varchar(50),
	emp_title	varchar(200),
	grade	varchar(50),
	home_ownership	varchar(50),
	issue_date	date,
	last_credit_pull_date	date,
	last_payment_date	date,
	loan_status	varchar(50),
	next_payment_date	date,
	member_id	int,
	purpose	varchar(50),
	sub_grade	varchar(50),
	term	varchar(50),
	verification_status	varchar(50),
	annual_income	float,
	dti	float,
	installment	float,
	int_rate	float,
	loan_amount	float,
	total_acc	int,
	total_payment	int);

	select * from bank_lone_data;
	
--total application
	select count(id) as total_application from bank_lone_data;

--total mod last month application
   select count(id) as mod_total_application from bank_lone_data
   where extract (month from issue_date) = 12;

-- total pmtd pevious month application
	   select count(id) as pmod_total_application from bank_lone_data
   where extract (month from issue_date) = 11;

-- total funded amount by the bank
	select sum(loan_amount) as total_amount from bank_lone_data;

	--amount fo 12 qnd 11th month
	  select sum(loan_amount) as pmod_total_amount from bank_lone_data
   where extract (month from issue_date) = 11;

     select sum(loan_amount) as mod_total_amount from bank_lone_data
   where extract (month from issue_date) = 12;
   
 -- total amount resive to the bank
	 select sum(total_payment) as reseve_total from bank_lone_data;

	 --total eseve fom 12 and 11th month
	 	 select sum(total_payment) as mod_reseve_total from bank_lone_data
	 where extract (month from issue_date) = 12;

	 select sum(total_payment) as pmod_reseve_total from bank_lone_data
	 where extract (month from issue_date) = 11;

	 --avg intest rate
	 select  avg(int_rate)*100 as avg_int_rate from bank_lone_data;
	 
	 --avg for 11 and 12 th ,months
		 select  avg(int_rate)*100 as mtd_avg_int_rate from bank_lone_data
	 	 where extract (month from issue_date) = 12;

		 select  avg(int_rate)*100 as pmtd_avg_int_rate from bank_lone_data
	 	 where extract (month from issue_date) = 11;


		----avg dte total
		select  avg(dti)*100 as dti_avg from bank_lone_data;
		
 --avg dte fo 11 and 2 th  month
 		select  avg(dti)*100 as pmtd_dti_avg from bank_lone_data
		 where extract (month from issue_date) = 11;

		 select  avg(dti)*100 as mtd_dti_avg from bank_lone_data
		 where extract (month from issue_date) = 12;

	--- for good loan %

	select
	(count (case when loan_status = 'Fully Paid' or loan_status = 'Current'
	then id end ) *100)
	/
	count(id ) as good_loan_pr
	from bank_lone_data

	select count (id) as good_app from bank_lone_data
	where loan_status='Fully Paid' or loan_status='Current' ;

	select sum (loan_amount) as good_loan_amount from bank_lone_data
	where loan_status='Fully Paid' or loan_status='Current' ;

	select sum (total_payment) as good_loan_recive from bank_lone_data
	where loan_status='Fully Paid' or loan_status='Current' ;
	
	select id, loan_status from bank_lone_data;

---total bafd loan %

  select
  (count (case when loan_status ='Charged Off' then id end)*100)
  /
  count (id) as bad_loan_pr
  from bank_lone_data

		select count (id) as good_app from bank_lone_data
	where loan_status='Charged Off';

	select sum (loan_amount) as good_loan_amount from bank_lone_data
	where loan_status= 'Charged Off';

	select sum (total_payment) as good_loan_recive from bank_lone_data
	where loan_status='Charged Off';
	 


 