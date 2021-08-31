ç1
[G:\Prototypes\IDisposable-Practices\demo7\src\WordCounter\WordCounter.App\Data\SqlClient.cs
	namespace 	
WordCounter
 
. 
App 
. 
Data 
{ 
public 

class 
	SqlClient 
{		 
private

 
readonly

 
string

 
_connectionString

  1
;

1 2
public 
	SqlClient 
( 
IConfiguration '
config( .
). /
{ 	
_connectionString 
= 
config  &
.& '
GetConnectionString' :
(: ;
$str; F
)F G
;G H
} 	
public 
async 
Task 
CreateFeedResults +
(+ ,
string, 2
path3 7
,7 8
int9 <
	lineCount= F
,F G
intH K
	wordCountL U
,U V
longW ["
processingMilliseconds\ r
)r s
{ 	
var 
sqlConnection 
= 
await  %
OpenConnection& 4
(4 5
)5 6
;6 7
var 
command 
= 
sqlConnection '
.' (
CreateCommand( 5
(5 6
)6 7
;7 8
command 
. 
CommandType 
=  !
CommandType" -
.- .
Text. 2
;2 3
command 
. 
CommandText 
=  !
string" (
.( )
Format) /
(/ 0
$str ~
,~ 
path 
, 
	lineCount #
,# $
	wordCount% .
,. /"
processingMilliseconds0 F
)F G
;G H
await 
command 
.  
ExecuteNonQueryAsync .
(. /
)/ 0
;0 1
} 	
public 
async 
Task 
UpdateFeedResults +
(+ ,
string, 2
path3 7
,7 8
int9 <
	lineCount= F
,F G
intH K
	wordCountL U
,U V
longW ["
processingMilliseconds\ r
)r s
{ 	
var 
sqlConnection 
= 
await  %
OpenConnection& 4
(4 5
)5 6
;6 7
var 
command 
= 
sqlConnection '
.' (
CreateCommand( 5
(5 6
)6 7
;7 8
command   
.   
CommandType   
=    !
CommandType  " -
.  - .
Text  . 2
;  2 3
command!! 
.!! 
CommandText!! 
=!!  !
string!!" (
.!!( )
Format!!) /
(!!/ 0
$str"" |
,""| }
path## 
,## 
	lineCount## #
,### $
	wordCount##% .
,##. /"
processingMilliseconds##0 F
)##F G
;##G H
await$$ 
command$$ 
.$$  
ExecuteNonQueryAsync$$ .
($$. /
)$$/ 0
;$$0 1
}%% 	
public'' 
async'' 
Task'' 
SaveLineResults'' )
('') *
string''* 0
path''1 5
,''5 6
int''7 :

lineNumber''; E
,''E F
int''G J
	wordCount''K T
,''T U
string''V \
excerpt''] d
)''d e
{(( 	
int)) 

bookFeedId)) 
=)) 
$num)) 
;)) 
var++ 
sqlConnection++ 
=++ 
await++  %
OpenConnection++& 4
(++4 5
)++5 6
;++6 7
var-- 
selectCommand-- 
=-- 
sqlConnection--  -
.--- .
CreateCommand--. ;
(--; <
)--< =
;--= >
selectCommand.. 
... 
CommandType.. %
=..& '
CommandType..( 3
...3 4
Text..4 8
;..8 9
selectCommand// 
.// 
CommandText// %
=//& '
string//( .
.//. /
Format/// 5
(//5 6
$str//6 `
,//` a
path//b f
)//f g
;//g h

bookFeedId00 
=00 
(00 
int00 
)00 
await00 #
selectCommand00$ 1
.001 2
ExecuteScalarAsync002 D
(00D E
)00E F
;00F G
var22 
insertCommand22 
=22 
sqlConnection22  -
.22- .
CreateCommand22. ;
(22; <
)22< =
;22= >
insertCommand33 
.33 
CommandType33 %
=33& '
CommandType33( 3
.333 4
Text334 8
;338 9
insertCommand44 
.44 
CommandText44 %
=44& '
string44( .
.44. /
Format44/ 5
(445 6
$str55 x
,55x y

bookFeedId66 
,66 

lineNumber66  *
,66* +
	wordCount66, 5
,665 6
excerpt667 >
.66> ?
Replace66? F
(66F G
$str66G J
,66J K
$str66L P
)66P Q
)66Q R
;66R S
await77 
insertCommand77 
.77   
ExecuteNonQueryAsync77  4
(774 5
)775 6
;776 7
}88 	
private;; 
async;; 
Task;; 
<;; 
SqlConnection;; (
>;;( )
OpenConnection;;* 8
(;;8 9
);;9 :
{<< 	
var== 
sqlConnection== 
=== 
new==  #
SqlConnection==$ 1
(==1 2
_connectionString==2 C
)==C D
;==D E
await>> 
sqlConnection>> 
.>>  
	OpenAsync>>  )
(>>) *
)>>* +
;>>+ ,
return?? 
sqlConnection??  
;??  !
}@@ 	
}AA 
}BB è
\G:\Prototypes\IDisposable-Practices\demo7\src\WordCounter\WordCounter.App\IO\FileArchiver.cs
	namespace 	
