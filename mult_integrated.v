`include "mult4x4.v"
`include "bcd.v"
`include "ssd.v"

module mult_integrated(
input[3:0] In1,
input[3:0] In2,
output[6:0] seg1,
output[6:0] seg2,
output[6:0] seg3
);

wire[7:0] out1;
Multiplier mult4x4(
In1,
In2,
out1
);

wire[3:0] BCD1;
wire[3:0] BCD2;
wire[3:0] BCD3;
binary_to_bcd B2B(
out1,
BCD1,
BCD2,
BCD3
);

BCDTo7Seg B7S1(
BCD1,
seg1
);

BCDTo7Seg B7S2(
BCD2,
seg2
);

BCDTo7Seg B7S3(
BCD3,
seg3
);

endmodule




