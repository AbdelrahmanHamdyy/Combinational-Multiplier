`include "bcd.v"
module bcd_tb();

reg [7:0] Input;
wire [11:0] bcd;

reg [7:0] i;

initial begin
   $monitor("Binary=%b,BCD=%b",Input,bcd);
   Input = 0;
   for(i = 0; i < 256; i = i + 1)
   begin
     #1 Input = i; 
   end
end

binary_to_BCD BIN2BCD (
Input,
bcd[3:0],
bcd[7:4],
bcd[11:8]
 );
endmodule
