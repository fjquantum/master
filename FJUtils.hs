-- Definições e funções utilitárias para o interpretador da linguagem FlyJ
-- Autor: Samuel da Silva Feitosa
-- Data: 05/06/2014
-------------------------------------------------------------------------------
module FJUtils where
import FJParser

-- Definições de tipos utilizados no interpretador da linguagem FlyJ
-- Objetivo: Facilitar a manipulação das estruturas de dados geradas no parser.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
type FJClassTable = [(String,ClassDef)]
type FJKeyPair = [(String,String)]
type NameContext = [(String,Int)]

-- Função: isValue
-- Objetivo:
-- Parâmetros: 
-- Autor: Samuel
-- Data: 22/12/2014
-------------------------------------------------------------------------------
isValue :: Term -> Bool
isValue (BooleanLiteral _) = True
isValue (ComplexLiteral _) = True
isValue (Var _) = True
isValue (CreateObject c _ pc) = True
isValue (ClosureDef _ _) = True
isValue (Tuple []) = True
isValue (Tuple (h:t)) = if (isValue h) then
                           isValue (Tuple t)
                       else 
                           False
isValue _ = False

-- Função: isSubtype
-- Objetivo: Verificar se uma classe dada é sub-tipo de outra, de acordo com 
-- as definições da tabela de classes.
-- Parametros: Classe derivada, Classe base, Tabela de Classes, Tabela de 
-- Classes.
-- Autor: Samuel
-- Data: 03/06/2014
-----------------------------------------------------------------------------
isSubtype :: String -> String -> FJClassTable -> FJClassTable -> Bool
isSubtype "boolean" "boolean" _ _ = True
isSubtype "Complex" "Complex" _ _ = True
isSubtype "Object" "Object" _ _ = True
isSubtype _ "Object" _ _ = True
isSubtype "Object" _ _ _ = False
isSubtype d b (h:t) ct | d == b = True
                       | otherwise =
                           if (fst(h) == d) then
                             if (b == getBaseClass(snd(h))) then
                               True
                             else
                               isSubtype (getBaseClass(snd(h))) b ct ct
                           else
                             isSubtype d b t ct
isSubtype _ _ _ _ = False
--isSubtype c1 c2 _ _ = error (c1 ++ " " ++ c2)


-- Função: fieldLookup
-- Objetivo: Localizar numa lista de classes, a classe recebida  e retornar os 
-- atributos da classe concatenando com os atributos da sua classe base, no 
-- caso de herança.
-- Parâmetros: Nome da classe, Tipos gerericos, Tabela de Classes, Tabela de 
-- Classes.
-- Autor: Samuel
-- Data: 31/05/2014
-------------------------------------------------------------------------------
fieldLookup :: String -> [Type] -> FJClassTable -> FJClassTable 
                                                             -> [(Type,String)]
fieldLookup _ _ _ [] = []
fieldLookup "Object" _ _ _ = []
fieldLookup c g (h:t) all = if (c == fst(h)) then
                             let base = getBaseClass(snd(h))
                               in (getFieldList (snd(h)) g) ++
                                  fieldLookup base g all all
                           else
                             fieldLookup c g t all

-- Função: methodTypeLookup
-- Objetivo: Pesquisar numa lista de classes, a partir da classe recebida, o 
-- método solicitado e retornar os parâmetros e tipo de retorno deste método
-- Parametros: metodo, classe, tipos genericos, tabela de classes.
-- Autor: Samuel
-- Data: 05/06/2014 - 14/11/2014
-------------------------------------------------------------------------------
methodTypeLookup :: String -> String -> [Type] -> FJClassTable -> ([Type],Type)
-- methodTypeLookup :: String -> String -> FJClassTable -> ([Type],Type)
methodTypeLookup m c g (h:t) = if (c == fst(h)) then
                               methodTypeClassLookup m g (snd(h))
                             else
                               methodTypeLookup m c g t

-- Função: methodTypeClassLookup
-- Objetivo: Pesquisar numa classe o método solicitado e retornar os parâmetros
-- e tipo de retorno deste método.
-- Parametro: Metodo, definicao da classe.
-- Autor: Samuel
-- Data: 02/06/2014
------------------------------------------------------------------------------- 
methodTypeClassLookup :: String -> [Type] -> ClassDef -> ([Type],Type)
-- methodTypeClassLookup :: String -> ClassDef -> ([Type],Type)
methodTypeClassLookup m g (ClassDef _ dg _ _ _ mlist) =
                                      handleMethodTypeList m mlist dg g

-- Função: methodBodyLookup
-- Objetivo: Buscar numa definição de classe todos nomes dos parâmetros e o
-- corpo de cada método.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
methodBodyLookup :: String -> ClassDef -> ([String],Term)
methodBodyLookup m (ClassDef _ _ _ _ _ mlist) =
                                       handleMethodBodyList m mlist

