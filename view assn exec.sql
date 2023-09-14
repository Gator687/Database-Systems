Select * From CustomerRepresentativeView

Select * From PartOrderLineView

Select * From AuthorFullName;

Select * From SalesTaxView;

Select af.AuthorFullName, b.Title AS BookTitle
From AuthorFullName af
Join henry.Wrote w on af.AuthorNum = w.AuthorNum
Join henry.Book b on w.BookCode = b.BookCode;

Select b.Title AS BookTitle, c.Quality,
c.Price, stv.SalesTax
From henry.Book b
Join henry.Copy c on b.BookCode = c.BookCode
Join SalesTaxView stv on b.BookCode = stv.BookCode;
