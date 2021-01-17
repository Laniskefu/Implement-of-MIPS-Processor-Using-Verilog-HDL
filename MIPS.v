module MIPS(clk, rst); 
  input clk, rst; 
  // IFU
  wire [31:0] pc, ins; 
  // latch 1
  wire [31:0] pc1, ins1; 
  // ID, CU, RF, EXT
  wire [5:0] op; 
  wire [4:0] rs, rt, rd, shamt; 
  wire [5:0] funct; 
  wire [15:0] imm; 
  wire RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, jmp; 
  wire [1:0] ALUctr; 
  wire [4:0] RW; 
  wire [31:0] busA, busB; 
  wire [31:0] Ext_out; 
  // latch 2
  wire [31:0] pc2; 
  wire ALUSrc2, MemtoReg2, RegWrite2, MemWrite2, nPC_sel2, jmp2; 
  wire [1:0] ALUctr2; 
  wire [31:0] busA2, busB2; 
  wire [31:0] Ext_out2; 
  wire [4:0] RW2; 
  // ALU ADDER
  wire [31:0] B; 
  wire [31:0] ALU_out; 
  wire zero; 
  wire [31:0] JUMPER_out; 
  // latch 3
  wire MemtoReg3, RegWrite3, MemWrite3, nPC_sel3, jmp3; 
  wire [31:0] JUMPER_out3; 
  wire [31:0] ALU_out3; 
  wire zero3; 
  wire [31:0] busB3; 
  wire [31:0] Ext_out3; 
  wire [4:0] RW3; 
  // DM
  wire [31:0] Data_out; 
  // latch 4
  wire MemtoReg4, RegWrite4; 
  wire [31:0] Data_out4; 
  wire [31:0] ALU_out4; 
  wire [4:0] RW4; 
  // MUL
  wire [31:0] busW; 
 
  // process 1
  IFU ifu(pc, ins, clk, rst, nPC_sel3, zero3, jmp3, JUMPER_out3, Ext_out3); 
  // latch 1
  IF_ID latch1(pc1, ins1, clk, rst, pc, ins); 
  // process 2
  ID id(op, rs, rt, rd, shamt, funct, imm, ins1); 
  CU cu(RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, jmp, ALUctr, op, funct); 
  MUX5 m1(RW, rd, rt, RegDst); 
  RF rf(busA, busB, clk, rst, RegWrite4, busW, RW4, rs, rt); 
  EXT ext(Ext_out, imm, ExtOp); 
  // latch 2
  ID_EX latch2(pc2, ALUSrc2,MemtoReg2,RegWrite2,MemWrite2,nPC_sel2,jmp2,ALUctr2,busA2,busB2,Ext_out2,RW2,
       clk,rst,pc1, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, jmp, ALUctr, busA, busB, Ext_out, RW); 
  // process 3
  MUX32 m2(B, Ext_out2, busB2, ALUSrc2); 
  ALU alu(ALU_out, zero, busA2, B, ALUctr2); 
  JUMPER jumper(JUMPER_out, pc2, Ext_out2); 
  // latch 3
  EX_MEM latch3(MemtoReg3,RegWrite3,MemWrite3,nPC_sel3,jmp3,JUMPER_out3,ALU_out3,zero3,busB3,Ext_out3,RW3,
      clk,rst,MemtoReg2,RegWrite2,MemWrite2,nPC_sel2,jmp2,JUMPER_out, ALU_out, zero, busB2,Ext_out2,RW2); 
  // process 4
  DM dm(Data_out, clk, rst, MemWrite3, busB3, ALU_out3); 
  // latch 4
  MEM_WB latch4(MemtoReg4,RegWrite4,Data_out4,ALU_out4,RW4,
        clk,rst,MemtoReg3,RegWrite3,Data_out, ALU_out3,RW3); 
  // process 5
  MUX32 m3(busW, Data_out4, ALU_out4, MemtoReg4); 

endmodule