-- Função: getFieldList
-- Objetivo: Retornar a lista de atributos da classe passada por parâmetro.
-- Autor: Samuel
-- Data: 01/06/2014
-------------------------------------------------------------------------------
getFieldList :: ClassDef -> [Type] -> [(Type,String)]
getFieldList (ClassDef _ dg _ [] _ _) g = []
getFieldList (ClassDef n dg e (h:t) c m) g = (subsGenericType (fst(h)) dg g, snd(h)) : 
                                             getFieldList (ClassDef n dg e t c m) g

-- Função: subsGenericType
-- Objetivo: Substituir uma ocorrencia de tipos genericos na definicao dos
-- atributos da classe.
-- Autor: Samuel
-- Data: 03/03/2015
-------------------------------------------------------------------------------
subsGenericType :: Type -> [(String,String)] -> [Type] -> Type
subsGenericType (TypeClass c []) (h1:t1) (h2:t2) = 
        if (c == fst(h1)) then
          h2
        else
          subsGenericType (TypeClass c []) t1 t2
subsGenericType (TypeClass c lst) dg g = let lst' = subsGenericList lst dg g
                                           in TypeClass c lst'
subsGenericType r _ _ = r

-- Função: subsGenericList
-- Objetivo: Substituir todas as ocorrencias de tipos genericos na definicao 
-- atributos da classe.
-- Parametros: Lista de tipos, Tipos genericos, Tipos atuais.
-- Autor: Samuel
-- Data: 03/03/2015
-------------------------------------------------------------------------------
subsGenericList :: [Type] -> [(String,String)] -> [Type] -> [Type]
subsGenericList [] _ _ = []
subsGenericList (h:t) g a = (subsGenericType h g a) : subsGenericList t g a  

-- Função: getBaseClass
-- Objetivo: Retornar a classe BASE de uma declaração de classe
-- Autor: Samuel
-- Data: 01/06/2014
-------------------------------------------------------------------------------
getBaseClass :: ClassDef -> String
getBaseClass (ClassDef _ _ c _ _ _) = c

-- Função: handleMethodTypeList
-- Objetivo: Percorrer a lista de métodos e retornar o tipo de retorno e o tipo
-- dos parâmetros.
-- Parametros: Metodo, lista de metodos.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
handleMethodTypeList :: String -> [MethodDef] -> [(String,String)] -> [Type]
                               -> ([Type], Type)
--handleMethodTypeList :: String -> [MethodDef] -> [(String,String)] 
--                               -> ([Type], Type)
handleMethodTypeList _ [] _ _ = error "Metodo nao encontrado na classe (type)."
handleMethodTypeList m (h:t) dg g = if (m == getMethodName(h)) then
                                 getMethodType h dg g
                               else
                                  handleMethodTypeList m t dg g

-- Função: getMethodName
-- Objetivo: Retornar o nome do método a partir de um MethodDef.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
getMethodName :: MethodDef -> String
getMethodName (MethodDef _ name _ _) = name

-- Função: getMethodType
-- Objetivo: Retornar os tipos dos parâmetros e o tipo de retorno a partir de
-- um MethodDef
-- Parametros: Definicao de um metodo.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
getMethodType :: MethodDef -> [(String,String)] -> [Type] -> ([Type], Type)
getMethodType (MethodDef ret _ params _) dg g = 
        let params' = subsGenericList (getParamsType params) dg g
            ret' = subsGenericType ret dg g
          in (params', ret')

-- Função: getParamsType
-- Objetivo: Retornar uma lista de tipos dos parâmetros de uma função.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
getParamsType :: [(Type,String)] -> [Type]
getParamsType [] = []
getParamsType (h:t) = fst(h) : getParamsType t

-- Função: handleMethodBodyList
-- Objetivo: Percorrer a lista de métodos e retornar a sua lista de parâmetros
-- e o seu corpo.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
handleMethodBodyList :: String -> [MethodDef] -> ([String], Term)
handleMethodBodyList _ [] = error "Metodo nao encontrado na classe (body)."
handleMethodBodyList m (h:t) = if (m == getMethodName(h)) then
                                 getMethodBody h
                               else
                                 handleMethodBodyList m t

-- Função: getMethodBody
-- Objetivo: Obter a partir da definição de um método os nomes dos parâmetros 
-- recebidos e o seu corpo.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
getMethodBody :: MethodDef -> ([String],Term)
getMethodBody (MethodDef _ _ params term) = (getParamsName(params), term)

-- Função: getParamsName
-- Objetivo: Obter os nomes dos parâmetros de determinado método.
-- Autor: Samuel
-- Data: 02/06/2014
------------------------------------------------------------------------------
getParamsName :: [(Type,String)] -> [String]
getParamsName [] = []
getParamsName (h:t) = snd(h) : getParamsName t

