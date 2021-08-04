create database Library_Management;

use Library_Management;

create table Library_Branch(
	BranchID int primary key not null identity(1,1),
	BranchName varchar(100),
	Address varchar(100)
);

create table Publisher(
	PublisherName varchar(100) primary key not null,
	Address varchar(255),
	Phone varchar(100)
);

create table Books(
	BookID int primary key not null identity(1,1),
	Title varchar(100),
	PublisherName varchar(100) foreign key references Publisher(PublisherName)
);

create table Book_Copies(
	BookID int foreign key references Books(BookID),
	BranchID int foreign key references Library_Branch(BranchID),
	Number_Of_Copies int
);

create table Book_Authors(
	BookID int foreign key references Books(BookID) identity(1,1),
	AuthorName varchar(100)
);

create table Borrower(
	CardNo int primary key not null,
	Name varchar(100),
	Address varchar(255),
	Phone varchar(100)
);

create table Book_Loans(
	BookID int foreign key references Books(BookID),
	BranchID int foreign key references Library_Branch(BranchID),
	CardNo int foreign key references Borrower(CardNo),
	DateOut date,
	DateDue date
);

insert into Library_Branch
	(BranchName,Address)
	values
	('Sharpstown','6431 Fondren Rd, Houston, TX 77036, USA'),
	('Congress','101 Independence Ave SE, Washington, DC 20540,USA'),
	('Austin','5401 La Crosse Ave, Austin, TX 78739, USA'),
	('New York', '224 East 125th Street New York, NY 10035, USA'),
	('Hearst','01 Main Street, Anaconda, Montana 59711,USA'),
	('Belgrade', '106 North Broadway, Belgrade, Montana 59714, USA');

insert into Borrower
	(CardNo,Name,Address,Phone)
	values
	(569, 'David Buckingham','100 East 100th Street new York,NY 10035,USA','0857733921'),
	(325, 'Cian Murphy','17 North Broadway, Belgrade, Montana 59714, USA', '0873395217'),
	(672, 'Eileen Murphy', '01 Main Street, Anaconda, Montana 59711, USA', '0831248444'),
	(543, 'Jade Bennet', '5201 La Crosse Ave, Austin, TX 78739, USA', '0857648467'),
	(737, 'Ciara Sinden', '6431 Fondren Rd, Houston, TX 77036, USA', '0867894561'),
	(910, 'Phil Aitken', '17 Richards Rd, Austin, TX 29102, USA', '0859541317'),
	(115, 'Sean Weiss', '5 Main Street, New York, NY 19021, USA', '0857799321'),
	(343, 'Niall Dunne', '15 Brook rd, Belgrade, Montana 66732, USA', '0873322154');


insert into Publisher
	(PublisherName,Address,Phone)
	values
	('Penguin Random House','320 Front Street West, Suite 1400, Toronto','0571348641'),
	('Hachette Livre','17 Broadway Str, Belgrade, Montana 4678, USA','0578693214'),
	('HarperCollins','1 New York Plaza, Suite 4600, New York, NY 1003, USA','0574564619'),
	('Macmillan','Harborside Plaza II, 200 Hudson Street, Jersey City, NJ 07302, USA','0576943181'),
	('Simon & Schuster','1650 Arch Street, Suite 2050, Philadelphia, PA 19103, USA','0578945631'),
	('McGraw-Hill Education','225 Bush Street Suite 1850, San Francisco 94104, USA','0574039027'),
	('Houghton Mifflin Harcourt','968 National Press Building, 529 14th St NW, Washington DC, USA','0572737235'),
	('Pearson Education','17901 Old Cutler Road, Suite 320, Palmetto Bay, FL 33157, USA','0576842600'),
	('Scholastic','Avenida Insurgentes Sur 1886, Col. Florida, Álvaro Obregón, Mexico','0579845632'),
	('Springer Nature','Manuel Tovar 252, Miraflores, Lima 18, Peru','0574410311');


insert into Books
	(Title,PublisherName)
	values
	('The Lost Tribe','Springer Nature'),
	('Don Quixote','Penguin Random House'),
	('Pilgrims Progress','Simon & Schuster'),
	('To Kill a Mockingbird','Macmillan'),
	('The Great Gatsby','Hachette Livre'),
	('One Hundred Years of Solitude','Scholastic'),
	('Brave New World','HarperCollins'),
	('The Call of the Wild','McGraw-Hill Education'),
	('Moby-Dick','Houghton Mifflin Harcourt'),
	('The Lion, the Witch and the Wardrobe','Pearson Education'),
	('To the Lighthouse','Simon & Schuster'),
	('Frankenstein','Macmillan'),
	('Beloved','Penguin Random House'),
	('Dracula ','Scholastic'),
	('The Lord of the Rings','Simon & Schuster'),
	('The Adventures of Huckleberry Finn','Macmillan'),
	('Alice’s Adventures in Wonderland ','Springer Nature'),
	('Les Miserables','Scholastic'),
	('Charlie and the Chocolate Factory','Springer Nature'),
	('Breakfast of Champions','Pearson Education'),
	('A Christmas Carol ','Penguin Random House');


drop table Book_Authors;

insert into Book_Authors
	(AuthorName)
	values
	('Harper Lee'),
	('Miguel De Cervantes'),
	('John Bunyan'),
	('Harper Lee'),
	('Scott Fitzgerald'),
	('Gabriel García Márquez '),
	('Aldous Huxley'),
	('Jack London'),
	('Herman Melville'),
	('C.S. Lewis'),
	('Virginia Woolf'),
	('Harper Lee'),
	('Aldous Huxley'),
	('Miguel De Cervantes'),
	('C.S. Lewis'),
	('John Bunyan'),
	('C.S. Lewis'),
	('Gabriel García Márquez'),
	('C.S. Lewis'),
	('Harper Lee');

insert into Book_Copies
	(Number_Of_Copies,BookID,BranchID)
	values
	( 5, 1, 1),
	( 4, 2, 1),
	( 7, 3, 5),
	( 2, 4, 3),
	( 9, 1, 5),
	( 3, 6, 6),
	( 4, 7, 2),
	( 6, 8, 4),
	( 5, 9, 1),
	( 8, 10, 5),
	( 2, 11, 6),
	( 3, 12, 4),
	( 4, 13, 1),
	( 6, 14, 2),
	( 9, 15, 1),
	( 3, 16, 3),
	( 2, 17, 2),
	( 3, 18, 1),
	( 2, 19, 5),
	( 9, 20, 6);


insert into Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	(2, 1, 569,'2021-04-15','2021-04-29'),
	(1, 2, 325,'2021-02-09','2021-02-23'),
	(3, 5, 569,'2021-04-05','2021-04-19'),
	(20, 6, 343,'2021-12-15','2021-04-29'),
	(4, 3, 115,'2021-03-06','2021-03-20'),
	(11, 6, 737,'2021-05-21','2021-06-04'),
	(12, 3, 910,'2021-08-04','2021-08-18'),
	(8, 4, 672,'2021-07-10','2021-07-24'),
	(7, 2, 343,'2021-09-07','2021-09-21'),
	(17, 2, 569,'2021-10-08','2021-10-22');


SELECT * FROM ((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo)
FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BookID);

/*Returns all book titles and author names*/
select a1.title, a2.authorName
	from  Books a1
	inner join Book_Authors a2 on a2.BookID = a1.BookID;

