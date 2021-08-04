/*How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/
use Library_Management;
go 
create procedure copiesAtEachBranch
AS
Begin
	Select 
		a1.Title, a2.Number_Of_Copies,a3.BranchName
		from Books a1
		inner join Book_Copies a2 on a2.BookID = a1.BookID
		inner join Library_Branch a3 on a3.BranchID= a2.BranchID
		where a1.Title = 'The Lost Tribe';
End