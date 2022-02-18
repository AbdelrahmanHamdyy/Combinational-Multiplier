`include "mult_integrated.v"
module mult_integrated_tb();

reg[3:0] Input1;
reg[3:0] Input2;
wire[6:0] seg1;
wire[6:0] seg2;
wire[6:0] seg3;

integer i;
integer j;

initial begin
   $monitor("%d*%d=%b|%b|%b",Input1,Input2,seg3,seg2,seg1);
   Input1 = 0;
   Input2 = 0;
   for(i = 0; i < 16; i = i + 1)
   begin
     for(j = 0; j < 16; j = j + 1)
     begin
       #1 Input1 = i;
       Input2 = j;
     end
   end
end

mult_integrated mult(
Input1,
Input2,
seg1,
seg2,
seg3
 );
endmodule
