module comparator(less_than, greater_than,equal_to, data1, data2);
    input [15:0]data1, data2;
    output less_than, greater_than, equal_to;

    assign less_than = (data1 < data2);
    assign greater_than = (data1 > data2);
    assign equal_to = (data1 == data2);
endmodule