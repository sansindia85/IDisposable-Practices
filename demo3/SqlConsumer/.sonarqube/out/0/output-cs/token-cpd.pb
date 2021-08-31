Û
WG:\Prototypes\IDisposable-Practices\demo3\SqlConsumer\SqlConsumer.Core\DatabaseState.cs
	namespace 	
SqlConsumer
 
. 
Core 
{ 
public 

class 
DatabaseState 
{ 
	protected 
SqlConnection 

Connection  *
;* +
private		 
readonly		 
string		 
_connectionString		  1
;		1 2
public 
DatabaseState 
( 
IConfiguration +
config, 2
)2 3
:4 5
this6 :
(: ;
config; A
.A B
GetConnectionStringB U
(U V
$strV Z
)Z [
)[ \
{] ^
}_ `
public 
DatabaseState 
( 
string #
connectionString$ 4
)4 5
{ 	
_connectionString 
= 
connectionString  0
;0 1
} 	
public 
virtual 
string 
GetDate %
(% &
)& '
{ 	
if 
( 

Connection 
== 
null "
)" #
{ 

Connection 
= 
new  
SqlConnection! .
(. /
_connectionString/ @
)@ A
;A B

Connection 
. 
Open 
(  
)  !
;! "
} 
using 
( 
var 
command 
=  

Connection! +
.+ ,
CreateCommand, 9
(9 :
): ;
); <
{ 
command 
. 
CommandText #
=$ %
$str& 8
;8 9
return 
command 
. 
ExecuteScalar ,
(, -
)- .
.. /
ToString/ 7
(7 8
)8 9
;9 :
} 
} 	
} 
}   