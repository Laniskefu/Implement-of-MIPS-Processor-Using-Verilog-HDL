module CU(RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, jmp, ALUctr, op, funct); 
  output RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, jmp; 
  output [1:0] ALUctr; 
  input [5:0] op; 
  input [5:0] funct; 
  wire addu, subu, ori, lui, lw, sw, beq, j; 
  
  assign addu = op==6'b000000&&funct==6'b100001; 
  assign subu = op==6'b000000&&funct==6'b100011; 
  assign ori = op==6'b001101; 
  assign lui = op==6'b001111; 
  assign lw = op==6'b100011; 
  assign sw = op==6'b101011; 
  assign beq = op==6'b000100; 
  assign j = op==6'b000010; 

  assign RegDst = addu||subu; // R-format ins with rd
  assign ALUSrc = ori||lui||lw||sw; // I-format ins
  assign MemtoReg = lw; 
  assign RegWrite = addu||subu||ori||lui||lw; 
  assign MemWrite = sw; 
  assign nPC_sel = beq; 
  assign ExtOp = lw||sw; // I-format ins with signed-extended imm
  assign jmp = j; 
  assign ALUctr[1] = ori||lui; 
  assign ALUctr[0] = subu||lui||beq; 

endmodule
