select * from henry.bookStatsFun()

select bsf.title, bsf.onHand, a.authorFirst, a.authorLast
from henry.bookStatsFun() bsf join henry.wrote w
on bsf.bookcode = w.bookcode
join henry.author a on a.authorNum = w.AuthorNum