// Shift-Add-3 module
module shift_add_3(
input[3:0] In,
output[3:0] Out
);
assign {Out[3:0]} = (In > 4) ? (In + 3) : In;
endmodule

module binary_to_bcd(
input[7:0] bin,
output[3:0] Ones,
output[3:0] Tens,
output[3:0] Hundreds
);

wire[3:0] in1;
assign {in1[3]} = 0;
assign {in1[2:0]} = bin[7:5];

wire[3:0] out1;

shift_add_3 S1(
in1,
out1
);

wire[3:0] in2;
assign {in2[0]} = bin[4];
assign {in2[3:1]} = out1[2:0];

wire[3:0] out2;

shift_add_3 S2(
in2,
out2
);

wire[3:0] in3;
assign {in3[0]} = bin[3];
assign {in3[3:1]} = out2[2:0];

wire[3:0] out3;

shift_add_3 S3(
in3,
out3
);

wire[3:0] in4;
assign {in4[3]} = 0;
assign {in4[2]} = out1[3];
assign {in4[1]} = out2[3];
assign {in4[0]} = out3[3];

wire[3:0] out4;

shift_add_3 S4(
in4,
out4
);

wire[3:0] in5;
assign {in5[0]} = bin[2];
assign {in5[3:1]} = out3[2:0];

wire[3:0] out5;

shift_add_3 S5(
in5,
out5
);

wire[3:0] in6;
assign {in6[0]} = out5[3];
assign {in6[3:1]} = out4[2:0];

wire[3:0] out6;

shift_add_3 S6(
in6,
out6
);

wire[3:0] in7;
assign {in7[0]} = bin[1];
assign {in7[3:1]} = out5[2:0];

wire[3:0] out7;

shift_add_3 S7(
in7,
out7
);

assign {Ones[0]} = bin[0];
assign {Ones[3:1]} = out7[2:0];

assign {Tens[0]} = out7[3];
assign {Tens[3:1]} = out6[2:0];

assign {Hundreds[0]} = out6[3];
assign {Hundreds[1]} = out4[3];
assign {Hundreds[3:2]} = 0;

endmodule

/* ANOTHER WAY USING LOOPS AND THE ALWAYS BLOCK
module binary_to_BCD (
input[7:0] BinaryResult,
output reg [3:0] Ones,
output reg [3:0] Tens,
output reg [3:0] Hundreds
);

//index
integer i;

always @(BinaryResult)
begin
  // Set initial values
  Ones = 0;
  Tens = 0;
  Hundreds = 0;
  // Loop over all 8 bits until they are all shifted
  for (i = 7; i >= 0; i = i - 1) 
  begin
    // Check if any of the values exceeded 4
    // If yes, add 3
    if (Ones[3:0] > 4)
    begin
      Ones[3:0] = Ones[3:0] + 3;
    end

    if (Tens[3:0] > 4)
    begin
      Tens[3:0] = Tens[3:0] + 3;
    end

    if (Hundreds[3:0] > 4)
    begin
      Hundreds[3:0] = Hundreds[3:0] + 3;
    end

    // Shift Ones, Tens & Hundreds by 1
    // And set the first bit of each to the previous one
    Hundreds[3:1] = Hundreds[2:0];
    Hundreds[0] = Tens[3];

    Tens[3:1] = Tens[2:0];
    Tens[0] = Ones[3];

    Ones[3:1] = Ones[2:0];
    Ones[0] = BinaryResult[i];
    end
end
endmodule
*/