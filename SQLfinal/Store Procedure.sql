--FInal Project 245
--Data Structure
--Professor Kelly
--Auther : Sufi Noor
--Created Date: DEC 16th 2015
--Description: "INSERT" "UPDATE"" DELETE" STORE Procedure for all 4 tables (SALE_REP, BBY_CUSTOMER, ORDERS, PRODUCT)
--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: "SELECT" procudure Sript for BBY_Customer
--just to show the tow table relationship
--======================================================
create procedure Dis_BBy_Customer


	@I_CUS_FIRST_NAME Char(35),
	@I_CUS_LAST_NAME Char (35),
	@I_CUS_CITY Char (15),
	@I_MAMBER_STATUS CHAR (10),
	@I_REP_FIRST_NAME Char (15)

	as
Begin
	select
	BBY_CUSTOMER.FIRST_NAME, BBY_CUSTOMER.LAST_NAME, BBY_CUSTOMER.CITY, MAMBER_STATUS, SALE_REP.FIRST_NAME
	FROM BBY_CUSTOMER, SALE_REP
	WHERE BBY_CUSTOMER.EMP_NUM = SALE_REP.EMP_NUM
	AND BBY_CUSTOMER.FIRST_NAME = @I_CUS_FIRST_NAME
	AND BBY_CUSTOMER.LAST_NAME = @I_CUS_LAST_NAME
	AND BBY_CUSTOMER.CITY = @I_CUS_CITY
	AND MAMBER_STATUS = @I_MAMBER_STATUS
	AND SALE_REP.FIRST_NAME = @I_REP_FIRST_NAME

END

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Insert Sript for table Sale_Rep
--======================================================
CREATE PROCEDURE Add_NewEmployee
	@EmpNum 		Char (5) ,
	@EmpLastName 	Char (15) = null,
	@EmpFirstName 	Char (15) = null,
	@EmpDipertment 	Char (15) = null

as
Begin
	Insert Into SALE_REP (EMP_NUM, SALE_REP.LAST_NAME, SALE_REP.FIRST_NAME, DIPERTMENT)
	VALUES (@EmpNum, @EmpLastName, @EmpFirstName, @empDipertment)
END

--CHECK TO SEE IF THE PROCUDURE WORKS

EXEC Add_NewEmployee '59859', 'Style', 'Foulds', 'Computer'
SELECT * from SALE_REP

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Update DIPERTMENT FOR EMPLOYEE
--======================================================

CREATE PROCEDURE Update_EmpDipertment
	@EmpNum char (5),
	@EmpDipertment Char (15) = null


AS
Begin
	UPDATE SALE_REP

	SET 	DIPERTMENT = 	@EmpDipertment
	WHERE 	EMP_NUM 		= 	@EmpNum
END

--check to see if the procudure works berofe and after
SELECT * FROM SALE_REP
EXEC Update_EmpDipertment '94915', 'Computer'
SELECT * FROM SALE_REP

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Delete Procudure for Sale_Rep
--======================================================

CREATE PROCEDURE Emp_Termination
@EmpNum char(5)
AS
BEGIN
	DELETE
	FROM SALE_REP
	WHERE EMP_NUM = @EmpNum
END

-- checking if the procudure worked before and after
SELECT * FROM SALE_REP

Emp_Termination 59859

SELECT * FROM SALE_REP

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Insert Sript for table BBy_Customer
--======================================================
Create PROCEDURE Add_Customer
	@RewardNum 		Char (6) ,
	@CusLastName 	Char (35) = null,
	@CusFirstName 	Char (35) = null,
	@MamberStatus 	Char (10) = MyBBY

as
Begin
	Insert Into BBY_CUSTOMER
	(REWARD_NUM, BBY_CUSTOMER.LAST_NAME, BBY_CUSTOMER.FIRST_NAME, MAMBER_STATUS)
	VALUES
	(@RewardNum, @CusLastName, @CusFirstName, @MamberStatus)
END

