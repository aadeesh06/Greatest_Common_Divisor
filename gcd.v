`include "pipo.v"
`include "subtractor.v"
`include "mux.v"
`include "comparator.v"
`include "controller.v"
module gcd_datapath(
    greater_than, less_than, equal_to, loadA, loadB,
    sel1, sel2, sel_in, data_in, clk);
    input loadA, loadB, sel1, sel2, sel_in, clk;
    input [15:0] data_in;
    output greater_than, less_than, equal_to;
    wire [15:0] A_out, B_out, x, y, bus, sub_out;
    pipo p1(A_out, bus, loadA, clk);
    pipo p2(B_out, bus, loadB, clk);
    multiplexer mux1(x, A_out, B_out, sel1);
    multiplexer mux2(y , A_out, B_out, sel2);
    multiplexer mux_load(bus, sub_out, data_in, sel_in);
    subtractor s1(sub_out, x, y);
    comparator c1(less_than, greater_than, equal_to, A_out, B_out);
endmodule