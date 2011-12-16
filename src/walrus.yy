%start document

%%

document
  : text EOF { return new yy.Template( $1 ) }
  ;

text
  : statements { $$ = $1 }
  ;

statements
  : statements statement { $1.push( $2 ); $$ = $1 }
  | statement { $$ = [ $1 ] }
  ;

statement
  : mustache { $$ = $1 }
  | CONTENT { $$ = new yy.ContentNode( $1 ) }
  ;

mustache
  : OPEN mustachery CLOSE { $$ = $2 }
  ;

mustachery
  : expression { $$ = $1 }
  ;

expression
  : ATTR paths { $$ = new yy.MemberNode( $2 ) }
  ;

paths
  : paths DELIMETER path { $1.push( $3 ); $$ = $1 }
  | path { $$ = [ $1 ] }
  ;

path
  : method { $$ = $1 }
  | member { $$ = $1 }
  ;

method
  : MEMBER OPEN_PAREN expression CLOSE_PAREN { $$ = $1 }
  | MEMBER OPEN_PAREN CLOSE_PAREN { $$ = $1 }
  ;

member
  : MEMBER { $$ = $1 }
  ;
