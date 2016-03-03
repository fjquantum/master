-- Módulo principal do interpretador para a linguagem FlyJ
-- Autor: Samuel da Silva Feitosa
-- Data: 31/05/2014
-------------------------------------------------------------------------------
module FJInterpreter where
import FJParser
import FJUtils
import FJTypeChecker
import Debug.Trace

-- Função: eval
-- Objetivo: Avaliar a expressão
-- Autor: Samuel
-- Data: 04/06/2014
-------------------------------------------------------------------------------
eval :: Program -> Term
--eval (Program ct t) = error (show ct ++ show t)
--eval (Program ct t) | trace ("###### eval ######\n" ++ show t ++ "\n##################") False = undefined 
eval (Program ct t) = if (t == (evalTerm t ct)) then
                        t
                      else
                        eval (Program ct (evalTerm t ct))

-- Função: evalTerm
-- Objetivo: Avaliar um termo e apresentar seu resultado de acordo com as 
-- definições na tabela de classes.
-- Autor: Samuel
-- Data: 03/06/2014
-------------------------------------------------------------------------------
evalTerm :: Term -> FJClassTable -> Term
--evalTerm t ct | trace ("###### evalTerm ######\n" ++ show t ++ "\n######################") False = undefined 
evalTerm (ThisAccessAttr _) ct = 
    error "Uso de 'this' fora da classe nao permitido!"
evalTerm (ThisAccessMeth _ _) ct = 
    error "Uso de 'this' fora da classe nao permitido!"
-- E-ProjNew e E-Field
evalTerm (AttrAccess t f) ct = evalAttrAccess t f ct
-- E-InvkNew, E-Invk-Recv e E-Invk-Arg
evalTerm (MethodAccess t m pm) ct = evalMethodAccess t m pm ct ct
-- E-New-Arg
evalTerm (CreateObject c g pc) ct = let pc' = evalTermList pc ct
                                    in CreateObject c g pc'
evalTerm (Cast c t) ct = evalCast c t ct ct
-- If
evalTerm (If c t1 t2) ct = evalIf c t1 t2 ct
-- Let
evalTerm (Let v t1 t2) ct = subsParams t2 [v] [t1]
-- GR-Invk-Clos
evalTerm (InvokeClosure t ap) ct = evalClosure t ap ct
-- E-Tuple
evalTerm (Tuple tl) ct = let tl' = evalTermList tl ct
                           in Tuple tl'
