# Host-parasitoid paper 1

These are the codes used for my paper - Effect of Migrations on Synchrony in Host-Parasitoid system.

Each of CHP functions stands for coupled host parasitoid model with 2 patches. It takes in input growth and migration rates for host and parasitoid and the time of simulation. It starts with random host and parasitoid population in each patch and generates time series. Each CHP files differ in the functional form used according to Table 1.

CHP.m - the original model as described by Equations 4-5 in the paper. Intraspecific competition is exactly compensating and parasitoid search for hosts is random.

CHPaggr.m - Coupled host parasitoid model where parasitoid search for hosts are aggregated.

CHPwR.m - Coupled host parasitoid model where intraspecific competition is modeled using Ricker map.

CHPwS.m - Coupled host parasitoid model where intraspecific competition is modeled using Smith map.

CHPwSaggr.m - Coupled host parasitoid model where intraspecific competition is modeled using Smith map, where parasitoid search for hosts are aggregated.

cellularHP.m - Cellular automata model (as described by Section 6)

lengthofcycleplot.m - Generates data for calculating length of cycle for a given set of growth rates with the original model (equation 5-6).

lengthofcycle.m - Generates an average length of cycle based on the input time series a and b generated from a 2 patch model.





