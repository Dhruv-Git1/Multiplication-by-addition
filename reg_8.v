module reg_B(din,dout,ld,dec,clk);
  input [15:0] din;
  input ld;
  input dec;
  input clk;
  output reg [15:0] dout;
  
  always@(posedge clk) begin
    if(ld)
      dout<=din;
    else if(dec)
      dout <= dout - 1;
  end
endmodule
