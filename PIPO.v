module PIPO(din,dout,ld,clr,clk);
  
  input [15:0] din;
  input ld;
  input clr;
  input clk;
  output reg [15:0] dout;
  
  always@(posedge clk) begin
    if(clr)
      dout<=0;
    else if (ld)
      dout<=din;
  end
endmodule