-- Função: getAttrValue
-- Objetivo: Obter o valor do parâmetro de acordo com o nome do campo acessado
-- e sua posição na declaração dos atributos da classe.
-- Autor: Samuel
-- Data: 02/06/2014
-------------------------------------------------------------------------------
getAttrValue :: String -> [(Type,String)] -> [Term] -> Term
getAttrValue _ [] _ = error "Atributo nao encontrado na classe!"
getAttrValue f (h1:t1) (h2:t2) = if (snd(h1) == f) then
                                   h2
                                 else
                                   getAttrValue f t1 t2

-- Função: getAttrType
-- Objetivo: Obter o tipo de um atributo declarado dentro de um classe.
-- Autor: Samuel
-- Data: 10/06/2014
-------------------------------------------------------------------------------
getAttrType :: String -> [(Type,String)] -> Type
getAttrType a [] = error "Atributo nao encontrado."
getAttrType f (h:t) = if (f == snd(h)) then
                        fst(h)
                      else
                        getAttrType f t

-- Função: removeNames
-- Objetivo: Transformar um termo Lambda (Closure) em um termo sem nomes, 
-- utilizando a notacao NameLess de Bruijn.
-- Parametros: Termo, Contexto de Nomes
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
removeNames :: Term -> NameContext -> TermNL
removeNames (Var v) ctx = VarNL (findFirstValue v ctx)
removeNames (ClosureDef pc t) ctx = let ctx' = addListToNameContext ctx pc
                                        t' = removeNames t ctx'
                                      in ClosureDefNL (getParamsType(pc)) t'
removeNames (InvokeClosure t ap) ctx = let t' = removeNames t ctx
                                           ap' = removeNamesList ap ctx
                                         in InvokeClosureNL t' ap'

-- Função: restoreNames
--restoreNames :: TermNL -> NameContext -> Term
--restoreNames (VarNL n) ctx = Var (findFirstName n ctx)
--restoreNames (ClosureDefNL tp t) ctx = let nl = getNamesFromTermNL tp t ctx
--                                           t' = restoreNames t ctx
--                                         in ClosureDef nl t'
--restoreNames (InvokeClosureNL t ap) ctx = let t' = restoreNames t ctx
--                                              ap' = restoreNamesList cp ctx
--                                            in InvokeClosure t' ap'


-- Função: removeNamesList 
-- Objetivo: Transformar uma lista de termos em uma lista de termos NameLess.
-- Parametros: Lista de termos, contexto de nomes.
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
removeNamesList :: [Term] -> NameContext -> [TermNL]
removeNamesList [] _ = []
removeNamesList (h:t) ctx = (removeNames h ctx) : (removeNamesList t ctx)

-- Função: addListToNameContext
-- Objetivo: Adicionar uma lista de nomes ao contexto de nomes.
-- Parametros: Contexto de nomes, lista de nomes.
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
addListToNameContext :: NameContext -> [(Type,String)] -> NameContext
addListToNameContext [] [] = []
addListToNameContext ctx [] = ctx
addListToNameContext ctx (h:t) = let ctx' = addToNameContext ctx (snd(h))
                                  in (addListToNameContext ctx' t)

-- Função: addToNameContext
-- Objetivo: Adicionar um nome ao contexto de nomes.
-- Parametros: Contexto de nomes, nome da variavel.
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
addToNameContext :: NameContext -> String -> NameContext
addToNameContext ctx v = (v,0) : (shifting ctx) 

-- Função: shifting
-- Objetivo: Realizar o "shifting" (+1) dos numeros dos nomes no contexto de 
-- nomes.
-- Parametros: Contexto de nomes.
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
shifting :: NameContext -> NameContext
shifting [] = []
shifting (h:t) = (fst(h),(snd(h) + 1)) : shifting t

-- Função: findFirstValue
-- Objetivo: Buscar o primeiro valor referente ao nome dentro do contexto de 
-- nomes.
-- Parametros: Nome da variavel, contexto de nomes.
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
findFirstValue :: String -> NameContext -> Int
findFirstValue v [] = error "Nome nao encontrado no contexto de nomes."
findFirstValue v (h:t) = if (fst(h) == v) then
                            snd(h)
                        else
                            findFirstValue v t

-- Função: findFirstName
-- Objetivo: Buscar o primeiro nome referente ao valor dentro do contexto de
-- nomes.
-- Parametros: Indice da variavel, contexto de nomes.
-- Autor: Samuel
-- Data: 21/11/2014
-------------------------------------------------------------------------------
findFirstName :: Int -> NameContext -> String
findFirstName n [] = error "Indice nao encontrado no contexto de nomes."
findFirstName n (h:t) = if (snd(h) == n) then
                            fst(h)
                        else
                            findFirstName n t