--CHECK TO SEE IF THE PROCEDURE IS WORKING
select * from BBY_CUSTOMER
EXEC Add_Customer '984939', 'Folkner','Bill'

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Update address into Sufi Noor for table Sale_Rep for
--======================================================

CREATE PROCEDURE Update_MamberStatus
	@RewardNum char (6),
	@MamberStatus Char (10) = MyBBy

AS
Begin
	UPDATE BBY_CUSTOMER

	SET 	MAMBER_STATUS   = 	@MamberStatus
	WHERE 	REWARD_NUM 		= 	@RewardNum
END

--check to see if the procudure works

select * from BBY_CUSTOMER

EXEC Update_MamberStatus '123824', 'Elite'


--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Delete Procudure for  Best Buy customer
--======================================================

CREATE PROCEDURE DEL_Customer
@RewardNum char(6)
AS
BEGIN
	DELETE
	FROM BBY_CUSTOMER
	WHERE REWARD_NUM = @RewardNum
END

-- checking if the procudure worked before and after
SELECT * FROM BBY_CUSTOMER
DEL_Customer 984939
SELECT * FROM BBY_CUSTOMER


--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: insert procudeur in order
--======================================================

CREATE PROCEDURE Insert_Order
@orderNum char(5) = NULL,
@orderDate date = NULL,
@RewardNum char (6) = NULL

AS
BEGIN
     SET NOCOUNT ON

     INSERT INTO ORDERS
     (ORDER_NUM, ORDER_DATE, REWARD_NUM)

     VALUES
     ( @orderNum, @orderNum, @RewardNum)
END

select * from orders
EXEC Insert_Order '60504', 20151016, '123586'



--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: UPDATE procudeur in order
--======================================================

CREATE PROCEDURE CHANGE_DATE_ORDER
@I_ORDER_NUM char(5),
@I_ORDER_DATE date
AS
	UPDATE ORDERS
	SET ORDER_DATE = @I_ORDER_DATE
	WHERE ORDER_NUM = @I_ORDER_NUM

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: delete procudeur in order
--======================================================

CREATE PROCEDURE DEL_Order
@I_ORDER_NUM char(5)
AS
	DELETE
	FROM ORDERS
	WHERE ORDER_NUM = @I_ORDER_NUM

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2015
--Description: Insert Sript for product
--======================================================
CREATE PROCEDURE Add_Product
	@ProductSKU 	Char (7) ,
	@ProductName	Char (30) = null,
	@ProductCAT		Char (15) = null,
	@ProductPrice 	decimal (6,2) = null

as
Begin
	Insert Into PRODUCT (SKU_NUM, PRODUCT_NAME, CATEGORY, PRICE)
	VALUES (@ProductSKU ,@ProductName,@ProductCAT, @ProductPrice )
END

--CHECK IF THE PROCUDURE IS WORKING

SELECT * FROM PRODUCT
EXEC Add_Product '1355755', 'IPAD MINI 4', 'TABLET', 399.99
SELECT * FROM PRODUCT



--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2016
--Description: Update product prices
--======================================================

CREATE PROCEDURE Update_ProductPRICE
	@ProductSKU 	Char (7) ,
	@ProductPrice  	Decimal (6,2) = null


AS
Begin
	UPDATE PRODUCT

	SET 	PRICE	= 	@ProductPrice
	WHERE 	SKU_NUM = 	@ProductSKU
END

--check to see if the procudure works berofe and after
SELECT * FROM PRODUCT
EXEC Update_ProductPrice '3451350', 999.99
SELECT * FROM PRODUCT

--======================================================
--Auther: Sufi Noor
--create date: Dec 16th 2016
--Description: delete product from procudure
--======================================================

CREATE PROCEDURE DEL_Product
@ProductSKU char(7)
as
BEGIN
	DELETE
	FROM PRODUCT
	WHERE SKU_NUM = @ProductSKU
END
SELECT * FROM PRODUCT
--check to see if the procudure works

DEL_Product '3451350'
