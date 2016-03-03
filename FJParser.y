{
-- Gerador de um parser para a definição básica do Featherweight JAVA
-- Autor: Samuel da Silva Feitosa
-- Data: 28/05/2014
-------------------------------------------------------------------------------

module FJParser where
import Data.Char
import Data.Complex
}

%name parser
%tokentype { Token }
%error { parseError }

%token
-- Palavras reservadas da linguagem FlyJ
    class	{ TokenKWClass }
    extends	{ TokenKWExtends }
    super	{ TokenKWSuper }
    this	{ TokenKWThis }
    new		{ TokenKWNew }
    return	{ TokenKWReturn }
    Object	{ TokenKWObject }
    if 		{ TokenKWIf }
    else	{ TokenKWElse }
    let		{ TokenKWLet }
    in		{ TokenKWIn }
    invoke	{ TokenKWInvoke }
    boolean	{ TokenKWBoolean }
    true	{ TokenKWTrue }
    false	{ TokenKWFalse }
    Complex	{ TokenKWComplex }
    ComplexOne	{ TokenKWComplexOne }
    ComplexZero	{ TokenKWComplexZero }
    ComplexHalf	{ TokenKWComplexHalf }
    ComplexMHalf { TokenKWComplexMHalf }
    mzero	{ TokenKWMZero }
    mreturn	{ TokenKWMReturn }
    mplus	{ TokenKWMPlus }
--    mminus	{ TokenKWMMinus }
    Vec		{ TokenKWVec }
-- Caracteres especiais
    '{'		{ TokenLBrace }
    '}'		{ TokenRBrace }
    '('		{ TokenLParen }
    ')'		{ TokenRParen }
    ','		{ TokenComma }
    ';'		{ TokenSemi }
    '.'		{ TokenDot }
    '='		{ TokenAssign }
    '<'		{ TokenLT }
    '>'         { TokenGT }
    "->"	{ TokenArrow }
    '*'		{ TokenTimes }
    '+'		{ TokenPlus }
    '-'		{ TokenMinus }
    "=="	{ TokenEqual }
    ">>="	{ TokenBind }
    "$*"	{ TokenScalar }
    "<*>"	{ TokenTensor }
-- Nomes definidos pelo programador (classes, metodos, atributos)
    name	{ TokenName $$ }
    number	{ TokenNumber $$ }

-- Definição de precedências
%nonassoc "==" 
%right in
%left '+'
%left '*' 
%left "$*"
%left "<*>"

%%

-- Codigos do programa
Program		: ClassList Term ';'								{ Program $1 $2 }

-- Lista de classes
ClassList	: ClassDef									{ [$1] }
		| ClassList ClassDef								{ $2 : $1 }

-- Definicao de classe
ClassDef	: class ClassName GenericDefList extends ClassName '{' AttrList ConstrDef MethodList '}' { ($2,ClassDef $2 $3 $5 $7 $8 $9) }

-- Definicao de construtor
ConstrDef	: ClassName '(' ParamList ')' '{' super '(' ArgList ')' ';' AttrAssignList '}'	{ ConstrDef $1 $3 $8 $11 }

-- Lista de implementacao de metodos
MethodList	: {- empty -}									{ [] }
		| MethodList MethodDef								{ $2 : $1 }

-- Definicao de metodos
--MethodDef	: GenericDefList TypeDef name '(' ParamList ')' '{' return Term ';' '}'		{ MethodDef $1 $2 $3 $5 $9 }
MethodDef	: TypeDef name '(' ParamList ')' '{' return Term ';' '}'			{ MethodDef $1 $2 $4 $8 }

-- Lista de declaracao de parametros para construtores e definicao de funcoes 
-- Parametros Formais
ParamList	: {- empty -}									{ [] }
		| IdentStmt									{ [$1] }
		| ParamList ',' IdentStmt							{ $3 : $1 }

-- Lista de argumentos utilizados para passar informações nas chamadas de funções
-- Parametros Atuais
ArgList		: {- empty -}									{ [] }
		| name										{ [$1] }
		| ArgList ',' name								{ $3 : $1 }

-- Lista de atributos de classe (declaracao)
AttrList	: {- empty -}									{ [] }
		| AttrList IdentStmt ';'							{ $2 : $1 }

-- Lista de atribuicao interna de atributos (utilizada no construtor da classe)
AttrAssignList 	: {- empty -}									{ [] }
		| AttrAssign									{ [$1] }
		| AttrAssignList AttrAssign							{ $2 : $1 }

-- Atribuicao interna de atributos
AttrAssign	: this '.' name '=' name ';'							{ ($3,$5) }

-- Definicao de atributos ou parametros
IdentStmt	: TypeDef name									{ ($1,$2) }

