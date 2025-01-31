`include "mux.v"
`include "PIPO.v"
`include "ADDER.v"
`include "reg_B.v"
`include "EQUAL.v"

module datapath (data_in,ldA,ldB,ldP,clrA,clrP,decB,sel,clk,eq);
  input ldA,ldB,ldP,clrA,clrP,decB,clk,sel;
  input [15:0] data_in;
  output reg eq;
  
  wire [15:0] X,Y,Z,Bout,Bus;
  
  mux M (data_in,Bus,sel);
  PIPO A(Bus,X,ldA,clrA,clk);
  PIPO P(Z,Y,ldP,clrP,clk);
  ADDER ADD(X,Y,Z);
  reg_B regB(Bus,Bout,ldB,decB,clk);
  EQUAL eqz(Bout,eq);
  
endmodule
