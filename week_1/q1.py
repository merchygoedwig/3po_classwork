"""
3PO: Tutorial 1, Question 1
Genevieve Clifford (1779290), University of Birmingham
sxc1065@student.bham.ac.uk / genevieve@becquerel.me
"""

import numpy as np
from scipy.optimize import linprog

A_ub=np.array([
    [1,0],
    [0,1],
    [1,2],
    [1,1]
])

b_ub=np.array([70,50,120,90])

c=np.array([-20,-30])

res=linprog(c,A_ub=A_ub,b_ub=b_ub,bounds=(0,None))

print('A profit of £',-round(res.fun,0),' is to be made by producing ',round(res.x[0],0),
' low-cost and ',round(res.x[1],0),' high-cost units respectively')