-- Type Checker para a linguagem FlyJ
-- Autor: Samuel da Silva Feitosa
-- Data: 04/05/2014
-------------------------------------------------------------------------------
module FJTypeChecker where
import FJParser
import FJUtils

-- Definições de tipos utilizados no Type Checker da linguagem FlyJ
-- Objetivo: Facilitar a manipulação das estruturas de dados.
-- Autor: Samuel
-- Data: 04/06/2014
-------------------------------------------------------------------------------
type TypeContext = [(Term,Type)]
type TypeClosure = (String,[Type])

-- Função: typecheck 
-- Objetivo: Percorrer o código fonte e verificar se há algum erro de tipo.
-- Autor: Samuel
-- Data: 04/06/2014
-------------------------------------------------------------------------------
typecheck :: Program -> Program
typecheck prog = if (checkProgram prog) then
                   prog
                 else
                   error "Erro na checagem de tipos do programa!"

-- Função: checkProgram
-- Objetivo: Verificar se o programa está bem tipado e coerente em sua escrita.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkProgram :: Program -> Bool
checkProgram (Program ct t) = ((checkClassTable ct ct) && (checkTerm t ct []))

-- Função: checkClassTable
-- Objetivo: Verificar se a tabela de classes está completa e todas as suas
-- classes estão corretas.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkClassTable :: FJClassTable -> FJClassTable -> Bool
checkClassTable [] _ = True
checkClassTable (h:t) ct = if (checkClass (snd(h)) ct []) then
                             checkClassTable t ct
                           else
                             False

-- Função: checkTerm
-- Objetivo: Verificar se o termo está declarado corretamente com relação aos
-- seus tipos.
-- Autor: Samuel
-- Data: 05/06/2014 - 11/06/2014
-------------------------------------------------------------------------------
checkTerm :: Term -> FJClassTable -> TypeContext -> Bool
checkTerm (BooleanLiteral _) _ _ = True -- Accept Bool
checkTerm (ComplexLiteral _) _ _ = True -- Accept Complex
checkTerm (Var v) _ ctx = let tp = getTypeFromContext ctx (Var v)
                         in True -- POG
checkTerm (ThisAccessAttr v) _ ctx = 
    let tp = getTypeFromContext ctx (ThisAccessAttr v)
      in True -- POG
checkTerm (AttrAccess t f) ct ctx = checkTerm t ct ctx
checkTerm (MethodAccess t m tl) ct ctx = 
    let tp = typeof ctx t ct
        n  = getNameFromType tp
        g  = getGenFromType tp
        ex = fst(methodTypeLookup m n g ct)
      in (checkTerm t ct ctx) && (checkParamList ex tl ct ctx)
checkTerm (CreateObject obj g tl) ct ctx = 
    let fl = fieldLookup obj g ct ct
      in (classTableContains (TypeClass obj g) ct) &&
         (checkConstrParamList fl tl ct ctx)
checkTerm (Cast c t) ct ctx = 
                       if (isSubtype (getNameFromType((typeof [] t ct)))
                                                                 c ct ct) then
                         True
                       else 
                         False
