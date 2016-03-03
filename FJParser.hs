{-# OPTIONS_GHC -w #-}
-- Gerador de um parser para a definição básica do Featherweight JAVA
-- Autor: Samuel da Silva Feitosa
-- Data: 28/05/2014
-------------------------------------------------------------------------------

module FJParser where
import Data.Char
import Data.Complex

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25

action_0 (26) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 _ = happyFail

action_1 (26) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail

action_2 (26) = happyShift action_4
action_2 (29) = happyShift action_13
action_2 (30) = happyShift action_14
action_2 (33) = happyShift action_15
action_2 (35) = happyShift action_16
action_2 (39) = happyShift action_17
action_2 (40) = happyShift action_18
action_2 (42) = happyShift action_19
action_2 (43) = happyShift action_20
action_2 (44) = happyShift action_21
action_2 (45) = happyShift action_22
action_2 (46) = happyShift action_23
action_2 (47) = happyShift action_24
action_2 (50) = happyShift action_25
action_2 (52) = happyShift action_26
action_2 (68) = happyShift action_27
action_2 (6) = happyGoto action_9
action_2 (23) = happyGoto action_10
action_2 (24) = happyGoto action_11
action_2 (25) = happyGoto action_12
action_2 _ = happyFail

action_3 _ = happyReduce_2

action_4 (32) = happyShift action_7
action_4 (68) = happyShift action_8
action_4 (21) = happyGoto action_6
action_4 _ = happyFail

action_5 (70) = happyAccept
action_5 _ = happyFail

action_6 (58) = happyShift action_54
action_6 (18) = happyGoto action_53
action_6 _ = happyReduce_31

action_7 _ = happyReduce_37

action_8 _ = happyReduce_38

action_9 _ = happyReduce_3

action_10 (55) = happyShift action_46
action_10 (56) = happyShift action_47
action_10 (61) = happyShift action_48
action_10 (62) = happyShift action_49
action_10 (63) = happyShift action_50
action_10 (64) = happyShift action_51
action_10 (66) = happyShift action_52
action_10 _ = happyFail

action_11 _ = happyReduce_42

action_12 _ = happyReduce_43

action_13 (56) = happyShift action_45
action_13 _ = happyFail

action_14 (32) = happyShift action_7
action_14 (68) = happyShift action_8
action_14 (21) = happyGoto action_44
action_14 _ = happyFail

action_15 (52) = happyShift action_43
action_15 _ = happyFail

action_16 (68) = happyShift action_42
action_16 _ = happyFail

action_17 _ = happyReduce_67

action_18 _ = happyReduce_68

action_19 _ = happyReduce_69

action_20 _ = happyReduce_70

action_21 _ = happyReduce_71

action_22 _ = happyReduce_72

action_23 _ = happyReduce_61

action_24 (29) = happyShift action_13
action_24 (30) = happyShift action_14
action_24 (33) = happyShift action_15
action_24 (35) = happyShift action_16
action_24 (39) = happyShift action_17
action_24 (40) = happyShift action_18
action_24 (42) = happyShift action_19
action_24 (43) = happyShift action_20
action_24 (44) = happyShift action_21
action_24 (45) = happyShift action_22
action_24 (46) = happyShift action_23
action_24 (47) = happyShift action_24
action_24 (50) = happyShift action_25
action_24 (52) = happyShift action_26
action_24 (68) = happyShift action_27
action_24 (23) = happyGoto action_41
action_24 (24) = happyGoto action_11
action_24 (25) = happyGoto action_12
action_24 _ = happyFail

action_25 (29) = happyShift action_13
action_25 (30) = happyShift action_14
action_25 (33) = happyShift action_15
action_25 (35) = happyShift action_16
action_25 (39) = happyShift action_17
action_25 (40) = happyShift action_18
action_25 (42) = happyShift action_19
action_25 (43) = happyShift action_20
action_25 (44) = happyShift action_21
action_25 (45) = happyShift action_22
action_25 (46) = happyShift action_23
action_25 (47) = happyShift action_24
action_25 (50) = happyShift action_25
action_25 (52) = happyShift action_26
action_25 (68) = happyShift action_27
action_25 (22) = happyGoto action_39
action_25 (23) = happyGoto action_40
action_25 (24) = happyGoto action_11
action_25 (25) = happyGoto action_12
action_25 _ = happyReduce_39

action_26 (29) = happyShift action_13
action_26 (30) = happyShift action_14
action_26 (32) = happyShift action_7
action_26 (33) = happyShift action_15
action_26 (35) = happyShift action_16
action_26 (38) = happyShift action_33
action_26 (39) = happyShift action_17
action_26 (40) = happyShift action_18
action_26 (41) = happyShift action_34
action_26 (42) = happyShift action_19
action_26 (43) = happyShift action_20
action_26 (44) = happyShift action_21
action_26 (45) = happyShift action_22
action_26 (46) = happyShift action_23
action_26 (47) = happyShift action_24
action_26 (49) = happyShift action_35
action_26 (50) = happyShift action_36
action_26 (52) = happyShift action_37
action_26 (68) = happyShift action_38
action_26 (10) = happyGoto action_28
action_26 (15) = happyGoto action_29
action_26 (16) = happyGoto action_30
action_26 (21) = happyGoto action_31
action_26 (23) = happyGoto action_32
action_26 (24) = happyGoto action_11
action_26 (25) = happyGoto action_12
action_26 _ = happyReduce_9

action_27 _ = happyReduce_44

action_28 (53) = happyShift action_82
action_28 (54) = happyShift action_83
action_28 _ = happyFail

action_29 _ = happyReduce_10

action_30 (68) = happyShift action_81
action_30 _ = happyFail

action_31 (53) = happyShift action_80
action_31 (58) = happyShift action_67
action_31 (20) = happyGoto action_79
action_31 _ = happyReduce_35

action_32 (53) = happyShift action_78
action_32 (56) = happyShift action_47
action_32 (61) = happyShift action_48
action_32 (62) = happyShift action_49
action_32 (63) = happyShift action_50
action_32 (64) = happyShift action_51
action_32 (66) = happyShift action_52
action_32 _ = happyFail

action_33 _ = happyReduce_22

action_34 _ = happyReduce_23

action_35 (58) = happyShift action_77
action_35 _ = happyFail

action_36 (29) = happyShift action_13
action_36 (30) = happyShift action_14
action_36 (32) = happyShift action_7
action_36 (33) = happyShift action_15
action_36 (35) = happyShift action_16
action_36 (38) = happyShift action_33
action_36 (39) = happyShift action_17
action_36 (40) = happyShift action_18
action_36 (41) = happyShift action_34
action_36 (42) = happyShift action_19
action_36 (43) = happyShift action_20
action_36 (44) = happyShift action_21
action_36 (45) = happyShift action_22
action_36 (46) = happyShift action_23
action_36 (47) = happyShift action_24
action_36 (49) = happyShift action_35
action_36 (50) = happyShift action_36
action_36 (51) = happyReduce_39
action_36 (52) = happyShift action_37
action_36 (54) = happyReduce_39
action_36 (68) = happyShift action_38
action_36 (16) = happyGoto action_74
action_36 (17) = happyGoto action_75
action_36 (21) = happyGoto action_76
action_36 (22) = happyGoto action_39
action_36 (23) = happyGoto action_40
action_36 (24) = happyGoto action_11
action_36 (25) = happyGoto action_12
action_36 _ = happyReduce_39

action_37 (29) = happyShift action_13
action_37 (30) = happyShift action_14
action_37 (32) = happyShift action_7
action_37 (33) = happyShift action_15
action_37 (35) = happyShift action_16
action_37 (38) = happyShift action_33
action_37 (39) = happyShift action_17
action_37 (40) = happyShift action_18
action_37 (41) = happyShift action_34
action_37 (42) = happyShift action_19
action_37 (43) = happyShift action_20
action_37 (44) = happyShift action_21
action_37 (45) = happyShift action_22
action_37 (46) = happyShift action_23
action_37 (47) = happyShift action_24
action_37 (49) = happyShift action_35
action_37 (50) = happyShift action_36
action_37 (52) = happyShift action_37
action_37 (54) = happyReduce_28
action_37 (60) = happyReduce_28
action_37 (68) = happyShift action_38
action_37 (10) = happyGoto action_28
action_37 (15) = happyGoto action_29
action_37 (16) = happyGoto action_72
action_37 (17) = happyGoto action_73
action_37 (21) = happyGoto action_31
action_37 (23) = happyGoto action_32
action_37 (24) = happyGoto action_11
action_37 (25) = happyGoto action_12
action_37 _ = happyReduce_9

action_38 (51) = happyReduce_44
action_38 (53) = happyReduce_44
action_38 (54) = happyReduce_44
action_38 (58) = happyReduce_38
action_38 (60) = happyReduce_38
action_38 (68) = happyReduce_38
action_38 _ = happyReduce_44

action_39 (51) = happyShift action_70
action_39 (54) = happyShift action_71
action_39 _ = happyFail

action_40 (56) = happyShift action_47
action_40 (61) = happyShift action_48
action_40 (62) = happyShift action_49
action_40 (63) = happyShift action_50
action_40 (64) = happyShift action_51
action_40 (66) = happyShift action_52
action_40 _ = happyReduce_40

action_41 (56) = happyShift action_47
action_41 (61) = happyShift action_48
action_41 (62) = happyShift action_49
action_41 (63) = happyShift action_50
action_41 (64) = happyShift action_51
action_41 (66) = happyShift action_52
action_41 _ = happyReduce_62

action_42 (57) = happyShift action_69
action_42 _ = happyFail

action_43 (29) = happyShift action_13
action_43 (30) = happyShift action_14
action_43 (33) = happyShift action_15
action_43 (35) = happyShift action_16
action_43 (39) = happyShift action_17
action_43 (40) = happyShift action_18
action_43 (42) = happyShift action_19
action_43 (43) = happyShift action_20
action_43 (44) = happyShift action_21
action_43 (45) = happyShift action_22
action_43 (46) = happyShift action_23
action_43 (47) = happyShift action_24
action_43 (50) = happyShift action_25
action_43 (52) = happyShift action_26
action_43 (68) = happyShift action_27
action_43 (23) = happyGoto action_68
action_43 (24) = happyGoto action_11
action_43 (25) = happyGoto action_12
action_43 _ = happyFail

action_44 (58) = happyShift action_67
action_44 (20) = happyGoto action_66
action_44 _ = happyReduce_35

action_45 (68) = happyShift action_65
action_45 _ = happyFail

action_46 _ = happyReduce_1

action_47 (68) = happyShift action_63
action_47 (69) = happyShift action_64
action_47 _ = happyFail

action_48 (29) = happyShift action_13
action_48 (30) = happyShift action_14
action_48 (33) = happyShift action_15
action_48 (35) = happyShift action_16
action_48 (39) = happyShift action_17
action_48 (40) = happyShift action_18
action_48 (42) = happyShift action_19
action_48 (43) = happyShift action_20
action_48 (44) = happyShift action_21
action_48 (45) = happyShift action_22
action_48 (46) = happyShift action_23
action_48 (47) = happyShift action_24
action_48 (50) = happyShift action_25
action_48 (52) = happyShift action_26
action_48 (68) = happyShift action_27
action_48 (23) = happyGoto action_62
action_48 (24) = happyGoto action_11
action_48 (25) = happyGoto action_12
action_48 _ = happyFail

action_49 (29) = happyShift action_13
action_49 (30) = happyShift action_14
action_49 (33) = happyShift action_15
action_49 (35) = happyShift action_16
action_49 (39) = happyShift action_17
action_49 (40) = happyShift action_18
action_49 (42) = happyShift action_19
action_49 (43) = happyShift action_20
action_49 (44) = happyShift action_21
action_49 (45) = happyShift action_22
action_49 (46) = happyShift action_23
action_49 (47) = happyShift action_24
action_49 (50) = happyShift action_25
action_49 (52) = happyShift action_26
action_49 (68) = happyShift action_27
action_49 (23) = happyGoto action_61
action_49 (24) = happyGoto action_11
action_49 (25) = happyGoto action_12
action_49 _ = happyFail

action_50 (29) = happyShift action_13
action_50 (30) = happyShift action_14
action_50 (33) = happyShift action_15
action_50 (35) = happyShift action_16
action_50 (39) = happyShift action_17
action_50 (40) = happyShift action_18
action_50 (42) = happyShift action_19
action_50 (43) = happyShift action_20
action_50 (44) = happyShift action_21
action_50 (45) = happyShift action_22
action_50 (46) = happyShift action_23
action_50 (47) = happyShift action_24
action_50 (50) = happyShift action_25
action_50 (52) = happyShift action_26
action_50 (68) = happyShift action_27
action_50 (23) = happyGoto action_60
action_50 (24) = happyGoto action_11
action_50 (25) = happyGoto action_12
action_50 _ = happyFail

action_51 (29) = happyShift action_13
action_51 (30) = happyShift action_14
action_51 (33) = happyShift action_15
action_51 (35) = happyShift action_16
action_51 (39) = happyShift action_17
action_51 (40) = happyShift action_18
action_51 (42) = happyShift action_19
action_51 (43) = happyShift action_20
action_51 (44) = happyShift action_21
action_51 (45) = happyShift action_22
action_51 (46) = happyShift action_23
action_51 (47) = happyShift action_24
action_51 (50) = happyShift action_25
action_51 (52) = happyShift action_26
action_51 (68) = happyShift action_27
action_51 (23) = happyGoto action_59
action_51 (24) = happyGoto action_11
action_51 (25) = happyGoto action_12
action_51 _ = happyFail

action_52 (29) = happyShift action_13
action_52 (30) = happyShift action_14
action_52 (33) = happyShift action_15
action_52 (35) = happyShift action_16
action_52 (39) = happyShift action_17
action_52 (40) = happyShift action_18
action_52 (42) = happyShift action_19
action_52 (43) = happyShift action_20
action_52 (44) = happyShift action_21
action_52 (45) = happyShift action_22
action_52 (46) = happyShift action_23
action_52 (47) = happyShift action_24
action_52 (50) = happyShift action_25
action_52 (52) = happyShift action_26
action_52 (68) = happyShift action_27
action_52 (23) = happyGoto action_58
action_52 (24) = happyGoto action_11
action_52 (25) = happyGoto action_12
action_52 _ = happyFail

action_53 (27) = happyShift action_57
action_53 _ = happyFail

action_54 (32) = happyShift action_7
action_54 (68) = happyShift action_8
action_54 (19) = happyGoto action_55
action_54 (21) = happyGoto action_56
action_54 _ = happyFail

action_55 (54) = happyShift action_106
action_55 (59) = happyShift action_107
action_55 _ = happyFail

action_56 (27) = happyShift action_105
action_56 _ = happyFail

action_57 (32) = happyShift action_7
action_57 (68) = happyShift action_8
action_57 (21) = happyGoto action_104
action_57 _ = happyFail

action_58 (56) = happyShift action_47
action_58 (63) = happyShift action_50
action_58 _ = happyReduce_65

action_59 (56) = happyShift action_47
action_59 (61) = happyShift action_48
action_59 (62) = happyShift action_49
action_59 (63) = happyShift action_50
action_59 (64) = happyFail
action_59 (66) = happyShift action_52
action_59 _ = happyReduce_60

action_60 (56) = happyShift action_47
action_60 (61) = happyShift action_48
action_60 (62) = happyShift action_49
action_60 (63) = happyShift action_50
action_60 (64) = happyShift action_51
action_60 (66) = happyShift action_52
action_60 _ = happyReduce_59

action_61 (56) = happyShift action_47
action_61 (61) = happyShift action_48
action_61 (63) = happyShift action_50
action_61 (66) = happyShift action_52
action_61 _ = happyReduce_58

action_62 (56) = happyShift action_47
action_62 (63) = happyShift action_50
action_62 (66) = happyShift action_52
action_62 _ = happyReduce_57

action_63 (52) = happyShift action_103
action_63 _ = happyReduce_47

action_64 _ = happyReduce_56

action_65 (52) = happyShift action_102
action_65 _ = happyReduce_45

action_66 (52) = happyShift action_101
action_66 _ = happyFail

action_67 (32) = happyShift action_7
action_67 (38) = happyShift action_33
action_67 (41) = happyShift action_34
action_67 (49) = happyShift action_35
action_67 (50) = happyShift action_85
action_67 (52) = happyShift action_86
action_67 (68) = happyShift action_8
action_67 (16) = happyGoto action_74
action_67 (17) = happyGoto action_100
action_67 (21) = happyGoto action_76
action_67 _ = happyReduce_28

action_68 (53) = happyShift action_99
action_68 (56) = happyShift action_47
action_68 (61) = happyShift action_48
action_68 (62) = happyShift action_49
action_68 (63) = happyShift action_50
action_68 (64) = happyShift action_51
action_68 (66) = happyShift action_52
action_68 _ = happyFail

action_69 (29) = happyShift action_13
action_69 (30) = happyShift action_14
action_69 (33) = happyShift action_15
action_69 (35) = happyShift action_16
action_69 (39) = happyShift action_17
action_69 (40) = happyShift action_18
action_69 (42) = happyShift action_19
action_69 (43) = happyShift action_20
action_69 (44) = happyShift action_21
action_69 (45) = happyShift action_22
action_69 (46) = happyShift action_23
action_69 (47) = happyShift action_24
action_69 (50) = happyShift action_25
action_69 (52) = happyShift action_26
action_69 (68) = happyShift action_27
action_69 (23) = happyGoto action_98
action_69 (24) = happyGoto action_11
action_69 (25) = happyGoto action_12
action_69 _ = happyFail

action_70 _ = happyReduce_55

action_71 (29) = happyShift action_13
action_71 (30) = happyShift action_14
action_71 (33) = happyShift action_15
action_71 (35) = happyShift action_16
action_71 (39) = happyShift action_17
action_71 (40) = happyShift action_18
action_71 (42) = happyShift action_19
action_71 (43) = happyShift action_20
action_71 (44) = happyShift action_21
action_71 (45) = happyShift action_22
action_71 (46) = happyShift action_23
action_71 (47) = happyShift action_24
action_71 (50) = happyShift action_25
action_71 (52) = happyShift action_26
action_71 (68) = happyShift action_27
action_71 (23) = happyGoto action_97
action_71 (24) = happyGoto action_11
action_71 (25) = happyGoto action_12
action_71 _ = happyFail

action_72 (68) = happyShift action_81
action_72 _ = happyReduce_29

action_73 (54) = happyShift action_95
action_73 (60) = happyShift action_96
action_73 _ = happyFail

action_74 _ = happyReduce_29

action_75 (51) = happyShift action_94
action_75 (54) = happyShift action_95
action_75 _ = happyFail

action_76 (58) = happyShift action_67
action_76 (20) = happyGoto action_79
action_76 _ = happyReduce_35

action_77 (32) = happyShift action_7
action_77 (38) = happyShift action_33
action_77 (41) = happyShift action_34
action_77 (49) = happyShift action_35
action_77 (50) = happyShift action_85
action_77 (52) = happyShift action_86
action_77 (68) = happyShift action_8
action_77 (16) = happyGoto action_93
action_77 (21) = happyGoto action_76
action_77 _ = happyFail

action_78 (48) = happyShift action_89
action_78 (56) = happyShift action_90
action_78 (65) = happyShift action_91
action_78 (67) = happyShift action_92
action_78 _ = happyFail

action_79 _ = happyReduce_24

action_80 (29) = happyShift action_13
action_80 (30) = happyShift action_14
action_80 (33) = happyShift action_15
action_80 (35) = happyShift action_16
action_80 (39) = happyShift action_17
action_80 (40) = happyShift action_18
action_80 (42) = happyShift action_19
action_80 (43) = happyShift action_20
action_80 (44) = happyShift action_21
action_80 (45) = happyShift action_22
action_80 (46) = happyShift action_23
action_80 (47) = happyShift action_24
action_80 (50) = happyShift action_25
action_80 (52) = happyShift action_26
action_80 (68) = happyShift action_27
action_80 (23) = happyGoto action_88
action_80 (24) = happyGoto action_11
action_80 (25) = happyGoto action_12
action_80 _ = happyFail

action_81 _ = happyReduce_21

action_82 (60) = happyShift action_87
action_82 _ = happyFail

action_83 (32) = happyShift action_7
action_83 (38) = happyShift action_33
action_83 (41) = happyShift action_34
action_83 (49) = happyShift action_35
action_83 (50) = happyShift action_85
action_83 (52) = happyShift action_86
action_83 (68) = happyShift action_8
action_83 (15) = happyGoto action_84
action_83 (16) = happyGoto action_30
action_83 (21) = happyGoto action_76
action_83 _ = happyFail

action_84 _ = happyReduce_11

action_85 (32) = happyShift action_7
action_85 (38) = happyShift action_33
action_85 (41) = happyShift action_34
action_85 (49) = happyShift action_35
action_85 (50) = happyShift action_85
action_85 (52) = happyShift action_86
action_85 (68) = happyShift action_8
action_85 (16) = happyGoto action_74
action_85 (17) = happyGoto action_75
action_85 (21) = happyGoto action_76
action_85 _ = happyReduce_28

action_86 (32) = happyShift action_7
action_86 (38) = happyShift action_33
action_86 (41) = happyShift action_34
action_86 (49) = happyShift action_35
action_86 (50) = happyShift action_85
action_86 (52) = happyShift action_86
action_86 (68) = happyShift action_8
action_86 (16) = happyGoto action_74
action_86 (17) = happyGoto action_73
action_86 (21) = happyGoto action_76
action_86 _ = happyReduce_28

action_87 (29) = happyShift action_13
action_87 (30) = happyShift action_14
action_87 (33) = happyShift action_15
action_87 (35) = happyShift action_16
action_87 (39) = happyShift action_17
action_87 (40) = happyShift action_18
action_87 (42) = happyShift action_19
action_87 (43) = happyShift action_20
action_87 (44) = happyShift action_21
action_87 (45) = happyShift action_22
action_87 (46) = happyShift action_23
action_87 (47) = happyShift action_24
action_87 (50) = happyShift action_25
action_87 (52) = happyShift action_26
action_87 (68) = happyShift action_27
action_87 (23) = happyGoto action_124
action_87 (24) = happyGoto action_11
action_87 (25) = happyGoto action_12
action_87 _ = happyFail

action_88 (56) = happyShift action_47
action_88 (61) = happyShift action_48
action_88 (62) = happyShift action_49
action_88 (63) = happyShift action_50
action_88 (64) = happyShift action_51
action_88 (66) = happyShift action_52
action_88 _ = happyReduce_50

action_89 (52) = happyShift action_123
action_89 _ = happyFail

action_90 (37) = happyShift action_122
action_90 _ = happyFail

action_91 (29) = happyShift action_13
action_91 (30) = happyShift action_14
action_91 (33) = happyShift action_15
action_91 (35) = happyShift action_16
action_91 (39) = happyShift action_17
action_91 (40) = happyShift action_18
action_91 (42) = happyShift action_19
action_91 (43) = happyShift action_20
action_91 (44) = happyShift action_21
action_91 (45) = happyShift action_22
action_91 (46) = happyShift action_23
action_91 (47) = happyShift action_24
action_91 (50) = happyShift action_25
action_91 (52) = happyShift action_26
action_91 (68) = happyShift action_27
action_91 (23) = happyGoto action_121
action_91 (24) = happyGoto action_11
action_91 (25) = happyGoto action_12
action_91 _ = happyFail

action_92 (52) = happyShift action_120
action_92 _ = happyFail

action_93 (59) = happyShift action_119
action_93 _ = happyFail

action_94 _ = happyReduce_26

action_95 (32) = happyShift action_7
action_95 (38) = happyShift action_33
action_95 (41) = happyShift action_34
action_95 (49) = happyShift action_35
action_95 (50) = happyShift action_85
action_95 (52) = happyShift action_86
action_95 (68) = happyShift action_8
action_95 (16) = happyGoto action_118
action_95 (21) = happyGoto action_76
action_95 _ = happyFail

action_96 (32) = happyShift action_7
action_96 (38) = happyShift action_33
action_96 (41) = happyShift action_34
action_96 (49) = happyShift action_35
action_96 (50) = happyShift action_85
action_96 (52) = happyShift action_86
action_96 (68) = happyShift action_8
action_96 (16) = happyGoto action_117
action_96 (21) = happyGoto action_76
action_96 _ = happyFail

action_97 (56) = happyShift action_47
action_97 (61) = happyShift action_48
action_97 (62) = happyShift action_49
action_97 (63) = happyShift action_50
action_97 (64) = happyShift action_51
action_97 (66) = happyShift action_52
action_97 _ = happyReduce_41

action_98 (36) = happyShift action_116
action_98 (56) = happyShift action_47
action_98 (61) = happyShift action_48
action_98 (62) = happyShift action_49
action_98 (63) = happyShift action_50
action_98 (64) = happyShift action_51
action_98 (66) = happyShift action_52
action_98 _ = happyFail

action_99 (50) = happyShift action_115
action_99 _ = happyFail

action_100 (54) = happyShift action_95
action_100 (59) = happyShift action_114
action_100 _ = happyFail

action_101 (29) = happyShift action_13
action_101 (30) = happyShift action_14
action_101 (33) = happyShift action_15
action_101 (35) = happyShift action_16
action_101 (39) = happyShift action_17
action_101 (40) = happyShift action_18
action_101 (42) = happyShift action_19
action_101 (43) = happyShift action_20
action_101 (44) = happyShift action_21
action_101 (45) = happyShift action_22
action_101 (46) = happyShift action_23
action_101 (47) = happyShift action_24
action_101 (50) = happyShift action_25
action_101 (52) = happyShift action_26
action_101 (68) = happyShift action_27
action_101 (22) = happyGoto action_113
action_101 (23) = happyGoto action_40
action_101 (24) = happyGoto action_11
action_101 (25) = happyGoto action_12
action_101 _ = happyReduce_39

action_102 (29) = happyShift action_13
action_102 (30) = happyShift action_14
action_102 (33) = happyShift action_15
action_102 (35) = happyShift action_16
action_102 (39) = happyShift action_17
action_102 (40) = happyShift action_18
action_102 (42) = happyShift action_19
action_102 (43) = happyShift action_20
action_102 (44) = happyShift action_21
action_102 (45) = happyShift action_22
action_102 (46) = happyShift action_23
action_102 (47) = happyShift action_24
action_102 (50) = happyShift action_25
action_102 (52) = happyShift action_26
action_102 (68) = happyShift action_27
action_102 (22) = happyGoto action_112
action_102 (23) = happyGoto action_40
action_102 (24) = happyGoto action_11
action_102 (25) = happyGoto action_12
action_102 _ = happyReduce_39

action_103 (29) = happyShift action_13
action_103 (30) = happyShift action_14
action_103 (33) = happyShift action_15
action_103 (35) = happyShift action_16
action_103 (39) = happyShift action_17
action_103 (40) = happyShift action_18
action_103 (42) = happyShift action_19
action_103 (43) = happyShift action_20
action_103 (44) = happyShift action_21
action_103 (45) = happyShift action_22
action_103 (46) = happyShift action_23
action_103 (47) = happyShift action_24
action_103 (50) = happyShift action_25
action_103 (52) = happyShift action_26
action_103 (68) = happyShift action_27
action_103 (22) = happyGoto action_111
action_103 (23) = happyGoto action_40
action_103 (24) = happyGoto action_11
action_103 (25) = happyGoto action_12
action_103 _ = happyReduce_39

action_104 (50) = happyShift action_110
action_104 _ = happyFail

action_105 (32) = happyShift action_7
action_105 (68) = happyShift action_8
action_105 (21) = happyGoto action_109
action_105 _ = happyFail

action_106 (32) = happyShift action_7
action_106 (68) = happyShift action_8
action_106 (21) = happyGoto action_108
action_106 _ = happyFail

action_107 _ = happyReduce_32

action_108 (27) = happyShift action_135
action_108 _ = happyFail

action_109 _ = happyReduce_33

action_110 (12) = happyGoto action_134
action_110 _ = happyReduce_15

action_111 (53) = happyShift action_133
action_111 (54) = happyShift action_71
action_111 _ = happyFail

action_112 (53) = happyShift action_132
action_112 (54) = happyShift action_71
action_112 _ = happyFail

action_113 (53) = happyShift action_131
action_113 (54) = happyShift action_71
action_113 _ = happyFail

action_114 _ = happyReduce_36

action_115 (29) = happyShift action_13
action_115 (30) = happyShift action_14
action_115 (33) = happyShift action_15
action_115 (35) = happyShift action_16
action_115 (39) = happyShift action_17
action_115 (40) = happyShift action_18
action_115 (42) = happyShift action_19
action_115 (43) = happyShift action_20
action_115 (44) = happyShift action_21
action_115 (45) = happyShift action_22
action_115 (46) = happyShift action_23
action_115 (47) = happyShift action_24
action_115 (50) = happyShift action_25
action_115 (52) = happyShift action_26
action_115 (68) = happyShift action_27
action_115 (23) = happyGoto action_130
action_115 (24) = happyGoto action_11
action_115 (25) = happyGoto action_12
action_115 _ = happyFail

action_116 (29) = happyShift action_13
action_116 (30) = happyShift action_14
action_116 (33) = happyShift action_15
action_116 (35) = happyShift action_16
action_116 (39) = happyShift action_17
action_116 (40) = happyShift action_18
action_116 (42) = happyShift action_19
action_116 (43) = happyShift action_20
action_116 (44) = happyShift action_21
action_116 (45) = happyShift action_22
action_116 (46) = happyShift action_23
action_116 (47) = happyShift action_24
action_116 (50) = happyShift action_25
action_116 (52) = happyShift action_26
action_116 (68) = happyShift action_27
action_116 (23) = happyGoto action_129
action_116 (24) = happyGoto action_11
action_116 (25) = happyGoto action_12
action_116 _ = happyFail

action_117 (53) = happyShift action_128
action_117 _ = happyFail

action_118 _ = happyReduce_30

action_119 _ = happyReduce_27

action_120 (29) = happyShift action_13
action_120 (30) = happyShift action_14
action_120 (33) = happyShift action_15
action_120 (35) = happyShift action_16
action_120 (39) = happyShift action_17
action_120 (40) = happyShift action_18
action_120 (42) = happyShift action_19
action_120 (43) = happyShift action_20
action_120 (44) = happyShift action_21
action_120 (45) = happyShift action_22
action_120 (46) = happyShift action_23
action_120 (47) = happyShift action_24
action_120 (50) = happyShift action_25
action_120 (52) = happyShift action_26
action_120 (68) = happyShift action_27
action_120 (23) = happyGoto action_127
action_120 (24) = happyGoto action_11
action_120 (25) = happyGoto action_12
action_120 _ = happyFail

action_121 (56) = happyShift action_47
action_121 (61) = happyShift action_48
action_121 (62) = happyShift action_49
action_121 (63) = happyShift action_50
action_121 (64) = happyShift action_51
action_121 (66) = happyShift action_52
action_121 _ = happyReduce_63

action_122 (52) = happyShift action_126
action_122 _ = happyFail

action_123 (29) = happyShift action_13
action_123 (30) = happyShift action_14
action_123 (33) = happyShift action_15
action_123 (35) = happyShift action_16
action_123 (39) = happyShift action_17
action_123 (40) = happyShift action_18
action_123 (42) = happyShift action_19
action_123 (43) = happyShift action_20
action_123 (44) = happyShift action_21
action_123 (45) = happyShift action_22
action_123 (46) = happyShift action_23
action_123 (47) = happyShift action_24
action_123 (50) = happyShift action_25
action_123 (52) = happyShift action_26
action_123 (68) = happyShift action_27
action_123 (23) = happyGoto action_125
action_123 (24) = happyGoto action_11
action_123 (25) = happyGoto action_12
action_123 _ = happyFail

action_124 (56) = happyShift action_47
action_124 (61) = happyShift action_48
action_124 (62) = happyShift action_49
action_124 (63) = happyShift action_50
action_124 (64) = happyShift action_51
action_124 (66) = happyShift action_52
action_124 _ = happyReduce_53

action_125 (53) = happyShift action_143
action_125 (56) = happyShift action_47
action_125 (61) = happyShift action_48
action_125 (62) = happyShift action_49
action_125 (63) = happyShift action_50
action_125 (64) = happyShift action_51
action_125 (66) = happyShift action_52
action_125 _ = happyFail

action_126 (29) = happyShift action_13
action_126 (30) = happyShift action_14
action_126 (33) = happyShift action_15
action_126 (35) = happyShift action_16
action_126 (39) = happyShift action_17
action_126 (40) = happyShift action_18
action_126 (42) = happyShift action_19
action_126 (43) = happyShift action_20
action_126 (44) = happyShift action_21
action_126 (45) = happyShift action_22
action_126 (46) = happyShift action_23
action_126 (47) = happyShift action_24
action_126 (50) = happyShift action_25
action_126 (52) = happyShift action_26
action_126 (68) = happyShift action_27
action_126 (22) = happyGoto action_142
action_126 (23) = happyGoto action_40
action_126 (24) = happyGoto action_11
action_126 (25) = happyGoto action_12
action_126 _ = happyReduce_39

action_127 (53) = happyShift action_141
action_127 (56) = happyShift action_47
action_127 (61) = happyShift action_48
action_127 (62) = happyShift action_49
action_127 (63) = happyShift action_50
action_127 (64) = happyShift action_51
action_127 (66) = happyShift action_52
action_127 _ = happyFail

action_128 _ = happyReduce_25

action_129 (56) = happyShift action_47
action_129 (61) = happyShift action_48
action_129 (62) = happyShift action_49
action_129 (63) = happyShift action_50
action_129 (66) = happyShift action_52
action_129 _ = happyReduce_52

action_130 (51) = happyShift action_140
action_130 (56) = happyShift action_47
action_130 (61) = happyShift action_48
action_130 (62) = happyShift action_49
action_130 (63) = happyShift action_50
action_130 (64) = happyShift action_51
action_130 (66) = happyShift action_52
action_130 _ = happyFail

action_131 _ = happyReduce_49

action_132 _ = happyReduce_46

action_133 _ = happyReduce_48

action_134 (32) = happyShift action_7
action_134 (38) = happyShift action_33
action_134 (41) = happyShift action_34
action_134 (49) = happyShift action_35
action_134 (50) = happyShift action_85
action_134 (52) = happyShift action_86
action_134 (68) = happyShift action_8
action_134 (7) = happyGoto action_137
action_134 (15) = happyGoto action_138
action_134 (16) = happyGoto action_30
action_134 (21) = happyGoto action_139
action_134 _ = happyFail

action_135 (32) = happyShift action_7
action_135 (68) = happyShift action_8
action_135 (21) = happyGoto action_136
action_135 _ = happyFail

action_136 _ = happyReduce_34

action_137 (8) = happyGoto action_148
action_137 _ = happyReduce_6

action_138 (55) = happyShift action_147
action_138 _ = happyFail

action_139 (52) = happyShift action_146
action_139 (58) = happyShift action_67
action_139 (20) = happyGoto action_79
action_139 _ = happyReduce_35

action_140 (34) = happyShift action_145
action_140 _ = happyFail

action_141 _ = happyReduce_66

action_142 (53) = happyShift action_144
action_142 (54) = happyShift action_71
action_142 _ = happyFail

action_143 _ = happyReduce_64

action_144 _ = happyReduce_54

action_145 (50) = happyShift action_153
action_145 _ = happyFail

action_146 (32) = happyShift action_7
action_146 (38) = happyShift action_33
action_146 (41) = happyShift action_34
action_146 (49) = happyShift action_35
action_146 (50) = happyShift action_85
action_146 (52) = happyShift action_86
action_146 (68) = happyShift action_8
action_146 (10) = happyGoto action_152
action_146 (15) = happyGoto action_29
action_146 (16) = happyGoto action_30
action_146 (21) = happyGoto action_76
action_146 _ = happyReduce_9

action_147 _ = happyReduce_16

action_148 (32) = happyShift action_7
action_148 (38) = happyShift action_33
action_148 (41) = happyShift action_34
action_148 (49) = happyShift action_35
action_148 (50) = happyShift action_85
action_148 (51) = happyShift action_151
action_148 (52) = happyShift action_86
action_148 (68) = happyShift action_8
action_148 (9) = happyGoto action_149
action_148 (16) = happyGoto action_150
action_148 (21) = happyGoto action_76
action_148 _ = happyFail

action_149 _ = happyReduce_7

action_150 (68) = happyShift action_156
action_150 _ = happyFail

action_151 _ = happyReduce_4

action_152 (53) = happyShift action_155
action_152 (54) = happyShift action_83
action_152 _ = happyFail

action_153 (29) = happyShift action_13
action_153 (30) = happyShift action_14
action_153 (33) = happyShift action_15
action_153 (35) = happyShift action_16
action_153 (39) = happyShift action_17
action_153 (40) = happyShift action_18
action_153 (42) = happyShift action_19
action_153 (43) = happyShift action_20
action_153 (44) = happyShift action_21
action_153 (45) = happyShift action_22
action_153 (46) = happyShift action_23
action_153 (47) = happyShift action_24
action_153 (50) = happyShift action_25
action_153 (52) = happyShift action_26
action_153 (68) = happyShift action_27
action_153 (23) = happyGoto action_154
action_153 (24) = happyGoto action_11
action_153 (25) = happyGoto action_12
action_153 _ = happyFail

action_154 (51) = happyShift action_159
action_154 (56) = happyShift action_47
action_154 (61) = happyShift action_48
action_154 (62) = happyShift action_49
action_154 (63) = happyShift action_50
action_154 (64) = happyShift action_51
action_154 (66) = happyShift action_52
action_154 _ = happyFail

action_155 (50) = happyShift action_158
action_155 _ = happyFail

action_156 (52) = happyShift action_157
action_156 _ = happyFail

action_157 (32) = happyShift action_7
action_157 (38) = happyShift action_33
action_157 (41) = happyShift action_34
action_157 (49) = happyShift action_35
action_157 (50) = happyShift action_85
action_157 (52) = happyShift action_86
action_157 (68) = happyShift action_8
action_157 (10) = happyGoto action_161
action_157 (15) = happyGoto action_29
action_157 (16) = happyGoto action_30
action_157 (21) = happyGoto action_76
action_157 _ = happyReduce_9

action_158 (28) = happyShift action_160
action_158 _ = happyFail

action_159 _ = happyReduce_51

action_160 (52) = happyShift action_163
action_160 _ = happyFail

action_161 (53) = happyShift action_162
action_161 (54) = happyShift action_83
action_161 _ = happyFail

action_162 (50) = happyShift action_166
action_162 _ = happyFail

action_163 (68) = happyShift action_165
action_163 (11) = happyGoto action_164
action_163 _ = happyReduce_12

action_164 (53) = happyShift action_168
action_164 (54) = happyShift action_169
action_164 _ = happyFail

action_165 _ = happyReduce_13

action_166 (31) = happyShift action_167
action_166 _ = happyFail

action_167 (29) = happyShift action_13
action_167 (30) = happyShift action_14
action_167 (33) = happyShift action_15
action_167 (35) = happyShift action_16
action_167 (39) = happyShift action_17
action_167 (40) = happyShift action_18
action_167 (42) = happyShift action_19
action_167 (43) = happyShift action_20
action_167 (44) = happyShift action_21
action_167 (45) = happyShift action_22
action_167 (46) = happyShift action_23
action_167 (47) = happyShift action_24
action_167 (50) = happyShift action_25
action_167 (52) = happyShift action_26
action_167 (68) = happyShift action_27
action_167 (23) = happyGoto action_172
action_167 (24) = happyGoto action_11
action_167 (25) = happyGoto action_12
action_167 _ = happyFail

action_168 (55) = happyShift action_171
action_168 _ = happyFail

action_169 (68) = happyShift action_170
action_169 _ = happyFail

action_170 _ = happyReduce_14

action_171 (29) = happyShift action_176
action_171 (13) = happyGoto action_174
action_171 (14) = happyGoto action_175
action_171 _ = happyReduce_17

action_172 (55) = happyShift action_173
action_172 (56) = happyShift action_47
action_172 (61) = happyShift action_48
action_172 (62) = happyShift action_49
action_172 (63) = happyShift action_50
action_172 (64) = happyShift action_51
action_172 (66) = happyShift action_52
action_172 _ = happyFail

action_173 (51) = happyShift action_180
action_173 _ = happyFail

action_174 (29) = happyShift action_176
action_174 (51) = happyShift action_179
action_174 (14) = happyGoto action_178
action_174 _ = happyFail

action_175 _ = happyReduce_18

action_176 (56) = happyShift action_177
action_176 _ = happyFail

action_177 (68) = happyShift action_181
action_177 _ = happyFail

action_178 _ = happyReduce_19

action_179 _ = happyReduce_5

action_180 _ = happyReduce_8

action_181 (57) = happyShift action_182
action_181 _ = happyFail

action_182 (68) = happyShift action_183
action_182 _ = happyFail

action_183 (55) = happyShift action_184
action_183 _ = happyFail

action_184 _ = happyReduce_20

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 _
	(HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1 happy_var_2
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 10 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_9) `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_2,ClassDef happy_var_2 happy_var_3 happy_var_5 happy_var_7 happy_var_8 happy_var_9)
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 12 7 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ConstrDef happy_var_1 happy_var_3 happy_var_8 happy_var_11
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_0  8 happyReduction_6
happyReduction_6  =  HappyAbsSyn8
		 ([]
	)

happyReduce_7 = happySpecReduce_2  8 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_2 : happy_var_1
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 10 9 happyReduction_8
happyReduction_8 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName happy_var_2)) `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (MethodDef happy_var_1 happy_var_2 happy_var_4 happy_var_8
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_0  10 happyReduction_9
happyReduction_9  =  HappyAbsSyn10
		 ([]
	)

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3 : happy_var_1
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_0  11 happyReduction_12
happyReduction_12  =  HappyAbsSyn11
		 ([]
	)

happyReduce_13 = happySpecReduce_1  11 happyReduction_13
happyReduction_13 (HappyTerminal (TokenName happy_var_1))
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  11 happyReduction_14
happyReduction_14 (HappyTerminal (TokenName happy_var_3))
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_3 : happy_var_1
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_0  12 happyReduction_15
happyReduction_15  =  HappyAbsSyn12
		 ([]
	)

happyReduce_16 = happySpecReduce_3  12 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_2 : happy_var_1
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_0  13 happyReduction_17
happyReduction_17  =  HappyAbsSyn13
		 ([]
	)

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  13 happyReduction_19
happyReduction_19 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_2 : happy_var_1
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 6 14 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyTerminal (TokenName happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((happy_var_3,happy_var_5)
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  15 happyReduction_21
happyReduction_21 (HappyTerminal (TokenName happy_var_2))
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ((happy_var_1,happy_var_2)
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  16 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn16
		 (TypeBool
	)

happyReduce_23 = happySpecReduce_1  16 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn16
		 (TypeComplex
	)

happyReduce_24 = happySpecReduce_2  16 happyReduction_24
happyReduction_24 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn16
		 (TypeClass happy_var_1 happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 16 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeClosure happy_var_4 happy_var_2
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  16 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (TypeTuple happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 16 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeQuantum happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_0  17 happyReduction_28
happyReduction_28  =  HappyAbsSyn17
		 ([]
	)

happyReduce_29 = happySpecReduce_1  17 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  17 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_3 : happy_var_1
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_0  18 happyReduction_31
happyReduction_31  =  HappyAbsSyn18
		 ([]
	)

happyReduce_32 = happySpecReduce_3  18 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  19 happyReduction_33
happyReduction_33 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn19
		 ([(happy_var_1,happy_var_3)]
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 5 19 happyReduction_34
happyReduction_34 ((HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 ((happy_var_3,happy_var_5) : happy_var_1
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_0  20 happyReduction_35
happyReduction_35  =  HappyAbsSyn20
		 ([]
	)

happyReduce_36 = happySpecReduce_3  20 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  21 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn21
		 ("Object"
	)

happyReduce_38 = happySpecReduce_1  21 happyReduction_38
happyReduction_38 (HappyTerminal (TokenName happy_var_1))
	 =  HappyAbsSyn21
		 (happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_0  22 happyReduction_39
happyReduction_39  =  HappyAbsSyn22
		 ([]
	)

happyReduce_40 = happySpecReduce_1  22 happyReduction_40
happyReduction_40 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 ([happy_var_1]
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  22 happyReduction_41
happyReduction_41 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_3 : happy_var_1
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  23 happyReduction_42
happyReduction_42 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (BooleanLiteral happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  23 happyReduction_43
happyReduction_43 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn23
		 (ComplexLiteral happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  23 happyReduction_44
happyReduction_44 (HappyTerminal (TokenName happy_var_1))
	 =  HappyAbsSyn23
		 (Var happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  23 happyReduction_45
happyReduction_45 (HappyTerminal (TokenName happy_var_3))
	_
	_
	 =  HappyAbsSyn23
		 (ThisAccessAttr happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happyReduce 6 23 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (ThisAccessMeth happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_3  23 happyReduction_47
happyReduction_47 (HappyTerminal (TokenName happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (AttrAccess happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happyReduce 6 23 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (MethodAccess happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 6 23 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (CreateObject happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 4 23 happyReduction_50
happyReduction_50 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (Cast happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 11 23 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn23  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (If happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 6 23 happyReduction_52
happyReduction_52 ((HappyAbsSyn23  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 5 23 happyReduction_53
happyReduction_53 ((HappyAbsSyn23  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (ClosureDef happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 8 23 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (InvokeClosure happy_var_2 happy_var_7
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_3  23 happyReduction_55
happyReduction_55 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (Tuple happy_var_2
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  23 happyReduction_56
happyReduction_56 (HappyTerminal (TokenNumber happy_var_3))
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (TupleAccess happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  23 happyReduction_57
happyReduction_57 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (ComplexTimes happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  23 happyReduction_58
happyReduction_58 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (ComplexPlus happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  23 happyReduction_59
happyReduction_59 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (ComplexMinus happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  23 happyReduction_60
happyReduction_60 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (RelEquals happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  23 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn23
		 (MonadZero
	)

happyReduce_62 = happySpecReduce_2  23 happyReduction_62
happyReduction_62 (HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn23
		 (MonadReturn happy_var_2
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happyReduce 5 23 happyReduction_63
happyReduction_63 ((HappyAbsSyn23  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (MonadBind happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_64 = happyReduce 7 23 happyReduction_64
happyReduction_64 (_ `HappyStk`
	(HappyAbsSyn23  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (MonadPlus happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_65 = happySpecReduce_3  23 happyReduction_65
happyReduction_65 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn23
		 (ScalarProduct happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happyReduce 7 23 happyReduction_66
happyReduction_66 (_ `HappyStk`
	(HappyAbsSyn23  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (TensorProduct happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_67 = happySpecReduce_1  24 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn24
		 (BLTrue
	)

happyReduce_68 = happySpecReduce_1  24 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn24
		 (BLFalse
	)

happyReduce_69 = happySpecReduce_1  25 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn25
		 (ComplexNumber 1.0
	)

happyReduce_70 = happySpecReduce_1  25 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn25
		 (ComplexNumber 0.0
	)

happyReduce_71 = happySpecReduce_1  25 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn25
		 (ComplexHalf
	)

happyReduce_72 = happySpecReduce_1  25 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn25
		 (ComplexMHalf
	)

happyNewToken action sts stk [] =
	action 70 70 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenKWClass -> cont 26;
	TokenKWExtends -> cont 27;
	TokenKWSuper -> cont 28;
	TokenKWThis -> cont 29;
	TokenKWNew -> cont 30;
	TokenKWReturn -> cont 31;
	TokenKWObject -> cont 32;
	TokenKWIf -> cont 33;
	TokenKWElse -> cont 34;
	TokenKWLet -> cont 35;
	TokenKWIn -> cont 36;
	TokenKWInvoke -> cont 37;
	TokenKWBoolean -> cont 38;
	TokenKWTrue -> cont 39;
	TokenKWFalse -> cont 40;
	TokenKWComplex -> cont 41;
	TokenKWComplexOne -> cont 42;
	TokenKWComplexZero -> cont 43;
	TokenKWComplexHalf -> cont 44;
	TokenKWComplexMHalf -> cont 45;
	TokenKWMZero -> cont 46;
	TokenKWMReturn -> cont 47;
	TokenKWMPlus -> cont 48;
	TokenKWVec -> cont 49;
	TokenLBrace -> cont 50;
	TokenRBrace -> cont 51;
	TokenLParen -> cont 52;
	TokenRParen -> cont 53;
	TokenComma -> cont 54;
	TokenSemi -> cont 55;
	TokenDot -> cont 56;
	TokenAssign -> cont 57;
	TokenLT -> cont 58;
	TokenGT -> cont 59;
	TokenArrow -> cont 60;
	TokenTimes -> cont 61;
	TokenPlus -> cont 62;
	TokenMinus -> cont 63;
	TokenEqual -> cont 64;
	TokenBind -> cont 65;
	TokenScalar -> cont 66;
	TokenTensor -> cont 67;
	TokenName happy_dollar_dollar -> cont 68;
	TokenNumber happy_dollar_dollar -> cont 69;
	_ -> happyError' (tk:tks)
	}

happyError_ 70 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parser tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}





# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4























# 5 "<command-line>" 2
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}








{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 148 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 246 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 312 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
