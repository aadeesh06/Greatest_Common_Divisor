`include "gcd.v"
module gcd_tb;
    reg [15:0] data_in;
    reg clk, start;

    wire done;

    gcd_datapath DP(greater_than, less_than, equal_to, loadA, loadB, sel1, sel2, sel_in, data_in, clk);
    controller CON(loadA, loadB, sel1, sel2, sel_in, done, clk, less_than,greater_than, equal_to, start);
    initial 
    begin
        clk = 1'b0;
        #3 start = 1'b1;
        #1000 $finish;
    end

    always #5 clk = ~ clk;

    initial 
    begin
        #12 data_in = 100;
        #10 data_in = 125;
    end
    initial begin
        $monitor($time, " start = %d A = %d B = %d done = %d ", start, DP.A_out, DP.B_out, done);
        $dumpfile("gcd.vcd");
        $dumpvars(0,gcd_tb);
    end
endmodule