checkTerm (If c t1 t2) ct ctx = 
    let c'  = typeof ctx c ct
        t1' = typeof ctx t1 ct
        t2' = typeof ctx t2 ct
      in
        if (c' == TypeBool) then
          if (t1' == t2') then
            True
          else
            error "Condicional com tipos invalidos!"
        else 
          error "Condicao invalida!"
checkTerm (Let v t1 t2) ct ctx = let t1' = typeof ctx t1 ct
                                     ctx' = addToContext ctx (Var v) t1'
                                   in 
                                     checkTerm t2 ct ctx'
                                     --error ((show v) ++ (show t1') ++ (show ctx') ++ (show t2))
-- WF-Closure
checkTerm (ClosureDef pc t) ct ctx = (checkClosureTerm t pc ct) &&
                                     (checkClosureParamDefs pc ct)
checkTerm (InvokeClosure t tl) ct ctx = let tt = typeof ctx t ct
                                          in checkClosureInv tt tl ct ctx
-- Tuples
checkTerm (Tuple tl) ct ctx = checkTupleList tl ct ctx
checkTerm (TupleAccess t idx) ct ctx = let tp = typeof ctx t ct
                                         in checkTupleIndex tp idx 
checkTerm (ComplexTimes t1 t2) ct ctx = checkMathOperator t1 t2 ct ctx
checkTerm (ComplexPlus t1 t2) ct ctx = checkMathOperator t1 t2 ct ctx
checkTerm (ComplexMinus t1 t2) ct ctx = checkMathOperator t1 t2 ct ctx
checkTerm (RelEquals t1 t2) ct ctx = let t1' = typeof ctx t1 ct
                                         t2' = typeof ctx t2 ct
                                       in True -- POG
checkTerm (MonadReturn t) ct ctx = checkMonadReturn (typeof ctx t ct)
--checkTerm (MonadBind t1 t2) ct ctx = True
checkTerm (MonadBind t1 t2) ct ctx = let tp1 = typeof ctx t1 ct
                                         tp2 = typeof ctx t2 ct
                                       in checkMonadBind tp1 tp2
checkTerm (MonadPlus t1 t2) ct ctx = let tp1 = typeof ctx t1 ct
                                         tp2 = typeof ctx t2 ct
                                       in checkMonadicOperator tp1 tp2 
--checkTerm (MonadMinus t1 t2) ct ctx = let tp1 = typeof ctx t1 ct
--                                          tp2 = typeof ctx t2 ct
--                                        in checkMonadicOperator tp1 tp2 
checkTerm (ScalarProduct c t) ct ctx = let tc = typeof ctx c ct
                                           tt = typeof ctx t ct
                                         in checkScalarProduct tc tt 
checkTerm t ct ctx = error ("Erro no processamento do termo: " ++ show t)

-- Função: checkMonadReturn
-- Objetivo: Verificar se o tipo do termo associado ao construtor monadico
-- é de um tipo valido segundo a semântica da linguagem.
-- Parametros: Tipo do termo.
-- Autor: Samuel
-- Data: 22/05/2015
-------------------------------------------------------------------------------
checkMonadReturn :: Type -> Bool
checkMonadReturn TypeBool = True
checkMonadReturn (TypeTuple []) = True
checkMonadReturn (TypeTuple (h:t)) = if (checkMonadReturn h) then
                                         checkMonadReturn (TypeTuple t)
                                     else
                                         False
checkMonadReturn _ = False

-- Função: checkMonadBind
-- Objetivo: Verificar se os parametros utilizados no operador "bind" estao com
-- os tipos definidos corretamente.
-- Parâmetros: Tipo monadico, tipo função.
-- Autor: Samuel
-- Data: 22/05/2015
-------------------------------------------------------------------------------
checkMonadBind :: Type -> Type -> Bool
checkMonadBind (TypeQuantum bt) (TypeClosure (TypeQuantum _) pt) = 
    if ([bt] == pt) then
        True
    else
        False
checkMonadBind _ _ = False

-- Função: checkMonadicOperator
-- Objetivo: Verificar se os tipos utilizados no operador monadico estao 
-- corretos.
-- Parametros: Tipo do termo da esquerda, tipo do termo da direta.
-- Autor: Samuel
-- Data: 22/05/2015
-------------------------------------------------------------------------------
checkMonadicOperator :: Type -> Type -> Bool
checkMonadicOperator (TypeQuantum t1) (TypeQuantum t2) = t1 == t2
checkMonadicOperator _ _ = False

-- Função: checkScalarProduct
-- Objetivo: Verificar se os tipos utilizados no produto escalar estao
-- definidos corretamente.
-- Parametros: tipo do termo da esquerda, tipo do termo da direita.
-- Autor: Samuel
-- Data: 22/05/2015
-------------------------------------------------------------------------------
checkScalarProduct :: Type -> Type -> Bool
checkScalarProduct (TypeComplex) (TypeQuantum _) = True
checkScalarProduct _ _ = False

-- Função: checkMathOperator
-- Objetivo: Verificar se os tipos utilizados com os operadores matematicos 
-- estao corretos.
-- Parametros: termo esquerdo, direito, tabela de classes e contexto. 
-- Autor: Samuel
-- Data: 21/05/2015
-------------------------------------------------------------------------------
checkMathOperator :: Term -> Term -> FJClassTable -> TypeContext -> Bool
checkMathOperator t1 t2 ct ctx = 
    let t1' = typeof ctx t1 ct
        t2' = typeof ctx t2 ct
      in (t1' == TypeComplex) && (t2' == TypeComplex) 

-- Função: checkTupleList
-- Objetivo: Verificar se cada elemento da tupla está declarado corretamente de
-- acordo com a tabela de classes.
-- Parametros: Lista de termos, tabela de classes, contexto.
-- Autor: Samuel
-- Data: 23/12/2014
-------------------------------------------------------------------------------
checkTupleList :: [Term] -> FJClassTable -> TypeContext -> Bool
checkTupleList [] _ _ = True
checkTupleList (h:t) ct ctx = if (checkTerm h ct ctx) then
                                  checkTupleList t ct ctx
                              else
                                  False

-- Função: checkTupleIndex
-- Objetivo: Verificar se o indice de acesso ao elemento da tupla existe.
-- Parametros: Type, indice.
-- Autor: Samuel
-- Data: 23/12/2014
-------------------------------------------------------------------------------
checkTupleIndex :: Type -> Int -> Bool
checkTupleIndex (TypeTuple tl) idx = if (length tl >= idx) then
                                         True
                                     else
                                         error "Indice de tupla invalido!"
checkTupleIndex _ _ = error "Tipo de tupla invalido!"

-- Função: checkParamList
-- Objetivo: Verificar se uma lista de termos possui todos os seus tipos 
-- declarados corretamente.
-- Autor: Samuel
-- Data: 11/06/2014
-------------------------------------------------------------------------------
checkParamList :: [Type] -> [Term] -> FJClassTable -> TypeContext -> Bool
checkParamList [] [] _ _ = True
checkParamList (h1:t1) (h2:t2) ct ctx = if (checkTerm h2 ct ctx) && 
                              (isSubtype (getNameFromType((typeof ctx h2 ct))) 
                                         (getNameFromType(h1)) ct ct) 
                                    then
                                      checkParamList t1 t2 ct ctx
                                    else
                                      False
checkParamList _ _ _ _ = error "Parametros do metodo incorretos."

-- Função: checkConstrParamList
-- Objetivo: Verificar se uma lista de termos possui todos os seus termos 
-- declarados corretamente.
-- Parametros: Lista de parametros formais, lista de termos (param. atuais),
-- tabela de classes.
-- Autor: Samuel
-- Data: 11/06/2014
-------------------------------------------------------------------------------
checkConstrParamList :: [(Type,String)] -> [Term] -> FJClassTable 
                                                        -> TypeContext -> Bool
checkConstrParamList [] [] _ _ = True
checkConstrParamList (h1:t1) (h2:t2) ct ctx = 
                         if (checkTerm h2 ct ctx) && 
                           (isSubtype (getNameFromType((typeof ctx h2 ct))) 
                                      (getNameFromType((fst(h1)))) ct ct) 
                         then
                           checkConstrParamList t1 t2 ct ctx
                         else
                           error "Tipo de parametro do construtor incorreto."
checkConstrParamList _ _ _ _ = error "Parametros do construtor incorretos."

-- Função: checkClosureParamList
-- Objetivo: Verificar se uma lista de termos possui todos os seus termos 
-- declarados corretamente.
-- Parametros: Lista de tipos dos parametros, lista de termos (param. atuais),
-- tabela de classes.
-- Autor: Samuel
-- Data: 11/06/2014
-------------------------------------------------------------------------------
checkClosureParamList :: [Type] -> [Term] -> FJClassTable 
                                                        -> TypeContext -> Bool
checkClosureParamList [] [] _ _ = True
checkClosureParamList (h1:t1) (h2:t2) ct ctx = 
                         if (checkTerm h2 ct ctx) && 
                           (isSubtype (getNameFromType((typeof ctx h2 ct))) 
                                      (getNameFromType(h1)) ct ct) 
                         then
                           checkClosureParamList t1 t2 ct ctx
                         else
                           error "Tipo de parametro da Closure incorreto."
checkClosureParamList _ _ _ _ = error "Parametros da Closure incorretos."


-- Função: checkClosureParamDefs
-- Objetivo: Verificar se os parametros da closure estão definidos corretamente.
-- Parametros: Lista de parametros, tabela de classes.
-- Autor: Samuel
-- Data: 19/11/2014
-------------------------------------------------------------------------------
checkClosureParamDefs :: [(Type,String)] -> FJClassTable -> Bool
checkClosureParamDefs [] _ = True
checkClosureParamDefs ((c,_):t) ct = if (classTableContains c ct) then
                                   checkClosureParamDefs t ct
                                 else 
                                   False

-- Função: checkClosureInv
-- Objetivo: Verificar se a invocacao da closure esta correta de acordo com os 
-- seus tipos.
-- Parametros: Tipo da closure, lista de termos, tabela de classes.
-- Autor: Samuel
-- Data: 19/11/2014
-------------------------------------------------------------------------------
checkClosureInv :: Type -> [Term] -> FJClassTable -> TypeContext -> Bool
checkClosureInv (TypeClosure r pc) tl ct ctx = 
                                     (classTableContains r ct) &&
                                     (checkClosureParamList pc tl ct ctx)
checkClosureInv _ _ _ _ = error "Tipo de closure invalido."

-- Função: checkClass
-- Objetivo: Verificar se uma classe está correta em sua escrita e em termo de
-- seus tipos.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkClass :: ClassDef -> FJClassTable -> TypeContext -> Bool
checkClass (ClassDef n g p attr cons meth) ct ctx = 
      ((checkConstructor n cons ct) && (checkMethods n meth ct ctx))
-- @TODO: Ver se fica assim mesmo a checagem da classe
--    ((checkAttributes attr ct) && (checkConstructor n g cons ct) &&
--     (checkMethods n meth ct ctx)) 

-- Função: checkAttributes
-- Objetivo: Verificar se os atributos estão declarados corretamente e não 
-- existem duplicados.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkAttributes :: [(Type,String)] -> FJClassTable -> Bool
checkAttributes [] _ = True
checkAttributes ((c,n):t) ct = if (classTableContains c ct) 
                                && (not (elem (c,n) t)) then
                             checkAttributes t ct
                           else 
                             False

-- Função: checkConstructor
-- Objetivo: Verificar se um construtor está corretamente declarado.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkConstructor :: String -> ConstrDef -> FJClassTable -> Bool 
checkConstructor n (ConstrDef cn pc sp th) ct = 
    if ((n == cn) && 
        (checkConstrParams pc fl ct) &&
        (checkSuperParams (reverse sp) (reverse pc)) &&
        (checkThisAssign th pc)) then
        True
    else 
        False
    where 
        fl = fieldLookup cn [] ct ct

-- Função: checkConstrParams
-- Objetivo: Verificar se os parâmetros passados para o construtor são de tipos
-- válidos.
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
checkConstrParams :: [(Type,String)] -> [(Type,String)] -> FJClassTable -> Bool
checkConstrParams [] [] _ = True
checkConstrParams (h1:t1) (h2:t2) ct = 
                      if (isSubtype (getNameFromType(fst(h1))) 
                                    (getNameFromType(fst(h2))) ct ct) then
                        checkConstrParams t1 t2 ct
                      else
                        error "Erro verificando parametros do construtor."


-- Função: checkSuperParams 
-- Objetivo: Verificar se os parâmetros passados para "super" são os primeiros
-- recebidos pelo construtor da classe.
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
checkSuperParams :: [String] -> [(Type,String)] -> Bool
checkSuperParams [] _ = True
checkSuperParams (h1:t1) (h2:t2) = if (h1 == snd(h2)) then
                                     checkSuperParams t1 t2
                                   else
                       error "Parametros passados para 'super' incorretamente."
  

-- Função: checkThisAssign
-- Objetivo: Verificar se as atribuições a campos internos da classe estão 
-- sendo utilizados corretamente.
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
checkThisAssign :: FJKeyPair -> [(Type,String)] -> Bool
checkThisAssign [] _ = True
checkThisAssign (h1:t1) (h2:t2) = if (fst(h1) == snd(h1) && 
                                      snd(h1) == snd(h2)) then
                                         checkThisAssign t1 t2
                                       else
                                         error "Erro nas atribuicoes 'this'."

-- Função: checkMethods 
-- Objetivo: Verificar se os métodos estão declarados corretamente e coerentes
-- com relação aos seus tipos.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkMethods :: String -> [MethodDef] -> FJClassTable -> TypeContext -> Bool
checkMethods _ [] _ _ = True
checkMethods c (h:t) ct ctx = 
                        if (checkMethod c h ct ctx) && (not (elem h t)) then
                          checkMethods c t ct ctx
                        else
                          error "Declaracao de metodo duplicado."

-- Função: checkMethod
-- Objetivo: Verificar se o método está corretamente declarado e coerente com
-- seu processamento e tipos de retorno.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
checkMethod :: String -> MethodDef -> FJClassTable -> TypeContext -> Bool
checkMethod c (MethodDef r n pm t) ct ctx = if ((checkMethodParams pm ct) &&
                                           (checkMethodTerm c r t pm ct ctx)) 
                                      then
                                        True
                                      else 
                                        error "Erro na checagem do metodo."

-- Função: checkMethodParams
-- Objetivo: Verificar se os parâmetros do método estão declarados de modo
-- correto.
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
checkMethodParams :: [(Type,String)] -> FJClassTable -> Bool
checkMethodParams _ _ = True
-- @TODO: Ajustar
--checkMethodParams [] _ = True
--checkMethodParams ((c,_):t) ct = 
--    if (classTableContains c ct) then
--        checkMethodParams t ct
--    else
--        error "Parametro declarado com classe nao definida." 

-- Função: checkMethodTerm
-- Objetivo: Verificar se o termo utilizado dentro do método está declarado
-- corretamente.
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
checkMethodTerm :: String -> Type -> Term -> [(Type,String)] 
                                        -> FJClassTable -> TypeContext -> Bool
checkMethodTerm c r t pm ct ctx = True
-- @TODO: Ajustar
--checkMethodTerm c r t pm ct ctx = 
--        if ((isSubtype (getNameFromType((typeof ctx'' t ct))) 
--                   (getNameFromType(r)) ct ct) && (checkTerm t ct ctx'')) then
--          True
--        else
--          error "Erro na checagem do termo no corpo do metodo."
--        where
          -- Adiciona os parametros do método ao contexto
--          ctx'  = addKeyPairToContext ctx pm
          -- Adiciona campos internos da classe ao contexto 
--          ctx'' = addAttrsToContext ctx' (fieldLookup c [] ct ct) 

-- Função: checkClosureTerm
-- Objetivo: Verificar se o tipo de retorna da closure existe na tabela de 
-- classes.
-- Parametros: Termo, lista de parametros, tabela de classes.
-- Autor: Samuel
-- Data: 19/11/2014 
-------------------------------------------------------------------------------
checkClosureTerm :: Term -> [(Type,String)] -> FJClassTable -> Bool
checkClosureTerm t pc ct = classTableContains (typeof ctx t ct) ct
                         where
                           ctx = addKeyPairToContext [] pc

-- Função: addKeyPairToContext
-- Objetivo: Adicionar variáveis ao contexto
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
addKeyPairToContext :: TypeContext -> [(Type,String)] -> TypeContext
addKeyPairToContext [] [] = []
addKeyPairToContext ctx [] = ctx
addKeyPairToContext ctx (h:t) = (addToContext ctx (Var (snd h)) (fst h)) ++ 
                                (addKeyPairToContext ctx t)

-- Função: addAttrsToContext
-- Objetivo: Adicionar os campos internos da classe ao contexto
-- Autor: Samuel
-- Data: 16/06/2014
-------------------------------------------------------------------------------
addAttrsToContext :: TypeContext -> [(Type,String)] -> TypeContext
addAttrsToContext [] [] = []
addAttrsToContext ctx [] = ctx
addAttrsToContext ctx (h:t) = (addToContext ctx (ThisAccessAttr (snd h)) (fst h)) ++
                              (addAttrsToContext ctx t)

-- Função: addToContext
-- Objetivo: Adicionar uma informação de tipo ao contexto
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
addToContext :: TypeContext -> Term -> Type -> TypeContext
addToContext ctx t c = (t,c) : ctx


-- Função: getNameFromType
-- Objetivo: Retornar o nome da classe a partir de um Type.
-- Parametros: Tipo
-- Autor: Samuel
-- Data: 17/11/2014
-------------------------------------------------------------------------------
getNameFromType :: Type -> String
getNameFromType (TypeBool) = "boolean"
getNameFromType (TypeComplex) = "Complex"
getNameFromType (TypeClass n g) = n
getNameFromType (TypeClosure n _) = getNameFromType n
getNameFromType (TypeQuantum bt) = "Vec"
getNameFromType (TypeTuple _) = "Tuple"

-- Função: getGenFromType
-- Objetivo: Retornar a lista de tipos genericos utilizados na construcao do 
-- objeto.
-- Parametros: Tipo
-- Autor: Samuel
-- Data: 21/05/2015
-------------------------------------------------------------------------------
getGenFromType :: Type -> [Type]
getGenFromType (TypeClass _ g) = g
getGenFromType _ = []


-- Função: typeof
-- Objetivo: Retornar o tipo de um termo.
-- Autor: Samuel
-- Data: 04/06/2014 - 11/06/2014
-------------------------------------------------------------------------------
typeof :: TypeContext -> Term -> FJClassTable -> Type
-- Literal Types
typeof ctx (BooleanLiteral _) _ = TypeBool
-- Complex Types
typeof ctx (ComplexLiteral _) _ = TypeComplex
-- T-Var
typeof ctx (Var v) _ = getTypeFromContext ctx (Var v)  
-- T-Field

typeof ctx (AttrAccess t f) ct = 
    let tc = typeof ctx t ct
        fl = fieldLookup (getNameFromType(tc)) (getGenFromType(tc)) ct ct
      in getAttrAccessType fl f
-- T-Invk
typeof ctx (MethodAccess t m pm) ct = 
    let tc = typeof ctx t ct
        mt = methodTypeLookup m (getNameFromType(tc)) (getGenFromType(tc)) ct
        pcs = getParamsTypeFromContext ctx pm ct
      in getMethodAccessType pcs mt ct
-- T-New
typeof ctx (CreateObject c g pc) ct = 
    let pm' = getParamsTypeFromContext ctx pc ct
        fl = fieldLookup c g ct ct
      in getConstructorType c g pm' fl ct
-- T-If
typeof ctx (If c t1 t2) ct = typeof ctx t1 ct 
-- T-Let
typeof ctx (Let v t1 t2) ct = let t1' = typeof ctx t1 ct
                                  ctx' = addToContext ctx (Var v) t1'
                                in typeof ctx' t2 ct
-- GT-Closure
typeof ctx (ClosureDef pc t) ct = let rt = typeof ctx' t ct
                                    in TypeClosure rt (getParamsType(pc))
                                  where
                                    ctx' = addKeyPairToContext ctx pc 
-- GT-Closure-Inv
typeof ctx (InvokeClosure t pc) ct = let tt = typeof ctx t ct
                                       in getClosureReturnType tt
-- T-Tuple
typeof ctx (Tuple tl) ct = let tl' = getParamsTypeFromContext ctx tl ct
                             in TypeTuple (reverse tl')
-- T-Proj
typeof ctx (TupleAccess t idx) ct = let tp = typeof ctx t ct
                                      in getTupleItemType tp 1 idx
typeof ctx (ComplexTimes _ _) ct = TypeComplex
typeof ctx (ComplexPlus _ _) ct = TypeComplex
typeof ctx (ComplexMinus _ _) ct = TypeComplex
typeof ctx (RelEquals _ _) ct = TypeBool
-- @TODO: ver se eh isso mesmo
typeof ctx (MonadZero) ct = TypeQuantum TypeBool
typeof ctx (MonadReturn t) ct = let bt = typeof ctx t ct
                                  in TypeQuantum bt
typeof ctx (MonadBind t1 t2) ct = let tp = typeof ctx t2 ct
                                    in getClosureReturnType tp
typeof ctx (MonadPlus t1 t2) ct = typeof ctx t1 ct
--typeof ctx (MonadMinus t1 t2) ct = typeof ctx t1 ct
typeof ctx (ScalarProduct t1 t2) ct = typeof ctx t2 ct
-- Retornar o tipo de um atributo interno da classe
typeof ctx t _ = getTypeFromContext ctx t
-- T-UCast -- Not Yet
-- T-DCast -- Not Yet
-- T-SCast -- Not Yet

-- Função: getClosureReturnType
-- Objetivo: Retornar o tipo de retorno de uma closure a partir de um termo.
-- Parametros: Tipo de uma closure.
-- Autor: Samuel
-- Data: 19/11/2014
-------------------------------------------------------------------------------
getClosureReturnType :: Type -> Type
getClosureReturnType (TypeClosure r tp) = r
getClosureReturnType _ = error "Tipo informado nao e uma closure."

-- Função: getTupleItemType
-- Objetivo: Retornar o tipo de um item de uma tupla.
-- Parametros: Tipo da tupla, indice.
-- Autor: Samuel
-- Data: 22/12/2014
-------------------------------------------------------------------------------
getTupleItemType :: Type -> Int -> Int -> Type
getTupleItemType (TypeTuple (h:t)) from to = 
          if (from == to) then
              h
          else
              getTupleItemType (TypeTuple t) (from + 1) to

-- Função: getTypeFromContext 
-- Objetivo: Verificar se existe o termo no contexto e retornar seu tipo.
-- Paramêtros: Contexto, Termo.
-- Autor: Samuel
-- Data: 05/06/2014
-------------------------------------------------------------------------------
getTypeFromContext :: TypeContext -> Term -> Type
getTypeFromContext [] tm = error ("Termo [" ++ (show tm) ++ "] nao encontrado no contexto.")
getTypeFromContext (h:t) tm = if (fst(h) == tm) then
                                snd(h)
                              else 
                                getTypeFromContext t tm


-- Função: getAttrType
-- Objetivo: Retornar o tipo de um atributo de uma classe, caso ele exista.
-- Parametros: Lista de atributos, atributo.
-- Autor: Samuel
-- Data: 05/06/2014 - 14/11/2014
-------------------------------------------------------------------------------
getAttrAccessType :: [(Type,String)] -> String -> Type
getAttrAccessType [] a = error "Atributo nao encontrado na classe."
getAttrAccessType (h:t) a = if (a == snd(h)) then
                         fst(h)
                       else
                         getAttrAccessType t a

-- Função: getMethodAccessType
-- Objetivo: Verificar o tipo de um método, checando os parâmetros passados para
-- o mesmo.
-- Parâmetros: Lista de tipos dos parametros, tipo retornado para o metodo (tipo dos parametros e tipo de retorno), tabela de classes
-- Autor: Samuel
-- Data: 09/06/2014
-------------------------------------------------------------------------------
getMethodAccessType :: [Type] -> ([Type],Type) -> FJClassTable -> Type
getMethodAccessType p (ep,ret) ct = if (checkMethodActParams p ep ct) then
                                     ret
                                   else
                              error "Tipos de parametros invalidos no metodo."

-- Função: getConstructorType
-- Objetivo: Verificar o tipo de um construtor, checando os parâmetros passados
-- para o mesmo.
-- Autor: Samuel
-- Data: 09/06/2014
-------------------------------------------------------------------------------
getConstructorType :: String -> [Type] -> [Type] -> [(Type,String)] 
                                                      -> FJClassTable -> Type
getConstructorType t g ap fp ct = if (checkConstrActParams ap fp ct) then
                                  TypeClass t g
                                else
                          error "Tipos de parametros invalidos no construtor."

-- Função: getParamsTypeFromContext
-- Objetivo: Obter uma lista de tipos a partir do contexto e dos parâmetros
-- recebidos por um método ou um construtor.
-- Parâmetros: Contexto, lista de parametros, tabela de classes.
-- Autor: Samuel
-- Data: 09/06/2014
-------------------------------------------------------------------------------
getParamsTypeFromContext :: TypeContext -> [Term] -> FJClassTable -> [Type]
getParamsTypeFromContext ctx [] _ = []
getParamsTypeFromContext ctx (h:t) ct = (typeof ctx h ct) : 
                                      getParamsTypeFromContext ctx t ct

-- Função: checkMethodActParams
-- Objetivo: Verificar se o tipo dos parâmetros passados são de um tipo aceito
-- pelo método invocado.
-- Autor: Samuel
-- Data: 09/06/2014
-------------------------------------------------------------------------------
checkMethodActParams :: [Type] -> [Type] -> FJClassTable -> Bool
checkMethodActParams [] [] _ = True
checkMethodActParams [] _ _ = False
checkMethodActParams _ [] _ = False
checkMethodActParams (h1:t1) (h2:t2) ct = if (isSubtype (getNameFromType(h1))
                                                        (getNameFromType(h2))
                                                        ct ct) then
                                         checkMethodActParams t1 t2 ct
                                       else
                                         False

-- Função: checkConstrActParams
-- Objetivo: Verificar se o tipo dos parâmetros passados são de um tipo aceito
-- pelo construtor da classe.
-- Autor: Samuel
-- Data: 09/06/2014
-------------------------------------------------------------------------------
checkConstrActParams :: [Type] -> [(Type,String)] -> FJClassTable -> Bool
checkConstrActParams [] [] _ = True
checkConstrActParams [] _ _ = False
checkConstrActParams _ [] _ = False
checkConstrActParams (h1:t1) (h2:t2) ct = if (isSubtype (getNameFromType(h1)) 
                                                   (getNameFromType((fst(h2))))
                                                   ct ct) then
                                         checkConstrActParams t1 t2 ct
                                       else
                                         False

-- Função: classTableContains
-- Objetivo: Verificar se a tabela de classes contém a classe informada.
-- Autor: Samuel 
-- Data: 10/06/2014
-------------------------------------------------------------------------------
classTableContains :: Type -> FJClassTable -> Bool
classTableContains (TypeBool) _ = True
classTableContains (TypeComplex) _ = True
classTableContains (TypeQuantum _) _ = True
classTableContains (TypeClass "Object" _) _ = True
classTableContains _ [] = False
classTableContains c (h:t) = if (fst(h) == (getNameFromType(c))) then
                               True
                             else
                               classTableContains c t

