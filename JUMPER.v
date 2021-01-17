module JUMPER(JUMPER_out, pc2, Ext_out2); 
  output [31:0] JUMPER_out; 
  input [31:0] pc2; 
  input [31:0] Ext_out2; 

  assign JUMPER_out = {pc2[31:28], Ext_out2[25:0], 2'b00}; 

endmodule
