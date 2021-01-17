module RF(busA, busB, clk, rst, RegWrite, busW, RW, RA, RB); 
  output [31:0] busA, busB; 
  input clk, rst, RegWrite; 
  input [31:0] busW; 
  input [4:0] RW, RA, RB; 
  reg [31:0] GPR[31:0]; 
  integer i; 

  always @(posedge clk, posedge rst)
  begin
    if(rst) for(i=0; i!=32; i=i+1) GPR[i] = 0; 
    else if(RegWrite==1) GPR[RW] = (RW!=0) ? busW : 0; 
  end

  assign busA = GPR[RA]; 
  assign busB = GPR[RB]; 

endmodule
