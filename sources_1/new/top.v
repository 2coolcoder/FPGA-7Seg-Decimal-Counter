module top(clk, led, digit, Seven_Seg);
    input clk;
    output [15:0] led;
    output [0:3] digit;
    output [0:7] Seven_Seg;
    wire [15:0] display_number;
    counter c(
        .clk(clk),
        .led(led),
        .display_number(display_number)
    );
    print_num disp(
        .clk(clk),
        .display_number(display_number),
        .digit(digit),
        .Seven_Seg(Seven_Seg)
    );
endmodule