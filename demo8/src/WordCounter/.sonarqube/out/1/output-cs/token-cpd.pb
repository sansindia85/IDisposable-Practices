Ç
gG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Data\BookFeedContext.cs
	namespace		 	
WordCounter		
 
.		 
	ModernApp		 
.		  
Data		  $
{

 
public 

class 
BookFeedContext  
:! "
	DbContext# ,
{ 
public 
DbSet 
< 
BookFeed 
> 
	BookFeeds (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DbSet 
< 
BookLine 
> 
	BookLines (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
BookFeedContext 
( 
DbContextOptions /
</ 0
BookFeedContext0 ?
>? @
optionsA H
)H I
:J K
baseL P
(P Q
optionsQ X
)X Y
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
BookFeed  (
>( )
() *
)* +
. 
ToTable 
( 
$str #
)# $
. 
HasMany 
( 
x 
=> 
x 
.  
	BookLines  )
)) *
. 
WithOne 
( 
y 
=> 
y 
.  
BookFeed  (
)( )
. 
HasForeignKey 
( 
y  
=>! #
y$ %
.% &

BookFeedId& 0
)0 1
;1 2
modelBuilder 
. 
Entity 
<  
BookLine  (
>( )
() *
)* +
. 
ToTable 
( 
$str #
)# $
;$ %
} 	
} 
}   Ó
fG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Data\Model\BookFeed.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
.  
Data  $
.$ %
Model% *
{ 
public 

partial 
class 
BookFeed !
{ 
public 
BookFeed 
( 
) 
{		 	
this

 
.

 
	BookLines

 
=

 
new

  
List

! %
<

% &
BookLine

& .
>

. /
(

/ 0
)

0 1
;

1 2
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Path 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
	LineCount 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
	WordCount 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
long 
? "
ProcessingMilliseconds +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
virtual 
ICollection "
<" #
BookLine# +
>+ ,
	BookLines- 6
{7 8
get9 <
;< =
set> A
;A B
}C D
} 
} º

fG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Data\Model\BookLine.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
.  
Data  $
.$ %
Model% *
{ 
public 

partial 
class 
BookLine !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public		 
int		 

BookFeedId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
int

 

LineNumber

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
int 
	WordCount 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Excerpt 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
BookFeed 
BookFeed  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} î
bG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\IO\FileArchiver.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
.  
IO  "
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
{ 	
using		 
var		 
inputStream		 !
=		" #
File		$ (
.		( )
OpenRead		) 1
(		1 2

sourcePath		2 <
)		< =
;		= >
using

 
(

 
var

 
outputStream

 #
=

$ %
File

& *
.

* +
Create

+ 1
(

1 2

targetPath

2 <
)

< =
)

= >
{ 
inputStream 
. 
CopyTo "
(" #
outputStream# /
)/ 0
;0 1
} 
} 	
} 
} ÷"
cG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\IO\FolderWatcher.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
.  
IO  "
{ 
public		 

class		 
FolderWatcher		 
:		  
IDisposable		! ,
{

 
private 
readonly 
BookFeedProcessor *

_processor+ 5
;5 6
private 
readonly 
ILogger  
_logger! (
;( )
private 
FileSystemWatcher !
_watcher" *
;* +
private 
bool 
disposedValue "
;" #
public 
FolderWatcher 
( 
BookFeedProcessor .
	processor/ 8
,8 9
ILogger: A
<A B
FolderWatcherB O
>O P
loggerQ W
)W X
{ 	

_processor 
= 
	processor "
;" #
_logger 
= 
logger 
; 
} 	
public 
BookFeedProcessor  
BookFeedProcessor! 2
{ 	
get 
=> 
default 
; 
set 
{ 
} 
} 	
public 
void 
Start 
( 
string  
path! %
,% &
string' -
filter. 4
)4 5
{ 	
var   
fullPath   
=   
Path   
.    
GetFullPath    +
(  + ,
path  , 0
)  0 1
;  1 2
_watcher!! 
=!! 
new!! 
FileSystemWatcher!! ,
(!!, -
fullPath!!- 5
,!!5 6
filter!!7 =
)!!= >
;!!> ?
_watcher"" 
."" 
Created"" 
+="" 
async""  %
(""& '
x""' (
,""( )
y""* +
)""+ ,
=>""- /
{## 
Thread%% 
.%% 
Sleep%% 
(%% 
$num%% !
)%%! "
;%%" #
Console&& 
.&& 
	WriteLine&& !
(&&! "
$str&&" 6
+&&7 8
y&&9 :
.&&: ;
Name&&; ?
)&&? @
;&&@ A
await'' 

_processor''  
.''  !
ProcessFile''! ,
('', -
y''- .
.''. /
FullPath''/ 7
)''7 8
;''8 9
}(( 
;(( 
_watcher)) 
.)) 
EnableRaisingEvents)) (
=))) *
true))+ /
;))/ 0
_logger** 
.** 
LogInformation** "
(**" #
$"**# %
$str**% 2
{**2 3
path**3 7
}**7 8
"**8 9
)**9 :
;**: ;
}++ 	
public-- 
void-- 
Stop-- 
(-- 
)-- 
{.. 	
if// 
(// 
_watcher// 
!=// 
null//  
)//  !
{00 
_watcher11 
.11 
EnableRaisingEvents11 ,
=11- .
false11/ 4
;114 5
}22 
}33 	
	protected55 
