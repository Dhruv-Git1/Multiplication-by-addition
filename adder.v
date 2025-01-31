module ADDER(in1,in2,out);
  input [15:0] in1,in2;
  output reg [15:0] out;
  
  assign out = in1+in2;
  
endmodule
