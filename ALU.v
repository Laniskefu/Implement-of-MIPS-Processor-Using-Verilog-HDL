module ALU(ALU_out, zero, A, B, ALUctr); 
  output reg [31:0] ALU_out; 
  output reg zero; 
  input [31:0] A, B; 
  input [1:0] ALUctr; 

always @(*)
case(ALUctr)
    2'b00: ALU_out = A+B; // addu
    2'b01: ALU_out = A-B; // subu, beq
    2'b10: ALU_out = A|B; // ori
    2'b11: ALU_out = {B[15:0], 16'h0000}; // lui
endcase

always @(ALU_out) zero = ALU_out==0; 

endmodule
