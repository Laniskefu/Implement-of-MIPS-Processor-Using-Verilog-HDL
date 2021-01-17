module EXT(Ext_out, imm, ExtOp); 
  output [31:0] Ext_out; 
  input [15:0] imm; 
  input ExtOp; 

  assign Ext_out = {{16{imm[15]&ExtOp}}, imm}; 

endmodule