WordCounter
 
. 
App 
. 
IO 
{ 
public 

class 
FileArchiver 
{ 
public 
void 
CopyFile 
( 
string #

sourcePath$ .
,. /
string0 6

targetPath7 A
)A B
{ 	
var		 
inputStream		 
=		 
File		 "
.		" #
OpenRead		# +
(		+ ,

sourcePath		, 6
)		6 7
;		7 8
var

 
outputStream

 
=

 
File

 #
.

# $
Create

$ *
(

* +

targetPath

+ 5
)

5 6
;

6 7
inputStream 
. 
CopyTo 
( 
outputStream +
)+ ,
;, -
} 	
} 
} Ç
]G:\Prototypes\IDisposable-Practices\demo7\src\WordCounter\WordCounter.App\IO\FolderWatcher.cs
	namespace 	
WordCounter
 
. 
App 
. 
IO 
{ 
public 

class 
FolderWatcher 
{		 
private

 
FileSystemWatcher

  
_watcher

! )
;

) *
public 
void 
Start 
( 
string  
path! %
,% &
string' -
filter. 4
,4 5
Func6 :
<: ;
string; A
,A B
TaskC G
>G H
onFileCreatedI V
)V W
{ 	
var 
fullPath 
= 
Path 
.  
GetFullPath  +
(+ ,
path, 0
)0 1
;1 2
_watcher 
= 
new 
FileSystemWatcher ,
(, -
fullPath- 5
,5 6
filter7 =
)= >
;> ?
_watcher 
. 
Created 
+= 
async  %
(& '
x' (
,( )
y* +
)+ ,
=>- /
{ 
Thread 
. 
Sleep 
( 
$num !
)! "
;" #
Console 
. 
	WriteLine !
(! "
$str" 6
+7 8
y9 :
.: ;
Name; ?
)? @
;@ A
await 
onFileCreated #
(# $
y$ %
.% &
FullPath& .
). /
;/ 0
} 
; 
_watcher 
. 
EnableRaisingEvents (
=) *
true+ /
;/ 0
} 	
} 
} –Y
TG:\Prototypes\IDisposable-Practices\demo7\src\WordCounter\WordCounter.App\Program.cs
	namespace 	
WordCounter
 
