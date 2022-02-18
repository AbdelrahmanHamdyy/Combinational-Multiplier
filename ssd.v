module BCDTo7Seg (
input[3:0] bcd,
output[6:0] seg
);

assign {seg} = 
(bcd == 0) ? 7'b1000000 :
(bcd == 1) ? 7'b1111001 :
(bcd == 2) ? 7'b0100100 :
(bcd == 3) ? 7'b0110000 :
(bcd == 4) ? 7'b0011001 :
(bcd == 5) ? 7'b0010010 :
(bcd == 6) ? 7'b0000010 :
(bcd == 7) ? 7'b1111000 :
(bcd == 8) ? 7'b0000000 :
(bcd == 9) ? 7'b0010000 : 7'b1111111;

endmodule
