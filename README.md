# Greatest_Common_Divisor
A program to calculate the Greatest Common Divisor(also called HCF) of two 16 bit numbers utilizing the datapath and controller design.
In the data path design, since we have 2 numbers, it is definite that we need two registers. We are using the method of repeated subtraction, therfore a subtractor is needed.
Whenever loadA is 1, data_in is loaded to A and whenever loadB = 1, data_in is loaded to B.
The sel_in selection line of the multiplexer determines whether the data_in is to be loaded in the registers or the output of the subtractor module(sub_out).

For better understanding, you can refer img_design.jpeg
