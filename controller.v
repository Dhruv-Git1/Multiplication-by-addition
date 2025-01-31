module controller (ldA,ldB,ldP,clrA,clrP,decB,sel,clk,eq,start,done);
  input start,clk,eq;
  output reg ldA,ldB,ldP,clrA,clrP,decB,sel,done;
  
  reg[2:0] state,next_state;
  parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
  
  always@(posedge clk)
    state<=next_state;
  
  always@(*) begin
    case(state)
      S0: next_state =(start)?S1:S0;
      S1: next_state = S2; 
      S2: next_state = S3;
      S3: #2 next_state = (eq)?S4:S3;
      S4: next_state = S4;
      default: next_state = S0;
    endcase
  end
  
  always@(*) begin
    case (state)
      S0: begin #1 ldA = 0; ldB=0;ldP=0;clrA=1'b1;clrP=0;sel=0;decB=0; end //000
      S1: begin #1 sel = 1'b1; ldA=1'b1; clrA=0; end    ///001
      S2: begin  #1 sel = 1'b1;ldA=0;ldB=1'b1;clrP=1'b1; end //010
      S3: begin   sel = 0;ldB=0;clrP=0;ldP=1'b1;decB=1'b1;done=0; end //011
      S4: begin  #1 done= 1'b1;ldP=0;decB=0;ldB=0; end   //100
      
      default: begin  ldA = 0; ldB=0;ldP=0;clrA=1;clrP=0;sel=0;decB=0; end
    endcase
  end
endmodule
  
