module controller(
    loadA, loadB, sel1, sel2, sel_in, done, clk, less_than, greater_than, equal_to, start);
    input start, clk, less_than, greater_than, equal_to;
    output reg loadA, loadB, sel1, sel2, sel_in, done;

    reg [2:0] state;
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;

    always @(posedge clk)
    begin
        case(state)
            s0 :begin 
                    if(start) 
                        state <= s1;
                end
            s1: state <= s2;

            s2: begin
                    #1 if(equal_to) 
                        state <= s5;
                    else if(less_than)
                        state <= s3;
                    else if(greater_than)
                        state <= s4;
                end
            s3: begin
                    #1 if(equal_to)
                        state <= s5;
                    else if(less_than)
                        state <= s3;
                    else if(greater_than)   
                        state <= s4;
                end
            s4: begin
                    #1 if(equal_to)
                        state <= s5;
                    else if(less_than)
                        state <= s3;
                    else if(greater_than)   
                        state <= s4;
                end
            s5: state <= s5;
            default : state <= s0;
        endcase
    end

    always @(state)
    begin
        case(state)
            s0 :begin
                    sel_in = 1; loadA = 1; loadB = 0; done = 0;
                end
            s1 :begin
                    sel_in = 1; loadA = 0; loadB = 1;
                end 
            s2 :begin
                    if(equal_to)
                        done = 1;
                    else if(less_than)
                        begin
                            sel1 = 1; sel2 = 0; sel_in = 0;
                            #1 loadA = 0; loadB = 1;
                        end
                    else if(greater_than)
                        begin
                            sel1 = 0; sel2 = 1; sel_in = 0;
                            #1 loadA = 1; loadB = 0;
                        end
                end
            s3 :begin   
                    if(equal_to)
                        done = 1;
                    else if(less_than)
                        begin
                            sel1 = 1; sel2 = 0; sel_in = 0;
                            #1 loadA = 0; loadB = 1;
                        end
                    else if(greater_than)
                        begin
                            sel1 = 0; sel2 = 1; sel_in = 0;
                            #1 loadA = 1; loadB = 0;
                        end
                end 
            s4 :begin
                    if(equal_to)
                        done = 1;
                    else if(less_than)
                        begin
                            sel1 = 1; sel2 = 0; sel_in = 0;
                            #1 loadA = 0; loadB = 1;
                        end
                    else if(greater_than)
                        begin
                            sel1 = 0; sel2 = 1; sel_in = 0;
                            #1 loadA = 1; loadB = 0;
                        end
                end
            s5 :begin 
                    done = 1; sel1 = 0; sel2 = 0; loadA = 0; loadB = 0; 
                end
            default : begin 
                        loadA = 0; loadB = 0;
                      end
        endcase
    end
endmodule