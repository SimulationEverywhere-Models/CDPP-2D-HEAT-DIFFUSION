[top]
components : superficie generadorCalor@Generator generadorFrio@Generator
link : out@generadorCalor inputCalor@superficie
link : out@generadorFrio  inputFrio@superficie

[superficie]
type : cell
dim : (10,10)
delay : transport
defaultDelayTime  : 100
border : wrapped 
neighbors : superficie(-1,-1) superficie(-1,0) superficie(-1,1) 
neighbors : superficie(0,-1)  superficie(0,0)  superficie(0,1)
neighbors : superficie(1,-1)  superficie(1,0)  superficie(1,1)
initialvalue : 24
in : inputCalor inputFrio
link : inputCalor in@superficie(5,5)
link : inputCalor in@superficie(2,2)
link : inputFrio  in@superficie(8,8)
link : inputFrio  in@superficie(2,8)
localtransition : calor-rule
portInTransition : in@superficie(5,5)  setCalor
portInTransition : in@superficie(2,2)  setCalor
portInTransition : in@superficie(8,8)  setFrio
portInTransition : in@superficie(2,8)  setFrio

[calor-rule]
rule : { ((0,0) + (-1,-1) + (-1,0) + (-1,1) + (0,-1) + (0,1) + (1,-1) + (1,0)
         + (1,1)) / 9 } 1000 { t } 

[setCalor]
rule : { uniform(24,40) } 1000 { t }

[setFrio]
rule : { uniform(-10,15) } 1000 { t }



[generadorCalor]
distribution : exponential
mean : 50
initial : 1
increment : 0

[generadorFrio]
distribution : exponential
mean : 50
initial : 1
increment : 0
