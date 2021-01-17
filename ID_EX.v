module ID_EX(pc2, ALUSrc2,MemtoReg2,RegWrite2,MemWrite2,nPC_sel2,jmp2,ALUctr2,busA2,busB2,Ext_out2,RW2,
     clk,rst,pc1, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, jmp, ALUctr, busA, busB, Ext_out, RW);
  output reg [31:0] pc2; 
  output reg ALUSrc2, MemtoReg2, RegWrite2, MemWrite2, nPC_sel2, jmp2; 
  output reg [1:0] ALUctr2; 
  output reg [31:0] busA2, busB2; 
  output reg [31:0] Ext_out2; 
  output reg [4:0] RW2; 
  input clk, rst; 
  input [31:0] pc1; 
  input ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, jmp; 
  input [1:0] ALUctr; 
  input [31:0] busA, busB; 
  input [31:0] Ext_out; 
  input [4:0] RW; 

  always@(posedge clk, posedge rst)
  begin
    if(rst)
    begin
      pc2 <= 0; 
      ALUSrc2 <= 0; 
      MemtoReg2 <= 0; 
      RegWrite2 <= 0; 
      MemWrite2 <= 0; 
      nPC_sel2 <= 0; 
      jmp2 <= 0; 
      ALUctr2 <= 0; 
      busA2 <= 0; 
      busB2 <= 0; 
      Ext_out2 <= 0; 
      RW2 <= 0; 
    end
    else if(clk)
    begin
      pc2 <= pc1; 
      ALUSrc2 <= ALUSrc; 
      MemtoReg2 <= MemtoReg; 
      RegWrite2 <= RegWrite; 
      MemWrite2 <= MemWrite; 
      nPC_sel2 <= nPC_sel; 
      jmp2 <= jmp; 
      ALUctr2 <= ALUctr; 
      busA2 <= busA; 
      busB2 <= busB; 
      Ext_out2 <= Ext_out; 
      RW2 <= RW; 
    end
  end

endmodule