virtual55 
void55 
Dispose55 &
(55& '
bool55' +
	disposing55, 5
)555 6
{66 	
if77 
(77 
!77 
disposedValue77 
)77 
{88 
if99 
(99 
	disposing99 
&&99  
_watcher99! )
!=99* ,
null99- 1
)991 2
{:: 
_watcher;; 
.;; 
Dispose;; $
(;;$ %
);;% &
;;;& '
_watcher<< 
=<< 
null<< #
;<<# $
}== 
disposedValue>> 
=>> 
true>>  $
;>>$ %
}?? 
}@@ 	
publicBB 
voidBB 
DisposeBB 
(BB 
)BB 
{CC 	
DisposeEE 
(EE 
	disposingEE 
:EE 
trueEE #
)EE# $
;EE$ %
GCFF 
.FF 
SuppressFinalizeFF 
(FF  
thisFF  $
)FF$ %
;FF% &
}GG 	
}HH 
}II òF
oG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Processors\BookFeedProcessor.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
.  

Processors  *
{ 
public 

class 
BookFeedProcessor "
{ 
private 
readonly 
BookFeedContext (
_context) 1
;1 2
private 
readonly 
FileArchiver %
_fileArchiver& 3
;3 4
private 
readonly  
IServiceScopeFactory -
_scopeFactory. ;
;; <
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
string 
_archivePath  ,
;, -
public 
BookFeedProcessor  
(  !
BookFeedContext! 0
context1 8
,8 9
FileArchiver: F
fileArchiverG S
,S T 
IServiceScopeFactoryU i
scopeFactoryj v
,v w
IConfiguration	x †
config
‡ 
,
 Ž
ILogger
 –
<
– —
BookFeedProcessor
— ¨
>
¨ ©
logger
ª °
)
° ±
{ 	
_context 
= 
context 
; 
_fileArchiver 
= 
fileArchiver (
;( )
_scopeFactory 
= 
scopeFactory (
;( )
_logger 
= 
logger 
; 
_archivePath   
=   
config   !
[  ! "
$str  " =
]  = >
;  > ?
}!! 	
public## 
FileArchiver## 
FileArchiver## (
{$$ 	
get%% 
=>%% 
default%% 
;%% 
set&& 
{'' 
}(( 
})) 	
public++ 
BookFeedContext++ 
BookFeedContext++ .
{,, 	
get-- 
=>-- 
default-- 
;-- 
set.. 
{// 
}00 
}11 	
public33 
async33 
Task33 
ProcessFile33 %
(33% &
string33& ,
path33- 1
)331 2
{44 	
var55 
	stopwatch55 
=55 
	Stopwatch55 %
.55% &
StartNew55& .
(55. /
)55/ 0
;550 1
_logger66 
.66 
LogInformation66 "
(66" #
$str66# 6
+667 8
path669 =
)66= >
;66> ?
var88 
archivePath88 
=88 
Path88 "
.88" #
Combine88# *
(88* +
_archivePath88+ 7
,887 8
$"889 ;
{88; <
Guid88< @
.88@ A
NewGuid88A H
(88H I
)88I J
}88J K
$str88K O
"88O P
)88P Q
;88Q R
_logger99 
.99 
LogInformation99 "
(99" #
$str99# 3
+994 5
archivePath996 A
)99A B
;99B C
_fileArchiver:: 
.:: 
CopyFile:: "
(::" #
path::# '
,::' (
archivePath::) 4
)::4 5
;::5 6
_logger<< 
.<< 
LogInformation<< "
(<<" #
$str<<# <
)<<< =
;<<= >
_context== 
.== 
	BookFeeds== 
.== 
Add== "
(==" #
new==# &
BookFeed==' /
{>> 
Path?? 
=?? 
path?? 
,?? 
	LineCount@@ 
=@@ 
$num@@ 
,@@ 
	WordCountAA 
=AA 
$numAA 
,AA "
ProcessingMillisecondsBB &
=BB' (
$numBB) *
}CC 
)CC 
;CC 
awaitDD 
_contextDD 
.DD 
SaveChangesAsyncDD +
(DD+ ,
)DD, -
;DD- .
usingFF 
(FF 
varFF #
cancellationTokenSourceFF .
=FF/ 0
newFF1 4#
CancellationTokenSourceFF5 L
(FFL M
)FFM N
)FFN O
{GG 
varHH 
apiTasksHH 
=HH 
newHH "
ListHH# '
<HH' (
TaskHH( ,
<HH, -
intHH- 0
>HH0 1
>HH1 2
(HH2 3
)HH3 4
;HH4 5
varJJ 
linesJJ 
=JJ 
FileJJ  
.JJ  !
ReadAllLinesJJ! -
(JJ- .
pathJJ. 2
)JJ2 3
;JJ3 4
forKK 
(KK 
varKK 
iKK 
=KK 
$numKK 
;KK 
iKK  !
<KK" #
linesKK$ )
.KK) *
LengthKK* 0
;KK0 1
iKK2 3
++KK3 5
)KK5 6
{LL 
varMM 

lineNumberMM "
=MM# $
iMM% &
;MM& '
varNN 
lineNN 
=NN 
linesNN $
[NN$ %
iNN% &
]NN& '
;NN' (
apiTasksOO 
.OO 
AddOO  
(OO  !
TaskOO! %
.OO% &
RunOO& )
(OO) *
asyncOO* /
(OO0 1
)OO1 2
=>OO3 5
{PP 
usingQQ 
(QQ 
varQQ "
scopeQQ# (
=QQ) *
_scopeFactoryQQ+ 8
.QQ8 9
CreateScopeQQ9 D
(QQD E
)QQE F
)QQF G
{RR 
varSS 
	processorSS  )
=SS* +
scopeSS, 1
.SS1 2
ServiceProviderSS2 A
.SSA B
GetRequiredServiceSSB T
<SST U
BookLineProcessorSSU f
>SSf g
(SSg h
)SSh i
;SSi j
returnTT "
awaitTT# (
	processorTT) 2
.TT2 3
GetWordCountTT3 ?
(TT? @
pathTT@ D
,TTD E

lineNumberTTF P
,TTP Q
lineTTR V
,TTV W#
cancellationTokenSourceTTX o
)TTo p
;TTp q
}UU 
}VV 
)VV 
)VV 
;VV 
}WW 
tryXX 
{YY 
TaskZZ 
.ZZ 
WaitAllZZ  
(ZZ  !
apiTasksZZ! )
.ZZ) *
ToArrayZZ* 1
(ZZ1 2
)ZZ2 3
,ZZ3 4#
cancellationTokenSourceZZ5 L
.ZZL M
TokenZZM R
)ZZR S
;ZZS T
var[[ 
	wordCount[[ !
=[[" #
apiTasks[[$ ,
.[[, -
Sum[[- 0
([[0 1
x[[1 2
=>[[3 5
x[[6 7
.[[7 8
Result[[8 >
)[[> ?
;[[? @
_logger]] 
.]] 
LogInformation]] *
(]]* +
$str]]+ A
)]]A B
;]]B C
var^^ 
bookFeed^^  
=^^! "
_context^^# +
.^^+ ,
	BookFeeds^^, 5
.^^5 6
First^^6 ;
(^^; <
x^^< =
=>^^> @
x^^A B
.^^B C
Path^^C G
==^^H J
path^^K O
)^^O P
;^^P Q
bookFeed__ 
.__ 
	LineCount__ &
=__' (
lines__) .
.__. /
Length__/ 5
;__5 6
bookFeed`` 
.`` 
	WordCount`` &
=``' (
	wordCount``) 2
;``2 3
bookFeedaa 
.aa "
ProcessingMillisecondsaa 3
=aa4 5
	stopwatchaa6 ?
.aa? @
ElapsedMillisecondsaa@ S
;aaS T
awaitbb 
_contextbb "
.bb" #
SaveChangesAsyncbb# 3
(bb3 4
)bb4 5
;bb5 6
_loggerdd 
.dd 
LogInformationdd *
(dd* +
$strdd+ B
,ddB C
	stopwatchddD M
.ddM N
ElapsedMillisecondsddN a
)dda b
;ddb c
Fileee 
.ee 
Deleteee 
(ee  
pathee  $
)ee$ %
;ee% &
}ff 
catchgg 
(gg 
	Exceptiongg  
exgg! #
)gg# $
{hh 
_loggerii 
.ii 
LogErrorii $
(ii$ %
$strii% 5
+ii6 7
exii8 :
.ii: ;
Messageii; B
)iiB C
;iiC D
}jj 
finallykk 
{ll 
apiTaskspp 
.pp 
ForEachpp $
(pp$ %
xpp% &
=>pp' )
{qq 
xrr 
.rr 
Disposerr !
(rr! "
)rr" #
;rr# $
xss 
=ss 
nullss  
;ss  !
}tt 
)tt 
;tt 
apiTasksuu 
.uu 
Clearuu "
(uu" #
)uu# $
;uu$ %
}vv 
}ww 
}xx 	
}yy 
}zz Ž#
oG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Processors\BookLineProcessor.cs
	namespace

 	
WordCounter


 
.

 
	ModernApp

 
.

  

Processors

  *
{ 
public 

class 
BookLineProcessor "
{ 
private 
readonly 
BookFeedContext (
_context) 1
;1 2
private 
readonly 
	ApiClient "

_apiClient# -
;- .
private 
readonly 
ILogger  
_logger! (
;( )
public 
BookLineProcessor  
(  !
BookFeedContext! 0
context1 8
,8 9
	ApiClient: C
	apiClientD M
,M N
ILoggerO V
<V W
BookLineProcessorW h
>h i
loggerj p
)p q
{ 	
_context 
= 
context 
; 

_apiClient 
= 
	apiClient "
;" #
_logger 
= 
logger 
; 
} 	
public 
	ApiClient 
	ApiClient "
{ 	
get 
=> 
default 
; 
set 
{ 
} 
} 	
public!! 
BookFeedContext!! 
BookFeedContext!! .
{"" 	
get## 
=>## 
default## 
;## 
set$$ 
{%% 
}&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
int)) 
>)) 
GetWordCount)) +
())+ ,
string)), 2
path))3 7
,))7 8
int))9 <