-- E-ProjTuple
evalTerm (TupleAccess (Tuple tl) idx) ct = 
          if (isValue (Tuple tl)) then
              evalTupleAccess (reverse tl) 1 idx ct
          else 
              let tl' = evalTermList tl ct
                in TupleAccess (Tuple tl') idx
-- E-Proj
evalTerm (TupleAccess t idx) ct = let t' = evalTerm t ct
                                    in TupleAccess t' idx
evalTerm (ComplexTimes t1 t2) ct = evalComplexTimes t1 t2 ct
evalTerm (ComplexPlus t1 t2) ct = evalComplexPlus t1 t2 ct
evalTerm (ComplexMinus t1 t2) ct = evalComplexMinus t1 t2 ct
evalTerm (RelEquals t1 t2) ct = evalRelEquals t1 t2 ct
evalTerm (MonadReturn t) ct = evalMonadReturn t ct
evalTerm (MonadBind t1 t2) ct = evalMonadBind t1 t2 ct
evalTerm (MonadPlus t1 t2) ct = evalMonadPlus t1 t2 ct
--evalTerm (MonadMinus t1 t2) ct = evalMonadMinus t1 t2 ct
evalTerm (ScalarProduct t1 t2) ct = evalScalarProduct t1 t2 ct
--evalTerm (TensorProduct t1 t2) ct = evalTensorProduct t1 t2 ct
evalTerm t _ = t

-- Função: evalTensorProduct
-- Objetivo: Avaliar o operador de produto tensorial.
-- Autor: Samuel
-- Data: 02/04/2015
-------------------------------------------------------------------------------
--evalTensorProduct :: Term -> Term -> FJClassTable -> Term
--evalTensorProduct t1 t2 ct = 
--        if (isValue t1 && isValue t2) then
--          ClosureDef [(TypeTuple [TypeBool,TypeBool], "_tensor")] 
		---- Arrumar tipos
--           (ComplexTimes (InvokeClosure t1 [(TupleAccess (Var "_tensor") 1)])
--                         (InvokeClosure t2 [(TupleAccess (Var "_tensor") 2)])
--           )
--        else
--          let t1' = evalTerm t1 ct
--              t2' = evalTerm t2 ct
--            in TensorProduct t1' t2'

-- Função: evalScalarProduct
-- Objetivo: Avaliar o operador de produto scalar.
-- Autor: Samuel
-- Data: 01/04/2015
-------------------------------------------------------------------------------
evalScalarProduct :: Term -> Term -> FJClassTable -> Term
--evalScalarProduct t1 t2 ct | trace ("===>> T1: " ++ show t1 ++ " T2: " ++ show t2) False = undefined
evalScalarProduct (ComplexLiteral (ComplexNumber 1.0)) t _ = t
evalScalarProduct (ComplexLiteral (ComplexNumber 0.0)) t _ = MonadZero
evalScalarProduct n1 (MonadPlus (ScalarProduct n2 t1) (ScalarProduct n3 t2)) ct = 
        let times1 = evalComplexTimes n1 n2 ct
            times2 = evalComplexTimes n1 n3 ct
          in MonadPlus (ScalarProduct times1 t1) (ScalarProduct times2 t2)
--evalScalarProduct n1 (MonadMinus (ScalarProduct n2 t1) (ScalarProduct n3 t2)) ct = 
--        let times1 = evalComplexTimes n1 n2 ct
--            times2 = evalComplexTimes n1 n3 ct
--          in MonadMinus (ScalarProduct times1 t1) (ScalarProduct times1 t2)
evalScalarProduct t1 t2 ct = let t1' = evalTerm t1 ct
                                 t2' = evalTerm t2 ct
                              in ScalarProduct t1' t2'


-- Função: termToList
-- Objetivo:
-- Autor: Samuel
-- Data: 19/06/2015
-------------------------------------------------------------------------------
termToList :: [Term] -> Term -> FJClassTable -> [Term]
termToList l (ScalarProduct (ComplexLiteral (ComplexNumber 0)) t) ct = l
termToList l (ScalarProduct (ComplexLiteral cn) 
                                            (MonadReturn i)) _ =
    l ++ [(ScalarProduct (ComplexLiteral cn) (MonadReturn i))]
termToList l (ScalarProduct cl1 (ScalarProduct cl2 t)) ct = 
    let cl = evalComplexTimes cl1 cl2 ct
      in l ++ [(ScalarProduct cl t)]
termToList l (MonadPlus t1 t2) ct = 
    let l' = termToList l t1 ct
      in termToList l' t2 ct
termToList l (MonadReturn b) ct = 
    let t = ScalarProduct (ComplexLiteral (ComplexNumber 1)) (MonadReturn b)
      in termToList l t ct
-- termToList l t ct | trace ("termToList: " ++ show t) False = undefined
termToList l t ct = let t' = evalTerm t ct
                      in termToList l t' ct
                  
-- termToList l t ct = error ((show l) ++ " | " ++ (show t))
    
-- Função: foldExpr
-- Objetivo:
-- Autor: Samuel
-- Data: 19/06/2015
-------------------------------------------------------------------------------
foldExpr :: Term -> Term -> Term
foldExpr (ScalarProduct cl1 t1) 
         (ScalarProduct cl2 t2) = 
    if (t1 == t2) then
        let res = evalComplexPlus cl1 cl2 []
          in (ScalarProduct res t1)
    else
        (ScalarProduct cl2 t2)

-- Função: filterDiff
-- Objetivo:
-- Autor: Samuel
-- Data: 19/06/2015
-------------------------------------------------------------------------------
filterDiff :: Term -> Term -> Bool
filterDiff (ScalarProduct n1 t1) (ScalarProduct n2 t2) = t1 /= t2

-- Função: simplifyList 
-- Objetivo:
-- Autor: Samuel
-- Data: 19/06/2015
-------------------------------------------------------------------------------
simplifyList :: [Term] -> [Term]
--simplifyList l | trace ("###### simplifyList ######\n" ++ show l ++ "\n##################") False = undefined
simplifyList [] = []
simplifyList (h:t) = let sum = foldr foldExpr h t
                       in [sum] ++ (simplifyList [e | e <- t, filterDiff e h])

-- Função: listToTerm
-- Objetivo:
-- Autor: Samuel
-- Data: 19/06/2015
-------------------------------------------------------------------------------
listToTerm :: [Term] -> Term
listToTerm [] = MonadZero
listToTerm (h:[]) = h
listToTerm (h:t) = MonadPlus h (listToTerm t)

-- Função: evalMonadPlus
-- Objetivo: Avaliar o operador monádico "mplus".
-- Autor: Samuel
-- Data: 01/04/2015
-------------------------------------------------------------------------------
evalMonadPlus :: Term -> Term -> FJClassTable -> Term
evalMonadPlus MonadZero t _ = t
evalMonadPlus t MonadZero _ = t
evalMonadPlus (ScalarProduct (ComplexLiteral (ComplexNumber 0)) _) t _ = t
evalMonadPlus t (ScalarProduct (ComplexLiteral (ComplexNumber 0)) _) _ = t
evalMonadPlus t1 t2 ct = let tl = (termToList [] t1 ct) ++ 
                                  (termToList [] t2 ct)
                             sl = simplifyList tl
                           in listToTerm sl

-- Função: evalMonadMinus
-- Objetivo: Avaliar o operador monádico "mminus".
-- Autor: Samuel
-- Data: 01/04/2015
-------------------------------------------------------------------------------
{-
evalMonadMinus :: Term -> Term -> FJClassTable -> Term
evalMonadMinus MonadZero t ct = 
    ScalarProduct (ComplexLiteral (ComplexNumber (-1))) t
evalMonadMinus t MonadZero ct = t
evalMonadMinus t1 t2 ct = 
    let tl = (termToList [] t1 ct) ++ 
             (termToList [] (ScalarProduct 
                            (ComplexLiteral (ComplexNumber (-1))) t2) ct)
        sl = simplifyList tl
       in listToTerm sl
-}

-- Função: evalMonadReturn
-- Objetivo: Avaliar o operador monádico "return".
-- Autor: Samuel
-- Data: 16/04/2015
-------------------------------------------------------------------------------
evalMonadReturn :: Term -> FJClassTable -> Term
evalMonadReturn t ct = let t' = evalTerm t ct
                         in MonadReturn t'

-- Função: evalMonadBind
-- Objetivo: Avaliar o operador monádico "bind".
-- Autor: Samuel
-- Data: 15/03/2015
-------------------------------------------------------------------------------
evalMonadBind :: Term -> Term -> FJClassTable -> Term
evalMonadBind (MonadReturn (BooleanLiteral b)) t2 ct = 
        InvokeClosure t2 [(BooleanLiteral b)]
evalMonadBind (MonadReturn (Tuple tl)) t2 ct =
        InvokeClosure t2 [(Tuple tl)]
evalMonadBind (MonadPlus t1 t2) t3 ct = let t1' = evalMonadBind t1 t3 ct
                                            t2' = evalMonadBind t2 t3 ct
                                          in MonadPlus t1' t2'
--evalMonadBind (MonadMinus t1 t2) t3 ct = let t1' = evalMonadBind t1 t3 ct
--                                             t2' = evalMonadBind t2 t3 ct
--                                           in MonadMinus t1' t2'
evalMonadBind (ScalarProduct (ComplexLiteral n) t1) t2 ct =
        let t' = evalMonadBind t1 t2 ct 
          in ScalarProduct (ComplexLiteral n) t'
-- evalMonadBind t1 t2 ct = error (show t2)
evalMonadBind t1 t2 ct = let t1' = evalTerm t1 ct
                             t2' = evalTerm t2 ct
                           in MonadBind t1' t2'

-- Função: evalComplexTimes
-- Objetivo: Avaliar a multiplicação de dois números complexos.
-- Autor: Samuel
-- Data: 04/03/2015
-------------------------------------------------------------------------------
evalComplexTimes :: Term -> Term -> FJClassTable -> Term
--evalComplexTimes t1 t2 ct | trace ("-------> T1: " ++ show t1 ++ " T2: " ++ show t2) False = undefined 
evalComplexTimes (ComplexLiteral (ComplexHalf))
                 (ComplexLiteral (ComplexHalf)) ct = 
    (ComplexLiteral (ComplexNumber 0.5))
evalComplexTimes (ComplexLiteral (ComplexMHalf))
                 (ComplexLiteral (ComplexMHalf)) ct = 
    (ComplexLiteral (ComplexNumber 0.5))
evalComplexTimes (ComplexLiteral (ComplexHalf))
                 (ComplexLiteral (ComplexMHalf)) ct = 
    (ComplexLiteral (ComplexNumber (-0.5)))
evalComplexTimes (ComplexLiteral (ComplexMHalf))
                 (ComplexLiteral (ComplexHalf)) ct = 
    (ComplexLiteral (ComplexNumber (-0.5)))
evalComplexTimes (ComplexLiteral (ComplexNumber n1)) 
                 (ComplexLiteral (ComplexNumber n2)) ct = 
    let times = n1 * n2
      in ComplexLiteral(ComplexNumber times)
-- Tentativa para trabalhar com vários qubits
evalComplexTimes (ComplexLiteral (ComplexNumber n1))
                 (ComplexLiteral (ComplexHalf)) ct =
    ComplexLiteral (ComplexTimesHalf n1)
evalComplexTimes (ComplexLiteral (ComplexNumber n1))
                 (ComplexLiteral (ComplexMHalf)) ct =
    ComplexLiteral (ComplexTimesHalf (-1 * n1))
evalComplexTimes (ComplexLiteral (ComplexTimesHalf n1)) 
                 (ComplexLiteral (ComplexTimesHalf n2)) ct = 
    ComplexLiteral (ComplexNumber (0.5 * n1 * n2))
evalComplexTimes (ComplexLiteral (ComplexTimesHalf n1)) cl ct = 
    let e1 = evalComplexTimes (ComplexLiteral (ComplexNumber n1)) cl ct
      in evalComplexTimes (ComplexLiteral (ComplexTimesHalf 1.0)) e1 ct 
evalComplexTimes cl (ComplexLiteral (ComplexTimesHalf n1)) ct = 
    let e1 = evalComplexTimes (ComplexLiteral (ComplexNumber n1)) cl ct
      in evalComplexTimes (ComplexLiteral (ComplexTimesHalf 1.0)) e1 ct 
{-
evalComplexTimes (ComplexLiteral (ComplexHalf))
                 (ComplexLiteral (ComplexNumber n1)) ct = 
    ComplexLiteral (ComplexTimesHalf n1)
evalComplexTimes (ComplexLiteral (ComplexTimesHalf n)) 
                 (ComplexLiteral (ComplexHalf)) ct = 
    ComplexLiteral (ComplexNumber (0.5 * n))
evalComplexTimes (ComplexLiteral (ComplexHalf))
                 (ComplexLiteral (ComplexTimesHalf n)) ct = 
    ComplexLiteral (ComplexNumber (0.5 * n))
evalComplexTimes (ComplexLiteral (ComplexTimesHalf n1))
                 (ComplexLiteral (ComplexNumber n2)) ct = 
    ComplexLiteral (ComplexTimesHalf (n1 * n2))
evalComplexTimes (ComplexLiteral (ComplexNumber n1))
                 (ComplexLiteral (ComplexTimesHalf n2)) ct = 
    ComplexLiteral (ComplexTimesHalf (n1 * n2))
-}
evalComplexTimes t1 t2 ct = error ("T1: " ++ (show t1) ++ " T2: " ++ (show t2) ++ " CT: " ++ (show ct))

-- Função: evalComplexPlus
-- Objetivo: Avaliar a soma de dois números complexos.
-- Autor: Samuel
-- Data: 04/03/2015
-------------------------------------------------------------------------------
evalComplexPlus :: Term -> Term -> FJClassTable -> Term
evalComplexPlus (ComplexLiteral (ComplexNumber 0)) t _ = t
evalComplexPlus t (ComplexLiteral (ComplexNumber 0)) _ = t
evalComplexPlus (ComplexLiteral (ComplexNumber n1)) 
                (ComplexLiteral (ComplexNumber n2)) ct = 
    let plus = n1 + n2
      in ComplexLiteral(ComplexNumber plus)
evalComplexPlus (ComplexLiteral (ComplexTimesHalf n1))
                (ComplexLiteral (ComplexTimesHalf n2)) ct = 
    (ComplexLiteral (ComplexTimesHalf (n1 + n2)))
evalComplexPlus t1 t2 _ | 
    trace ("###### evalComplexPlus ######\nT1:\n" ++ show t1 ++ "\nT2:\n" ++ show t2 ++ "\n##################") False = undefined
evalComplexPlus t1 t2 _ = (ComplexLiteral (ComplexNumber 0))

-- Função: evalComplexMinus
-- Objetivo: Avaliar a substracao de dois números complexos.
-- Autor: Samuel
-- Data: 17/03/2015
-------------------------------------------------------------------------------
evalComplexMinus :: Term -> Term -> FJClassTable -> Term
evalComplexMinus (ComplexLiteral (ComplexNumber n1)) 
                 (ComplexLiteral (ComplexNumber n2)) ct = 
    let minus = n1 - n2
      in ComplexLiteral(ComplexNumber minus)

-- Função: evalRelEquals
-- Objetivo: Avaliar expressão booleana.
-- Autor: Samuel
-- Data: 04/03/2015
-------------------------------------------------------------------------------
evalRelEquals :: Term -> Term -> FJClassTable -> Term
evalRelEquals (BooleanLiteral b1) (BooleanLiteral b2) _ = 
        if (b1 == b2) then
          BooleanLiteral BLTrue
        else
          BooleanLiteral BLFalse
evalRelEquals (Tuple tl1) (Tuple tl2) _ = 
        if (tl1 == tl2) then
          BooleanLiteral BLTrue
        else
          BooleanLiteral BLFalse
evalRelEquals t1 t2 ct = let t1' = evalTerm t1 ct
                             t2' = evalTerm t2 ct
                           in RelEquals t1' t2' 
                                                        
-- Função: evalAttrAccess
-- Objetivo: Avaliar o termo recebido por parâmetro que representa um acesso a 
-- um atributo de dentro da classe. (E-ProjNew e E-Field)
-- Autor: Samuel
-- Data: 02/06/2014 
-------------------------------------------------------------------------------
evalAttrAccess :: Term -> String -> FJClassTable -> Term
evalAttrAccess (CreateObject obj g p) f ct = let attrs = fieldLookup obj g ct ct
                                             in getAttrValue f attrs p
evalAttrAccess t f ct = let t' = evalTerm t ct
                          in AttrAccess t' f

-- Função: evalMethodAccess
-- Objetivo: Avaliar o termo recebido por parâmetro que representa uma invocação
-- de método. (E-InvkNew, E-Invk-Recv e E-Invk-Arg)
-- Autor: Samuel
-- Data: 03/06/2014
-------------------------------------------------------------------------------
evalMethodAccess :: Term -> String -> [Term] -> FJClassTable -> 
                                                          FJClassTable -> Term
evalMethodAccess _ _ _ [] _ = error "Classe nao encontrada na tabela de classes."
-- E-Invk-New
evalMethodAccess (CreateObject obj g pc) m pm (h:t) ct =
                  if (fst(h) == obj) then
                    let bodydef = methodBodyLookup m (snd(h))
                        body = replaceThis (snd(bodydef)) (CreateObject obj g pc)
                        params = fst(bodydef)
                        pm' = evalTermList pm ct -- E-Invk-Arg
                      in subsParams body params pm'
                  else 
                    evalMethodAccess (CreateObject obj g pc) m pm t ct
-- E-Invk-Recv
evalMethodAccess t m pm ct _ = let t' = evalTerm t ct 
                               in MethodAccess t' m pm


-- Função: evalIf
-- Objetivo: Avaliar a estrutura de controle IF.
-- Parametros: Condicao, Termo verdadeiro, Termo falso, tabela de classes.
-- Autor: Samuel
-- Data: 23/12/2014
-------------------------------------------------------------------------------
evalIf :: Term -> Term -> Term -> FJClassTable -> Term
evalIf (BooleanLiteral BLTrue) t1 _ _ = t1
evalIf (BooleanLiteral BLFalse) _ t2 _ = t2
evalIf c t1 t2 ct = let c' = evalTerm c ct
                      in If c' t1 t2

-- Função: evalClosure
-- Objetivo: Avaliar o termo recebido por parâmetro que representa um closure
-- (GR-Invk-Clos, GRC-Inv-Clos, GRC-Clos-Arg)
-- Autor: Samuel
-- Data: 04/11/2014
-------------------------------------------------------------------------------
evalClosure :: Term -> [Term] -> FJClassTable -> Term
-- GR-Invk-Clos e GRC-Clos-Arg
evalClosure (ClosureDef pf t) tl ct = let params = getParamsName pf
                                          tl' = evalTermList tl ct
                                        in subsParams t params tl'
-- GRC-Inv-Clos
evalClosure t pc ct = let t' = evalTerm t ct
                        in InvokeClosure t' pc

-- Função: evalTupleAccess
-- Objetivo: Retornar o elemento de acesso da tupla.
-- Autor: Samuel
-- Data: 22/12/2014
-------------------------------------------------------------------------------
evalTupleAccess :: [Term] -> Int -> Int -> FJClassTable -> Term
evalTupleAccess (h:t) from to ct = if (from == to) then
                                     h
                                   else
                                     evalTupleAccess t (from + 1) to ct

-- Função: replaceThis
-- Objetivo: Substituir as ocorrências de "this" no termo pela classe na qual
-- ele é invocado. 
-- Autor: Samuel
-- Data: 04/06/2014
-------------------------------------------------------------------------------
replaceThis :: Term -> Term -> Term
replaceThis (ThisAccessAttr f) obj = AttrAccess obj f
replaceThis (ThisAccessMeth m p) obj = MethodAccess obj m p
replaceThis (AttrAccess t f) obj = let t' = replaceThis t obj
                                     in AttrAccess t' f
replaceThis (MethodAccess t m pm) obj = let t' = replaceThis t obj
                                            pm' = replaceThisList pm obj
                                          in MethodAccess t' m pm'
replaceThis (CreateObject c g pc) obj = let pc' = replaceThisList pc obj
                                        in CreateObject c g pc'
replaceThis (If c t f) obj = let c' = replaceThis c obj
                                 t' = replaceThis t obj
                                 f' = replaceThis f obj
                                in If c' t' f'
replaceThis (Let v t1 t2) obj = let t1' = replaceThis t1 obj
                                    t2' = replaceThis t2 obj
                                  in Let v t1' t2'
replaceThis (ClosureDef pf t) obj = let t' = replaceThis t obj
                                      in ClosureDef pf t'
replaceThis (InvokeClosure cd pm) obj = let cd' = replaceThis cd obj
                                            pm' = replaceThisList pm obj
                                          in InvokeClosure cd' pm'
replaceThis (Tuple tl) obj = let tl' = replaceThisList tl obj
                               in Tuple tl'
replaceThis (TupleAccess tl idx) obj = let tl' = replaceThis tl obj
                                     in TupleAccess tl' idx
replaceThis (ComplexTimes t1 t2) obj = let t1' = replaceThis t1 obj
                                           t2' = replaceThis t2 obj
                                          in ComplexTimes t1' t2'
replaceThis (ComplexPlus t1 t2) obj = let t1' = replaceThis t1 obj
                                          t2' = replaceThis t2 obj
                                         in ComplexPlus t1' t2'
replaceThis (ComplexMinus t1 t2) obj = let t1' = replaceThis t1 obj
                                           t2' = replaceThis t2 obj
                                         in ComplexMinus t1' t2'
replaceThis (RelEquals t1 t2) obj = let t1' = replaceThis t1 obj
                                        t2' = replaceThis t2 obj
                                       in RelEquals t1' t2'
replaceThis (MonadReturn t) obj = let t' = replaceThis t obj
                                    in MonadReturn t'
replaceThis (MonadBind t1 t2) obj = let t1' = replaceThis t1 obj
                                        t2' = replaceThis t2 obj
                                      in MonadBind t1' t2'
replaceThis (MonadPlus t1 t2) obj = let t1' = replaceThis t1 obj
                                        t2' = replaceThis t2 obj
                                      in MonadPlus t1' t2'
--replaceThis (MonadMinus t1 t2) obj = let t1' = replaceThis t1 obj
--                                         t2' = replaceThis t2 obj
--                                       in MonadMinus t1' t2'
replaceThis (ScalarProduct t1 t2) obj = let t1' = replaceThis t1 obj
                                            t2' = replaceThis t2 obj
                                          in ScalarProduct t1' t2'
replaceThis (TensorProduct t1 t2) obj = let t1' = replaceThis t1 obj
                                            t2' = replaceThis t2 obj
                                          in TensorProduct t1' t2'
replaceThis t _ = t

-- Função: replaceThisList
-- Objetivo: Substituir as ocorrências de "this" numa lista de termos pela 
-- classe na qual ele é invocado.
-- Autor: Samuel
-- Data: 04/06/2014
-------------------------------------------------------------------------------
replaceThisList :: [Term] -> Term -> [Term]
replaceThisList [] _ = []
replaceThisList (h:t) obj =  replaceThis h obj : replaceThisList t obj

-- Função: subsParams
-- Objetivo: Substituir os parâmetros recebidos no corpo do método.
-- Autor: Samuel
-- Data: 03/06/2014
-------------------------------------------------------------------------------
subsParams :: Term -> [String] -> [Term] -> Term 
subsParams t [] _ = t
subsParams (Var v) (h1:t1) (h2:t2) = if (h1 == v) then
                                       h2
                                     else
                                       subsParams (Var v) t1 t2 
subsParams (AttrAccess t f) fp ap = let t' = subsParams t fp ap
                                      in AttrAccess t' f
subsParams (MethodAccess t m pm) fp ap = let t' = subsParams t fp ap
                                             pm' = subsParamsList pm fp ap
                                           in MethodAccess t' m pm'
subsParams (CreateObject c g pm) fp ap = let pm' = subsParamsList pm fp ap
                                         in CreateObject c g pm'
subsParams (Cast c t) fp ap = let t' = subsParams t fp ap
                                in Cast c t'
subsParams (If c t f) fp ap = let c' = subsParams c fp ap
                                  t' = subsParams t fp ap
                                  f' = subsParams f fp ap
                                in If c' t' f'
subsParams (Let v t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                     t2' = subsParams t2 fp ap
                                   in Let v t1' t2'
subsParams (ClosureDef cp t) fp ap = let t' = subsParams t fp ap
                                       in ClosureDef cp t'
subsParams (InvokeClosure cd pc) fp ap = let cd' = subsParams cd fp ap
                                             pc' = subsParamsList pc fp ap
                                           in InvokeClosure cd' pc'
subsParams (Tuple tl) fp ap = let tl' = subsParamsList tl fp ap
                                in Tuple tl'
subsParams (TupleAccess t n) fp ap = let t' = subsParams t fp ap
                                       in TupleAccess t' n
subsParams (ComplexTimes t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                            t2' = subsParams t2 fp ap
                                           in ComplexTimes t1' t2'
subsParams (ComplexPlus t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                           t2' = subsParams t2 fp ap
                                          in ComplexPlus t1' t2'
subsParams (ComplexMinus t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                            t2' = subsParams t2 fp ap
                                          in ComplexMinus t1' t2'
subsParams (RelEquals t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                         t2' = subsParams t2 fp ap
                                        in RelEquals t1' t2'
subsParams (MonadReturn t) fp ap = let t' = subsParams t fp ap
                                     in MonadReturn t'
subsParams (MonadBind t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                         t2' = subsParams t2 fp ap
                                       in MonadBind t1' t2'
subsParams (MonadPlus t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                         t2' = subsParams t2 fp ap
                                       in MonadPlus t1' t2'
--subsParams (MonadMinus t1 t2) fp ap = let t1' = subsParams t1 fp ap
--                                          t2' = subsParams t2 fp ap
--                                        in MonadMinus t1' t2'
subsParams (ScalarProduct t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                             t2' = subsParams t2 fp ap
                                           in ScalarProduct t1' t2'
subsParams (TensorProduct t1 t2) fp ap = let t1' = subsParams t1 fp ap
                                             t2' = subsParams t2 fp ap
                                           in TensorProduct t1' t2'

--subsParams t (h:c) ap = error ("Erro com o termo: " ++ (show t) ++ h)
-- return the term without substitution (boolean)
subsParams t _ _ = t

-- Função: subsParamsList
-- Objetivo: Substituir os parâmetros recebidos numa lista de termos.
-- Autor: Samuel
-- Data: 03/06/2014
-------------------------------------------------------------------------------
subsParamsList :: [Term] -> [String] -> [Term] -> [Term]
subsParamsList [] _ _ = []
subsParamsList (h:t) fp ap = (subsParams h fp ap) : (subsParamsList t fp ap)

-- Função: evalTermList
-- Objetivo: Avaliar uma lista de termos de acordo com os dados constantes na
-- tabela de classes. É necessário fazer esta avaliação nas chamadas de métodos
-- e nos construtores. (E-Invk-Arg)
-- Autor: Samuel
-- Data: 03/06/2014
-------------------------------------------------------------------------------
evalTermList :: [Term] -> FJClassTable -> [Term]
evalTermList [] _ = []
evalTermList (h:t) ct = let h' = evalTerm h ct
                          in h' : evalTermList t ct

-- Função: evalCast
-- Objetivo: Avaliar o termo recebido que representa um "cast". (E-CastNew e 
-- E-Cast)
-- Autor: Samuel
-- Data: 03/06/2014
-------------------------------------------------------------------------------
evalCast :: String -> Term -> FJClassTable -> FJClassTable -> Term
-- E-CastNew
evalCast c (CreateObject obj g p) (h:t) ct = 
                                  if (fst(h) == obj) then
                                    if (isSubtype obj c ct ct) then
                                      CreateObject obj g p
                                    else 
                                      error "Erro de cast"
                                  else
                                    evalCast c (CreateObject obj g p) t ct
-- E-Cast
evalCast c t ct _ = let t' = evalTerm t ct
                               in Cast c t'

-- Função: main
-- Objetivo: Ler os códigos e chamar as funções do lexer/parser e eval
-------------------------------------------------------------------------------
main = getContents >>= print . eval . typecheck . parser . lexer 
--main = getContents >>= print . eval . parser . lexer 

