module print_num(input clk, output reg[0:3] digit, output reg[0:7] Seven_Seg, input [15:0] display_number);
    reg [7:0] digit_0 = 0;
    reg [7:0] digit_1 = 0;
    reg [7:0] digit_2 = 0;
    reg [7:0] digit_3 = 0;
    reg [15:0] clk_counter = 0;
//    reg [15:0] display_number = 1234;
//    reg [15:0] display_number = 1234;

    always @(display_number) begin
        digit_0 <= (display_number % 10);
        digit_1 <= (display_number % 100) / 10;
        digit_2 <= (display_number % 1000) / 100;
        digit_3 <= (display_number / 1000) % 10;
    end
    
    always @(posedge clk) begin
        if (clk_counter < 10_000) begin
            digit <= 4'b1000;
            Seven_Seg <= digit_to_seg(digit_3);
        end
        else if (clk_counter < 20_000) begin
            digit <= 4'b0100;
            Seven_Seg <= digit_to_seg(digit_2);
        end
        else if (clk_counter < 30_000) begin
            digit <= 4'b0010;
            Seven_Seg <= digit_to_seg(digit_1);
        end
        else begin
            digit <= 4'b0001;
            Seven_Seg <= digit_to_seg(digit_0);
        end
        if (clk_counter == 40_000)
            clk_counter <= 0;
        else
            clk_counter <= clk_counter + 1;
                
    end

endmodule

function [7:0] digit_to_seg(input [3:0] d);
    case(d)
        4'h0: digit_to_seg = 8'b00000011;
        4'h1: digit_to_seg = 8'b10011111;
        4'h2: digit_to_seg = 8'b00100101;
        4'h3: digit_to_seg = 8'b00001101;
        4'h4: digit_to_seg = 8'b10011001;
        4'h5: digit_to_seg = 8'b01001001;
        4'h6: digit_to_seg = 8'b01000001;
        4'h7: digit_to_seg = 8'b00011111;
        4'h8: digit_to_seg = 8'b00000001;
        4'h9: digit_to_seg = 8'b00001001;
        default: digit_to_seg = 0;    
    endcase 
endfunction 
