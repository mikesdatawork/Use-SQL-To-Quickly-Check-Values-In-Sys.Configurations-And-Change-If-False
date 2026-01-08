se master;
set nocount on
 
declare
@sao    int = (select cast([value] as int) from master.sys.configurations where [name] = 'show advanced options')
,   @bcd    int = (select cast([value] as int) from master.sys.configurations where [name] = 'backup compression default')
,   @xpc    int = (select cast([value] as int) from master.sys.configurations where [name] = 'xp_cmdshell')
 
if  @sao = 0    begin exec  master..sp_configure 'show advanced options', 1 reconfigure end
if  @bcd = 0    begin exec  master..sp_configure 'backup compression default', 1    reconfigure end
if  @xpc = 0    begin exec  master..sp_configure 'xp_cmdshell', 1 reconfigure end