. 
App 
{ 
class 	
Program
 
{ 
private 
static 
IConfiguration %
_Config& -
;- .
private 
static 
string 

_InputPath (
;( )
private 
static 
string 
_ArchivePath *
;* +
private 
static 
readonly 
FolderWatcher  -
_Watcher. 6
=7 8
new9 <
FolderWatcher= J
(J K
)K L
;L M
static 
void 
Main 
( 
string 
[  
]  !
args" &
)& '
{ 	
_Config 
= 
new  
ConfigurationBuilder .
(. /
)/ 0
. 
AddJsonFile 
( 
$str 0
)0 1
. 
Build 
( 
) 
; 

_InputPath 
= 
_Config  
[  !
$str! :
]: ;
;; <
_ArchivePath 
= 
_Config "
[" #
$str# >
]> ?
;? @
EnsureDirectory 
( 

_InputPath &
)& '
;' (
EnsureDirectory 
( 
_ArchivePath (
)( )
;) *
Console!! 
.!! 
	WriteLine!! 
(!! 
$str!! R
)!!R S
;!!S T
var"" 
command"" 
="" 
$str"" 
;"" 
while## 
(## 
command## 
!=## 
$str## !
)##! "
{$$ 
command%% 
=%% 
Console%% !
.%%! "
ReadLine%%" *
(%%* +
)%%+ ,
;%%, -
switch&& 
(&& 
command&& 
)&&  
{'' 
case(( 
$str(( 
:(( 
Start)) 
()) 
))) 
;))  
break** 
;** 
case,, 
$str,, 
:,, 
GC-- 
.-- 
Collect-- "
(--" #

generation--# -
:--- .
$num--/ 0
,--0 1
GCCollectionMode--2 B
.--B C
Forced--C I
,--I J
blocking--K S
:--S T
true--U Y
,--Y Z

compacting--[ e
:--e f
true--g k
)--k l
;--l m
break.. 
;.. 
}// 
}00 
}11 	
private33 
static33 
void33 
EnsureDirectory33 +
(33+ ,
string33, 2
path333 7
)337 8
{44 	
if55 
(55 
!55 
	Directory55 
.55 
Exists55 !
(55! "
path55" &
)55& '
)55' (
{66 
	Directory77 
.77 
CreateDirectory77 )
(77) *
path77* .
)77. /
;77/ 0
}88 
}99 	
private;; 
static;; 
void;; 
Start;; !
(;;! "
);;" #
{<< 	
_Watcher== 
.== 
Start== 
(== 

_InputPath== %
,==% &
$str==' .
,==. /
ProcessFile==0 ;
)==; <
;==< =
Console>> 
.>> 
	WriteLine>> 
(>> 
$">>  
$str>>  -
{>>- .

_InputPath>>. 8
}>>8 9
">>9 :
)>>: ;
;>>; <
}?? 	
privateAA 
staticAA 
asyncAA 
TaskAA !
ProcessFileAA" -
(AA- .
stringAA. 4
pathAA5 9
)AA9 :
{BB 	
varCC 
	stopwatchCC 
=CC 
	StopwatchCC %
.CC% &
StartNewCC& .
(CC. /
)CC/ 0
;CC0 1
ConsoleDD 
.DD 
	WriteLineDD 
(DD 
$strDD 1
+DD2 3
pathDD4 8
)DD8 9
;DD9 :
varEE 
archivePathEE 
=EE 
PathEE "
.EE" #
CombineEE# *
(EE* +
_ArchivePathEE+ 7
,EE7 8
$"EE9 ;
{EE; <
GuidEE< @
.EE@ A
NewGuidEEA H
(EEH I
)EEI J
}EEJ K
$strEEK O
"EEO P
)EEP Q
;EEQ R
ConsoleFF 
.FF 
	WriteLineFF 
(FF 
$strFF .
+FF/ 0
archivePathFF1 <
)FF< =
;FF= >
newGG 
FileArchiverGG 
(GG 
)GG 
.GG 
CopyFileGG '
(GG' (
pathGG( ,
,GG, -
archivePathGG. 9
)GG9 :
;GG: ;
ConsoleII 
.II 
	WriteLineII 
(II 
$strII 7
)II7 8
;II8 9
varJJ 
	sqlClientJJ 
=JJ 
newJJ 
	SqlClientJJ  )
(JJ) *
_ConfigJJ* 1
)JJ1 2
;JJ2 3
awaitKK 
	sqlClientKK 