lineNumber))= G
,))G H
string))I O
line))P T
,))T U#
CancellationTokenSource))V m$
cancellationTokenSource	))n …
)
))… †
{** 	
var++ 
	wordCount++ 
=++ 
$num++ 
;++ #
cancellationTokenSource,, #
.,,# $
Token,,$ )
.,,) *(
ThrowIfCancellationRequested,,* F
(,,F G
),,G H
;,,H I
try-- 
{.. 
var// 
excerpt// 
=// 
line// "
.//" #
Length//# )
>//* +
$num//, /
?//0 1
line//2 6
.//6 7
	Substring//7 @
(//@ A
$num//A B
,//B C
$num//D G
)//G H
://I J
line//K O
;//O P
_logger00 
.00 
LogInformation00 &
(00& '
$str00' G
,00G H

lineNumber00I S
,00S T
excerpt00U \
)00\ ]
;00] ^
	wordCount11 
=11 
await11 !

_apiClient11" ,
.11, -
GetWordCount11- 9
(119 :
line11: >
)11> ?
;11? @
var33 
bookFeed33 
=33 
await33 $
_context33% -
.33- .
	BookFeeds33. 7
.337 8

FirstAsync338 B
(33B C
x33C D
=>33E G
x33H I
.33I J
Path33J N
==33O Q
path33R V
)33V W
;33W X
bookFeed44 
.44 
	BookLines44 "
