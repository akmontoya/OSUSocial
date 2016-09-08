sort cases by sex. 

compute interest = avg_interest. 
compute comm = Field_Comm. 
recode Cond (1 = 2)(2 = 1) INTO gw. 
Execute. 

regression /dep = interest /method = enter gw. 
regression /dep = comm /method = enter gw. 
regression /dep = interest /method = enter gw comm. 

PROCESS vars = gw interest comm /x = gw /m = comm /y = interest / model = 4 /total = 1/percent = 1. 
