/*Retrieve the names of all borrowers who do not have any books checked out.*/
use Library_Management
go 
create Proc notBorrowing
As
Begin
	Select 
		a1.Name
		from Borrower a1
		left outer join Book_Loans a2 on a2.CardNo = a1.CardNo
		where a2.DateDue is Null;
End