.44" #
Add44# &
(44& '
new44' *
BookLine44+ 3
{55 

LineNumber66 
=66  

lineNumber66! +
,66+ ,
	WordCount77 
=77 
	wordCount77  )
,77) *
Excerpt88 
=88 
excerpt88 %
}99 
)99 
;99 
await:: 
_context:: 
.:: 
SaveChangesAsync:: /
(::/ 0
)::0 1
;::1 2
};; 
catch<< 
(<< 
	Exception<< 
ex<< 
)<<  
{== 
_logger>> 
.>> 
LogError>>  
(>>  !
$str>>! *
+>>+ ,
ex>>- /
.>>/ 0
Message>>0 7
)>>7 8
;>>8 9#
cancellationTokenSource?? '
.??' (
Cancel??( .
(??. /
)??/ 0
;??0 1
}@@ 
returnAA 
	wordCountAA 
;AA 
}BB 	
}CC 
}DD ²4
ZG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Program.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
{ 
class 	
Program
 
{ 
private 
static 
IConfiguration %
_Config& -
;- .
private 
static 
string 

_InputPath (
;( )
private 
static 
string 
_ArchivePath *
;* +
private 
static 
ServiceProvider &
_ServiceProvider' 7
;7 8
static 
void 
Main 
( 
string 
[  
]  !
args" &
)& '
{ 	
_Config 
= 
new  
ConfigurationBuilder .
(. /
)/ 0
. 
AddJsonFile 
( 
$str 0
)0 1
. 
Build 
( 
) 
; 
var 
services 
= 
new 
ServiceCollection 0
(0 1
)1 2
. 
AddSingleton 
( 
_Config %
)% &
. 

AddLogging 
( 
builder #
=>$ &
{ 
builder   
.   
AddConfiguration   ,
(  , -
_Config  - 4
.  4 5

GetSection  5 ?
(  ? @
$str  @ I
)  I J
)  J K
;  K L
builder!! 
.!! 

AddConsole!! &
(!!& '
)!!' (
;!!( )
}"" 
)"" 
.## 
AddHttpClient## 
(## 
)##  
;##  !
services%% 
.%% 
AddSingleton%% !
<%%! "
FolderWatcher%%" /
>%%/ 0
(%%0 1
)%%1 2
.&& 
AddTransient&& 
<&& 
FileArchiver&& *
>&&* +
(&&+ ,
)&&, -
.'' 
AddTransient'' 
<'' 
	ApiClient'' '
>''' (
(''( )
)'') *
.(( 
AddTransient(( 
<(( 
BookFeedProcessor(( /
>((/ 0
(((0 1
)((1 2
.)) 
AddTransient)) 
<)) 
BookLineProcessor)) /
>))/ 0
())0 1
)))1 2
;))2 3
services.. 
... 
AddDbContext.. !
<..! "
BookFeedContext.." 1
>..1 2
(..2 3
options// 
=>// 
options// "
.//" #
UseSqlServer//# /
(/// 0
_Config//0 7
.//7 8
GetConnectionString//8 K
(//K L
$str//L W
)//W X
)//X Y
,//Y Z
ServiceLifetime00 
.00  
	Transient00  )
)00) *
;00* +
_ServiceProvider22 
=22 
services22 '
.22' ( 
BuildServiceProvider22( <
(22< =
)22= >
;22> ?

_InputPath44 
=44 
_Config44  
[44  !
$str44! :
]44: ;
;44; <
_ArchivePath55 
=55 
_Config55 "
[55" #
$str55# >
]55> ?
;55? @
EnsureDirectory66 
(66 

_InputPath66 &
,66& '
_ArchivePath66( 4
)664 5
;665 6
Console88 
.88 
	WriteLine88 
(88 
$str88 _
)88_ `
;88` a
var99 
command99 
=99 
$str99 
;99 
while:: 
(:: 
command:: 
!=:: 
$str:: !
)::! "
{;; 
command<< 
=<< 
Console<< !
.<<! "
ReadLine<<" *
(<<* +
)<<+ ,
;<<, -
switch== 
(== 
command== 
)==  
{>> 
case?? 
$str?? 
:?? 
Start@@ 
(@@ 
)@@ 
;@@  
breakAA 
;AA 
caseCC 
$strCC 
:CC 
StopDD 
(DD 
)DD 
;DD 
breakEE 
;EE 
caseGG 
$strGG 
:GG 
GCHH 
.HH 
CollectHH "
(HH" #

generationHH# -
:HH- .
$numHH/ 0
,HH0 1
GCCollectionModeHH2 B
.HHB C
ForcedHHC I
,HHI J
blockingHHK S
:HHS T
trueHHU Y
,HHY Z

compactingHH[ e
:HHe f
trueHHg k
)HHk l
;HHl m
breakII 
;II 
}JJ 
}KK 
}LL 	
privateNN 
staticNN 
voidNN 
EnsureDirectoryNN +
(NN+ ,
paramsNN, 2
stringNN3 9
[NN9 :
]NN: ;
pathsNN< A
)NNA B
{OO 	
foreachPP 
(PP 
varPP 
pathPP 
inPP  
pathsPP! &
)PP& '
{QQ 
ifRR 
(RR 
!RR 
	DirectoryRR 
.RR 
ExistsRR %
(RR% &
pathRR& *
)RR* +
)RR+ ,
{SS 
	DirectoryTT 
.TT 
CreateDirectoryTT -
(TT- .
pathTT. 2
)TT2 3
;TT3 4
}UU 
}VV 
}WW 	
privateYY 
staticYY 
voidYY 
StartYY !
(YY! "
)YY" #
{ZZ 	
var[[ 
watcher[[ 
=[[ 
_ServiceProvider[[ *
.[[* +
GetRequiredService[[+ =
<[[= >
FolderWatcher[[> K
>[[K L
([[L M
)[[M N
;[[N O
watcher\\ 
.\\ 
Start\\ 
(\\ 

_InputPath\\ $
,\\$ %
$str\\& -
)\\- .
;\\. /
}]] 	
private__ 
static__ 
void__ 
Stop__  
(__  !
)__! "
{`` 	
varaa 
watcheraa 
=aa 
_ServiceProvideraa *
.aa* +
GetRequiredServiceaa+ =
<aa= >
FolderWatcheraa> K
>aaK L
(aaL M
)aaM N
;aaN O
watcherbb 
.bb 
Stopbb 
(bb 
)bb 
;bb 
}cc 	
}dd 
}ee ®
eG:\Prototypes\IDisposable-Practices\demo8\src\WordCounter\WordCounter.ModernApp\Services\ApiClient.cs
	namespace 	
WordCounter
 
. 
	ModernApp 
.  
Services  (
{ 
public		 

class		 
	ApiClient		 
{

 
private 
readonly 
IConfiguration '
_config( /
;/ 0
private 
IHttpClientFactory "
_httpClientFactory# 5
;5 6
public 
	ApiClient 
( 
IHttpClientFactory +
httpClientFactory, =
,= >
IConfiguration? M
configN T
)T U
{ 	
_httpClientFactory 
=  
httpClientFactory! 2
;2 3
_config 
= 
config 
; 
} 	
public 
async 
Task 
< 
int 
> 
GetWordCount +
(+ ,
string, 2
input3 8
)8 9
{ 	
var 
model 
= 
new 
WordCountModel *
{ 
Line 
= 
input 
} 
; 
var 

httpClient 
= 
_httpClientFactory /
./ 0
CreateClient0 <
(< =
)= >
;> ?
var   
	apiClient   
=   
new    
WordCounterApiClient    4
(  4 5
_config  5 <
[  < =
$str  = R
]  R S
,  S T

httpClient  U _
)  _ `
;  ` a
return!! 
await!! 
	apiClient!! "
.!!" #
WordCountAsync!!# 1
(!!1 2
model!!2 7
)!!7 8
;!!8 9
}"" 	
}## 
}$$ 