.KK 
CreateFeedResultsKK -
(KK- .
pathKK. 2
,KK2 3
$numKK4 5
,KK5 6
$numKK7 8
,KK8 9
$numKK: ;
)KK; <
;KK< =
varMM #
cancellationTokenSourceMM '
=MM( )
newMM* -#
CancellationTokenSourceMM. E
(MME F
)MMF G
;MMG H
varNN 
apiTasksNN 
=NN 
newNN 
ListNN #
<NN# $
TaskNN$ (
<NN( )
intNN) ,
>NN, -
>NN- .
(NN. /
)NN/ 0
;NN0 1
varPP 
linesPP 
=PP 
FilePP 
.PP 
ReadAllLinesPP )
(PP) *
pathPP* .
)PP. /
;PP/ 0
forQQ 
(QQ 
varQQ 
iQQ 
=QQ 
$numQQ 
;QQ 
iQQ 
<QQ 
linesQQ  %
.QQ% &
LengthQQ& ,
;QQ, -
iQQ. /
++QQ/ 1
)QQ1 2
{RR 
varTT 

lineNumberTT 
=TT  
iTT! "
;TT" #
varUU 
lineUU 
=UU 
linesUU  
[UU  !
iUU! "
]UU" #
;UU# $
apiTasksVV 
.VV 
AddVV 
(VV 
TaskVV !
.VV! "
RunVV" %
(VV% &
asyncVV& +
(VV, -
)VV- .
=>VV/ 1
awaitVV2 7
GetWordCountVV8 D
(VVD E
pathVVE I
,VVI J

lineNumberVVK U
,VVU V
lineVVW [
,VV[ \#
cancellationTokenSourceVV] t
)VVt u
)VVu v
)VVv w
;VVw x
}WW 
tryYY 
{ZZ 
Task[[ 
.[[ 
WaitAll[[ 
([[ 
apiTasks[[ %
.[[% &
ToArray[[& -
([[- .
)[[. /
,[[/ 0#
cancellationTokenSource[[1 H
.[[H I
Token[[I N
)[[N O
;[[O P
var\\ 
	wordCount\\ 
=\\ 
apiTasks\\  (
.\\( )
Sum\\) ,
(\\, -
x\\- .
=>\\/ 1
x\\2 3
.\\3 4
Result\\4 :
)\\: ;
;\\; <
Console^^ 
.^^ 
	WriteLine^^ !
(^^! "
$str^^" 8
)^^8 9
;^^9 :
await__ 
	sqlClient__ 
.__  
UpdateFeedResults__  1
(__1 2
path__2 6
,__6 7
lines__8 =
.__= >
Length__> D
,__D E
	wordCount__F O
,__O P
	stopwatch__Q Z
.__Z [
ElapsedMilliseconds__[ n
)__n o
;__o p
Console`` 
.`` 
	WriteLine`` !
(``! "
$str``" 9
,``9 :
	stopwatch``; D
.``D E
ElapsedMilliseconds``E X
)``X Y
;``Y Z
Filebb 
.bb 
Deletebb 
(bb 
pathbb  
)bb  !
;bb! "
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
Consoleff 
.ff 
	WriteLineff %
(ff% &
$strff& 6
+ff7 8
exff9 ;
.ff; <
Messageff< C
)ffC D
;ffD E
}gg 
}hh 	
privatejj 
staticjj 
asyncjj 
Taskjj !
<jj! "
intjj" %
>jj% &
GetWordCountjj' 3
(jj3 4
stringjj4 :
pathjj; ?
,jj? @
intjjA D

lineNumberjjE O
,jjO P
stringjjQ W
linejjX \
,jj\ ]#
CancellationTokenSourcejj^ u$
cancellationTokenSource	jjv ç
)
jjç é
{kk 	
varll 
	wordCountll 
=ll 
$numll 
;ll #
cancellationTokenSourcemm #
.mm# $
Tokenmm$ )
.mm) *(
ThrowIfCancellationRequestedmm* F
(mmF G
)mmG H
;mmH I
trynn 
{oo 
varpp 
excerptpp 
=pp 
linepp "
.pp" #
Lengthpp# )
>pp* +
$numpp, /
?pp0 1
linepp2 6
.pp6 7
	Substringpp7 @
(pp@ A
$numppA B
,ppB C
$numppD G
)ppG H
:ppI J
lineppK O
;ppO P
Consoleqq 
.qq 
	WriteLineqq !
(qq! "
$strqq" B
,qqB C

lineNumberqqD N
,qqN O
excerptqqP W
)qqW X
;qqX Y
varss 
	apiClientss 
=ss 
newss  #
	ApiClientss$ -
(ss- .
_Configss. 5
)ss5 6
;ss6 7
	wordCounttt 
=tt 
awaittt !
	apiClienttt" +
.tt+ ,
GetWordCounttt, 8
(tt8 9
linett9 =
)tt= >
;tt> ?
varvv 
	sqlClientvv 
=vv 
newvv  #
	SqlClientvv$ -
(vv- .
_Configvv. 5
)vv5 6
;vv6 7
awaitww 
	sqlClientww 
.ww  
SaveLineResultsww  /
(ww/ 0
pathww0 4
,ww4 5

lineNumberww6 @
,ww@ A
	wordCountwwB K
,wwK L
excerptwwM T
)wwT U
;wwU V
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
Console{{ 
.{{ 
	WriteLine{{ !
({{! "
$"{{" $
$str{{$ +
{{{+ ,
ex{{, .
}{{. /
"{{/ 0
){{0 1
;{{1 2#
cancellationTokenSource|| '
.||' (
Cancel||( .
(||. /
)||/ 0
;||0 1
}}} 
return~~ 
	wordCount~~ 
;~~ 
} 	
}
ÄÄ 
}ÅÅ ‚
_G:\Prototypes\IDisposable-Practices\demo7\src\WordCounter\WordCounter.App\Services\ApiClient.cs
	namespace 	
WordCounter
 
. 
App 
. 
Services "
{ 
public 

class 
	ApiClient 
{		 
private

 
readonly

 
IConfiguration

 '
_config

( /
;

/ 0
public 
	ApiClient 
( 
IConfiguration '
config( .
). /
{ 	
_config 
= 
config 
; 
} 	
public 
async 
Task 
< 
int 
> 
GetWordCount +
(+ ,
string, 2
input3 8
)8 9
{ 	
var 
model 
= 
new 
WordCountModel *
{ 
Line 
= 
input 
} 
; 

HttpClient 

httpClient !
=" #
new$ '
(' (
)( )
;) *
var 
	apiClient 
= 
new  
WordCounterApiClient  4
(4 5
_config5 <
[< =
$str= R
]R S
,S T

httpClientU _
)_ `
;` a
return 
await 
	apiClient "
." #
WordCountAsync# 1
(1 2
model2 7
)7 8
;8 9
} 	
} 
} 