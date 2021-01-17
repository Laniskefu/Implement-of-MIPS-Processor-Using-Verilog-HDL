module IF_ID(pc1, ins1, clk, rst, pc, ins); 
  output reg [31:0] pc1; 
  output reg [31:0] ins1; 
  input clk, rst; 
  input [31:0] pc; 
  input [31:0] ins; 

  always@(posedge clk, posedge rst)
  begin
    if(rst)
    begin
      pc1 <= 0; 
      ins1 <= 0; 
    end
    else if(clk)
    begin
      pc1 <= pc; 
      ins1 <= ins; 
    end
  end

endmodule
