module counter(input clk, output reg[15:0] led, output reg[15:0] display_number);
    reg [31:0] clk_counter = 0;
//    assign digit = 4'b1100;
//    assign Seven_Seg = 8'b11000000;
//    reg [15:0] display_number;
    initial begin
        led = 16'h4888;
        display_number = 1234;
    end
    always @(posedge clk) begin
        if (clk_counter == 500_000) begin
            clk_counter <= 0;
            led <= led + 1;
            if (display_number == 9999)
                display_number <= 0;
            else
                display_number <= display_number + 1;
//            digit <= 4'b0001;
//            Seven_Seg <= digit_to_seg(4);
        end
//        Seven_Seg <= digit_to_seg()
        else begin
            clk_counter <= clk_counter + 1;
        end
    end
    

endmodule


//module display(output wire[3:0] digit, output wire[
