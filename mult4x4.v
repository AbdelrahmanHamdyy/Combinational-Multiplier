module Multiplier(In1,In2,Out);

input[3:0] In1;
input[3:0] In2;
output[7:0] Out;

wire[3:0] In1;
wire[3:0] In2;

assign{Out[7:0]}=In1[3:0]*In2[3:0];

endmodule
