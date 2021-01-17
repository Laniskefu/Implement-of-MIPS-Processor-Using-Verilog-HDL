module MEM_WB(MemtoReg4,RegWrite4,Data_out4,ALU_out4,RW4,
      clk,rst,MemtoReg3,RegWrite3,Data_out, ALU_out3,RW3); 
  output reg MemtoReg4, RegWrite4; 
  output reg [31:0] Data_out4; 
  output reg [31:0] ALU_out4; 
  output reg [4:0] RW4; 
  input clk, rst; 
  input MemtoReg3, RegWrite3; 
  input [31:0] Data_out; 
  input [31:0] ALU_out3; 
  input [4:0] RW3; 

  always@(posedge clk, posedge rst)
  begin
    if(rst)
    begin
      MemtoReg4 <= 0; 
      RegWrite4 <= 0; 
      Data_out4 <= 0; 
      ALU_out4 <= 0; 
      RW4 <= 0; 
    end
    else if(clk)
    begin
      MemtoReg4 <= MemtoReg3; 
      RegWrite4 <= RegWrite3; 
      Data_out4 <= Data_out; 
      ALU_out4 <= ALU_out3; 
      RW4 <= RW3; 
    end
  end

endmodule
