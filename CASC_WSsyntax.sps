COMPUTE int_I = Avg_int_ClassI. 
COMPUTE int_G = Avg_int_ClassG. 
COMPUTE comm_I = Comm_ClassI. 
COMPUTE comm_G = Comm_ClassG. 
COMPUTE diff_I = difficult_rate_I. 
COMPUTE diff_G = difficult_rate_G. 
COMPUTE st_I = Stereo_threat_ClassI. 
COMPUTE st_G = stereo_threat_ClassG. 
EXECUTE. 

T-TEST PAIRS=comm_G WITH comm_I (PAIRED). 

T-TEST PAIRS=int_G WITH int_I (PAIRED). 

compute int_diff = int_G - int_I. 
compute comm_diff = comm_G - comm_I. 
compute comm_sum = comm_G+comm_I - 8.325490. 
EXECUTE.  
regression dep = int_diff /method = enter comm_diff comm_sum. 

regression dep = int_G /method = enter comm_G. 
regression dep = int_I /method = enter comm_I. 

MEMORE m = comm_G comm_I /y = int_G int_I. 


MEMORE m = comm_I comm_G diff_I diff_G /y = int_I int_G. 

MEMORE m = comm_I comm_G diff_I diff_G st_I st_G /y = int_I int_G. 

DATASET ACTIVATE DataSet1.

