use xtreme_es;

select count(*) from Cliente

begin tran

truncate table Cliente

select count(*) from Cliente

rollback tran

select count(*) from Cliente

