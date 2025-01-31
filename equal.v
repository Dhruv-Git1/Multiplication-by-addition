
module EQUAL(in,out);
  input [15:0] in;
  output  out;
  
  assign out = (in==16'd1);
  
endmodule
