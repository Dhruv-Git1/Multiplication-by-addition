`include "controller.v"
`include "datapath.v"

module tb;
  reg [15:0] data_in;
  reg clk,start;
  wire done;
  wire ldA,ldB,ldP,clrA,clrP,decB,sel,eq;
  
  datapath DP (data_in,ldA,ldB,ldP,clrA,clrP,decB,sel,clk,eq);
  controller CN (ldA,ldB,ldP,clrA,clrP,decB,sel,clk,eq,start,done); 
  
 initial begin
   clk = 1'b0;
   #3 start = 1'b1;
   #1000 $finish;
 end
  
  always #5 clk = ~clk ;
  
  initial begin
    #17 data_in = 69;
    #10 data_in = 9;
  end
  
  initial begin
    $monitor($time," state = %b,  eq=%b ,   Z= %d,   Y= %d,     X=%d,    Bout=%d      done=%b",CN.state,DP.eq,DP.Z,DP.Y,DP.X,DP.Bout,done);
    $dumpfile("mul.vcd");
    $dumpvars(1,tb);
  end
  
endmodule
  