-- Definicao de tipos
TypeDef		: boolean									{ TypeBool }
		| Complex									{ TypeComplex }
		| ClassName GenericList								{ TypeClass $1 $2 }
		| '(' TypeList "->" TypeDef ')'							{ TypeClosure $4 $2 }
		| '{' TypeList '}'								{ TypeTuple $2 }
		| Vec '<' TypeDef '>' 								{ TypeQuantum $3 }

-- Lista de tipos utilizados para as Closures
TypeList 	: {- empty -}									{ [] }
		| TypeDef									{ [$1] }
		| TypeList ',' TypeDef								{ $3 : $1 }

-- Definicao de tipos genericos
GenericDefList	: {- empty -}									{ [] }
		| '<' ExtendsList '>'								{ $2 }

ExtendsList	: ClassName extends ClassName							{ [($1,$3)] }
		| ExtendsList ',' ClassName extends ClassName					{ ($3,$5) : $1 }

GenericList	: {- empty -}									{ [] }
		| '<' TypeList '>'								{ $2 }

--ClassNameList 	: ClassName								{ [$1] }
--		| ClassNameList ',' ClassName							{ $3 : $1 }

-- Nomes de classes
ClassName	: Object									{ "Object" }
		| name										{ $1 }

-- Lista de termos
TermList	: {- empty -}									{ [] }
		| Term										{ [$1] }
		| TermList ',' Term								{ $3 : $1 }

-- Termos (utilizados no corpo dos métodos)
Term		: BooleanLiteral								{ BooleanLiteral $1 }
		| ComplexLiteral								{ ComplexLiteral $1 }
		| name										{ Var $1 }
		| this '.' name									{ ThisAccessAttr $3 }
		| this '.' name '(' TermList ')'						{ ThisAccessMeth $3 $5 }
		| Term '.' name									{ AttrAccess $1 $3 }
--		| Term '.' name GenericList '(' TermList ')'					{ MethodAccess $1 $3 $4 $6 }
		| Term '.' name '(' TermList ')'						{ MethodAccess $1 $3 $5 }
		| new ClassName GenericList '(' TermList ')'					{ CreateObject $2 $3 $5 }
		| '(' ClassName ')' Term							{ Cast $2 $4 }
		| if '(' Term ')' '{' Term '}' else '{' Term '}'				{ If $3 $6 $10 }
		| let name '=' Term in Term							{ Let $2 $4 $6 }
		| '(' ParamList ')' "->" Term							{ ClosureDef $2 $5 }
		| '(' Term ')' '.' invoke '(' TermList ')' 					{ InvokeClosure $2 $7 }
		| '{' TermList '}'	 							{ Tuple $2 }
		| Term '.' number								{ TupleAccess $1 $3 }
		| Term '*' Term									{ ComplexTimes $1 $3 }
		| Term '+' Term									{ ComplexPlus $1 $3 }
		| Term '-' Term									{ ComplexMinus $1 $3 }
		| Term "==" Term								{ RelEquals $1 $3 }
		| mzero										{ MonadZero }
		| mreturn Term									{ MonadReturn $2 }
		| '(' Term ')' ">>=" Term							{ MonadBind $2 $5 }
		| '(' Term ')' mplus '(' Term ')'						{ MonadPlus $2 $6 }
--		| '(' Term ')' mminus '(' Term ')'						{ MonadMinus $2 $6 } 
		| Term "$*" Term								{ ScalarProduct $1 $3 }
		| '(' Term ')' "<*>" '(' Term ')'						{ TensorProduct $2 $6 }



-- Booleanos
BooleanLiteral	: true										{ BLTrue }
		| false										{ BLFalse }

-- Numeros Complexos
ComplexLiteral	: ComplexOne									{ ComplexNumber 1.0 }
		| ComplexZero									{ ComplexNumber 0.0 }
        	| ComplexHalf									{ ComplexHalf }
        	| ComplexMHalf									{ ComplexMHalf }



