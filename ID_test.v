module ID_test; 
  wire [5:0] opcode; 
  wire [4:0] rs, rt, rd, shamt; 
  wire [5:0] funct; 
  wire [15:0] imm; 
  wire [31:0] ins; 
  reg clk, rst, nPC_sel, zero, jmp; 

  IFU IFU1(ins, clk, rst, nPC_sel, zero, jmp); 
  ID ID1(opcode, rs, rt, rd, shamt, funct, imm, ins); 

  initial
  begin
    clk = 1; rst = 0; nPC_sel = 0; zero = 0; jmp = 0; 
    #5 rst = 1; 
    #5 rst = 0; 
    $readmemh("code.txt", IFU1.IM); 
  end

  always #50 clk = ~clk; 
endmodule
