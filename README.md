# Immunovirotherapy-discrete-continuum
MATLAB code used in the paper "A hybrid discrete-continuum modelling approach for the interactions of the immune system with oncolytic viral infections."

The parameters in the file parameters_immunoviro.m are currently set to reproduce the data for the green lines in Fig. 8c-d in the paper (wide viral injection with delayed immune enhancement). The codes agents_immune_initial.m and pde_immune_initial.m initialise the variable. The codes agents_immune_dynamics.m and pde_immune_dynamics.m simulate the dynamics from Tstart to Tend; changes of parameters/variables during the simulations can then be appropriately reproduced by varying these times multiple times.

Note that agent-based simulations take several hours to run. The code is currently set to run a single simulation at a time. Different simulations can be obtained by varying the parameter seed (currently set to 1).

The folder plot contains the code used to produce the figures in the paper. Note that the data need to be preprocessed through either tcp_data.m (in the case of plots of TCP and ICP) or preprocessing.m (all the other cases; the number of simulations that needs to be combined may vary).