-- Inicio da codificacao do Lexer
---------------------------------
{

parseError :: [Token] -> a
parseError _ = error "Sintax Error: Sequencia de caracteres invalida para analise." 

instance Show Term where
  show (EmptyTerm) = ""
  show (BooleanLiteral BLFalse) = "false"
  show (BooleanLiteral BLTrue) = "true"
  show (ComplexLiteral (ComplexHalf)) = "1 / sqrt(2)"
  show (ComplexLiteral (ComplexMHalf)) = "-1 / sqrt(2)"
  show (ComplexLiteral (ComplexNumber cn)) = show cn
  show (ComplexLiteral (ComplexTimesHalf cn)) = " 1 / sqrt(2) * " ++ show cn
  show (Var v) = v
  show (ThisAccessAttr a) = "this." ++ a
  show (ThisAccessMeth m p) = "this." ++ m ++ show p
  show (AttrAccess t a) = show t ++ "." ++ a
  show (MethodAccess t m p) = show t ++ "." ++ m ++ "(" ++ show (reverse p) 
                                   ++ ")"
  show (CreateObject c g p) = "new " ++ c ++ "<" ++ show (reverse g) ++ ">" 
                              ++ show (reverse p)
  show (Cast c t) = "(" ++ c ++ ")" ++ show t
  show (If t1 t2 t3) = "if (" ++ show t1 ++ ") { " ++ show t2 ++ 
                             " } else { " ++ show t3 ++ " }"
  show (Let v t1 t2) = v ++ " = " ++ show t1 ++ " in " ++ show t2
  show (ClosureDef p t) = "(" ++ show (reverse p) ++ ") -> " ++ show t
  show (InvokeClosure t tl) = "(" ++ show t ++ ").invoke(" ++ show tl ++ ")"
  show (Tuple tl) = "{" ++ show (reverse tl) ++ "}"
  show (TupleAccess t i) = show t ++ "." ++ show i
  show (ComplexTimes t1 t2) = show t1 ++ " * " ++ show t2
  show (ComplexPlus t1 t2) = show t1 ++ " + " ++ show t2
  show (ComplexMinus t1 t2) = show t1 ++ " - " ++ show t2
  show (RelEquals t1 t2) = show t1 ++ " == " ++ show t2
  show (MonadZero) = "mzero"
  show (MonadReturn t) = "mreturn " ++ show t
  show (MonadBind t1 t2) = show t1 ++ " >>= " ++ show t2
  show (MonadPlus t1 t2) = show t1 ++ " mplus " ++ show t2
--  show (MonadMinus t1 t2) = show t1 ++ " mminus " ++ show t2
  show (ScalarProduct t1 t2) = show t1 ++ " $* (" ++ show t2 ++ ")"

-- Definições sintáticas da linguagem FlyJ
------------------------------------------
data Program		= Program [(String,ClassDef)] Term
			deriving (Show, Eq)

data ClassDef		= ClassDef String [(String,String)] String [(Type,String)] ConstrDef [MethodDef]
			deriving (Show, Eq)

data ConstrDef		= ConstrDef String [(Type,String)] [String] [(String,String)]
			deriving (Show, Eq)

--data MethodDef		= MethodDef [(String,String)] Type String [(Type,String)] Term
data MethodDef		= MethodDef Type String [(Type,String)] Term
			deriving (Show, Eq)

data Term		= EmptyTerm
			| BooleanLiteral BooleanLiteral
			| ComplexLiteral ComplexLiteral
			| Var String
			| ThisAccessAttr String
			| ThisAccessMeth String [Term]
			| AttrAccess Term String
--			| MethodAccess Term String [Type] [Term]
			| MethodAccess Term String [Term]
			| CreateObject String [Type] [Term]
			| Cast String Term
			| If Term Term Term
			| Let String Term Term
			| ClosureDef [(Type,String)] Term
			| InvokeClosure Term [Term]
			| Tuple [Term]
			| TupleAccess Term Int
			| ComplexTimes Term Term
			| ComplexPlus Term Term
			| ComplexMinus Term Term
			| RelEquals Term Term
			| MonadZero
			| MonadReturn Term
			| MonadBind Term Term
			| MonadPlus Term Term
--			| MonadMinus Term Term
			| ScalarProduct Term Term
			| TensorProduct Term Term
			deriving (Eq)
--                        deriving (Show,Eq)

data TermNL		= VarNL Int
			| ClosureDefNL [Type] TermNL
			| InvokeClosureNL TermNL [TermNL]
			deriving (Show, Eq)

data BooleanLiteral	= BLTrue
			| BLFalse
			deriving (Show, Eq)

data ComplexLiteral	= ComplexHalf
			| ComplexMHalf
			| ComplexNumber (Complex Double)
			| ComplexTimesHalf (Complex Double)
			deriving (Show, Eq)

-- Tipos de dados - adicionado em 14/11/2014 para suportar
-- tipos de objetos e tipos de closures.
-------------------------------------------------------------------------------
data Type		= TypeBool
			| TypeComplex
			| TypeClass String [Type]
			| TypeClosure Type [Type]
			| TypeTuple [Type]
			| TypeQuantum Type
                        deriving (Show, Eq)

data Token		= TokenKWClass
			| TokenKWExtends
			| TokenKWSuper
			| TokenKWThis
			| TokenKWNew
			| TokenKWReturn
			| TokenKWObject
			| TokenKWIf
			| TokenKWElse
			| TokenKWLet
			| TokenKWIn
			| TokenKWInvoke
			| TokenKWBoolean
			| TokenKWTrue
			| TokenKWFalse
			| TokenKWComplex
			| TokenKWComplexOne
			| TokenKWComplexZero
			| TokenKWComplexHalf
			| TokenKWComplexMHalf
			| TokenKWMZero
			| TokenKWMReturn
			| TokenKWMPlus
			| TokenKWMMinus
			| TokenKWVec
			| TokenArrow
			| TokenTimes
			| TokenPlus
			| TokenMinus
			| TokenEqual
			| TokenLBrace
			| TokenRBrace
			| TokenLParen
			| TokenRParen
			| TokenComma
			| TokenSemi
			| TokenDot
			| TokenAssign
			| TokenLT
			| TokenGT
			| TokenBind
			| TokenScalar
			| TokenTensor
			| TokenName String
			| TokenNumber Int
			deriving (Show)

-- Leitura de código fonte e transformação em lista de Tokens (análise léxica)
------------------------------------------------------------------------------

-- Função: isToken
-- Objetivo: Verificar se o caracter lido pertence aos definidos para os 
-- operadores da linguagem
-- Autor: Samuel
-- Data: 22/12/2014
-------------------------------------------------------------------------------
isToken :: Char -> Bool
isToken c = elem c "<>=-*$"


-- Função: lexer
-- Objetivo: Analisador léxico da linguagem
-- Autor: Samuel
-------------------------------------------------------------------------------
lexer :: String -> [Token]
lexer [] = []
lexer ('{':cs) = TokenLBrace : lexer cs
lexer ('}':cs) = TokenRBrace : lexer cs
lexer ('(':cs) = TokenLParen : lexer cs
lexer (')':cs) = TokenRParen : lexer cs
lexer (',':cs) = TokenComma : lexer cs
lexer (';':cs) = TokenSemi : lexer cs
lexer ('.':cs) = TokenDot : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer (c:cs)	| isSpace c = lexer cs
		| isAlpha c = lexStr (c:cs)
		| isDigit c = lexDigit (c:cs)
		| isToken c = lexSymbol (c:cs)

lexStr cs = case span isAlpha cs of
		("class", rest)		-> TokenKWClass : lexer rest
		("extends", rest)	-> TokenKWExtends : lexer rest
		("super", rest)		-> TokenKWSuper : lexer rest
		("this", rest)		-> TokenKWThis : lexer rest
		("new", rest)		-> TokenKWNew : lexer rest
		("return", rest)	-> TokenKWReturn : lexer rest
		("Object", rest)	-> TokenKWObject : lexer rest
		("if", rest)		-> TokenKWIf : lexer rest
		("else", rest)		-> TokenKWElse : lexer rest
		("let", rest)		-> TokenKWLet : lexer rest
		("in", rest)		-> TokenKWIn : lexer rest
		("invoke", rest)	-> TokenKWInvoke : lexer rest
		("boolean", rest)	-> TokenKWBoolean : lexer rest
		("true", rest)		-> TokenKWTrue : lexer rest
		("false", rest)		-> TokenKWFalse : lexer rest
		("Complex", rest)	-> TokenKWComplex : lexer rest
		("ComplexOne", rest)	-> TokenKWComplexOne : lexer rest
		("ComplexZero", rest)	-> TokenKWComplexZero : lexer rest
		("ComplexHalf", rest)	-> TokenKWComplexHalf : lexer rest
		("ComplexMHalf", rest)	-> TokenKWComplexMHalf : lexer rest
		("mzero", rest)		-> TokenKWMZero : lexer rest
		("mreturn", rest)	-> TokenKWMReturn : lexer rest
		("mplus", rest)		-> TokenKWMPlus : lexer rest
--		("mminus", rest)	-> TokenKWMMinus : lexer rest
		("Vec", rest)		-> TokenKWVec : lexer rest
		(name, rest)		-> TokenName name : lexer rest

lexDigit cs = case span isDigit cs of
		(number, rest)		-> TokenNumber (read number :: Int) : lexer rest

lexSymbol cs = case span isToken cs of
		("->", rest)		-> TokenArrow : lexer rest
		(">>=", rest)		-> TokenBind : lexer rest
		("==", rest)		-> TokenEqual : lexer rest
		("$*", rest)		-> TokenScalar : lexer rest
		("<*>", rest)		-> TokenTensor : lexer rest
                ("=", rest)		-> TokenAssign : lexer rest
		("-", rest)		-> TokenMinus : lexer rest
		("*", rest)		-> TokenTimes : lexer rest
		("<", rest)		-> TokenLT : lexer rest
		(">", rest)		-> TokenGT : lexer rest


-- main = getContents >>= print . parser . lexer

}

