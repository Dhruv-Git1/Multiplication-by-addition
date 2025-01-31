module mux(in,out,sel);
  input [15:0] in;
  input sel;
  output reg [15:0] out;
  
  assign out = sel?in:16'b0;
  
endmodule
  
