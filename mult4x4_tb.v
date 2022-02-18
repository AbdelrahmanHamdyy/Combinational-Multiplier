`include "mult4x4.v"
module Multiplier_tb();
reg [3:0] A,B;
wire[7:0] C;
initial begin
$monitor("A=%d,B=%d,C=%d",A,B,C);
A=0;B=0;
#10
A=4'b1001;
B=4'b1100;
#10
A=4'b1010;
B=4'b1111;
#10
A=4'b0000;
B=4'b1111;
#10
A=4'b0001;
B=4'b1011;
end

Multiplier M1(
A,
B,
C
);
endmodule
