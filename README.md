![MIKES DATA WORK GIT REPO](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_01.png "Mikes Data Work")        

# Use SQL To Quickly Check Values In Sys.Configurations And Change If False
**Post Date: September 24, 2015**        



## Contents    
- [About Process](##About-Process)  
- [SQL Logic](#SQL-Logic)  
- [Build Info](#Build-Info)  
- [Author](#Author)  
- [License](#License)       

## About-Process

<p>Here's some very simplified sql logic that checks to see if a configuration is enabled, and subsequently changes those values if they are not enabled.
Note: If you ever want to use <> for NOT EQUAL TO then you're doing the right thing. The alternative is to use this !=, but this is not portable. Use ANSI whenever possible. SQL Server interprets these two 'not equal to' constructs the same. In this example I'm simply usinge EQUAL (=)</p>      
  
  
## SQL-Logic
```SQL
se master;
set nocount on
 
declare
@sao    int = (select cast([value] as int) from master.sys.configurations where [name] = 'show advanced options')
,   @bcd    int = (select cast([value] as int) from master.sys.configurations where [name] = 'backup compression default')
,   @xpc    int = (select cast([value] as int) from master.sys.configurations where [name] = 'xp_cmdshell')
 
if  @sao = 0    begin exec  master..sp_configure 'show advanced options', 1 reconfigure end
if  @bcd = 0    begin exec  master..sp_configure 'backup compression default', 1    reconfigure end
if  @xpc = 0    begin exec  master..sp_configure 'xp_cmdshell', 1 reconfigure end
```


[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Info

| Build Quality | Build History |
|--|--|
|<table><tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr><tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr><tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr></table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|

## Author

[![Gist](https://img.shields.io/badge/Gist-MikesDataWork-<COLOR>.svg)](https://gist.github.com/mikesdatawork)
[![Twitter](https://img.shields.io/badge/Twitter-MikesDataWork-<COLOR>.svg)](https://twitter.com/mikesdatawork)
[![Wordpress](https://img.shields.io/badge/Wordpress-MikesDataWork-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

 
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Mikes Data Work](https://raw.githubusercontent.com/mikesdatawork/images/master/git_mikes_data_work_banner_02.png "Mikes Data Work")

