module IFU(pc, ins, clk, rst, nPC_sel3, zero3, jmp3, JUMPER_out3, Ext_out3); 
  output reg [31:0] pc; 
  output [31:0] ins; 
  input clk, rst, nPC_sel3, zero3, jmp3; 
  input [31:0] JUMPER_out3; 
  input [31:0] Ext_out3; 

  reg [7:0] IM[1023:0]; 
  wire [31:0] pc_n; 
  wire [15:0] imm; 
  
  assign ins = {IM[pc[9:0]],IM[pc[9:0]+1],IM[pc[9:0]+2],IM[pc[9:0]+3]}; 
  assign imm = Ext_out3[15:0]; 
  assign pc_n = pc+4; 

  always @(posedge clk, posedge rst)
  begin
    if(rst) pc <= 32'h0000_3000; 
    else if(nPC_sel3&&zero3) pc <= ({{16{imm[15]}},imm}<<2)+pc_n; 
    else if(jmp3) pc <= JUMPER_out3; 
    else pc <= pc_n; 
  end

endmodule
