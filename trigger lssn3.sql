--after trigger
--these run when the default code executes
--on update for quality
create or alter function qualityValueCalc(@quality char(20))
returns int
as Begin
    declare @qualVal as int = 0
    set @qualVal = CASE
        when @quality = 'EXCELLENT' then 4
        when @quality = 'GOOD' then 3
        when @quality = 'FAIR' then 2
        when @quality = 'POOR' then 1
        else 0
    END--end of case
    return @qualVal
END
go
select dbo.qualityValueCalc('excellent') as value

select top(5) * from henry.copy

go
create or alter trigger updateQuality
on henry.copy after update
as if update(quality)
BEGIN

    declare @oldQuality char(20)--before update
    declare @newQuality char(20)--after update
    declare @oldPrice decimal(8,2)
    declare @newPrice decimal(8,2)
    declare @oldQualVal int --calc by calling the function
    declare @newQualVal int
    declare @changeVal int
    declare @bookCode char(4)

    --fill the values
    select @oldQuality = quality from deleted   --deleted is the old values table
    select @oldPrice = price from deleted
    select @bookCode = bookcode from deleted
    select @newQuality = quality from inserted--added

    --logic
    if @oldQuality = @newQuality
    BEGIN
        Return--no chnaged needed
    end

    select @oldQualVal = dbo.qualityValueCalc(@oldQuality)
    select @newQualVal = dbo.qualityValueCalc(@newQuality)

    if @newQualVal > @oldQualVal
    BEGIN
        set @changeVal = @newQualVal - @oldQualVal
        set @newPrice = @oldPrice * (1 + (.25 * @changeVal))
    end
    ELSE
    begin
        set @changeVal = @oldQualVal - @newQualVal
        set @newPrice = @oldPrice * (1 - (.25 * @changeVal))
    end
    print @changeVal
    print @newPrice
    --run the new update command to set the new price
    update copy set price = @newPrice
    where bookcode = @bookCode and quality = @newQuality
END--end of trigger

update henry.Copy
set quality = 'excellent'
where bookcode = '0189' and quality='good'

select * from henry.Copy
where bookcode='0189' and quality='excellent'
update henry.Copy
set price = 10