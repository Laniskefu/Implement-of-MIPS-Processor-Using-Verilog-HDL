module ID(op, rs, rt, rd, shamt, funct, imm, ins); 
  output [5:0] op; 
  output [4:0] rs, rt, rd, shamt; 
  output [5:0] funct; 
  output [15:0] imm; 
  input [31:0] ins; 


  assign op = {ins[31:26]}; 
  assign rs = {ins[25:21]}; 
  assign rt = {ins[20:16]}; 
  assign rd = {ins[15:11]}; 
  assign shamt = {ins[10:6]}; 
  assign funct = {ins[5:0]}; 
  assign imm = {ins[15:0]}; 

endmodule