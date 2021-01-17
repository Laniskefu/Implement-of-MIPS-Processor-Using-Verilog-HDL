module MIPS_test; 
  reg clk, rst; 
  
  MIPS cpu(clk, rst); 
  
  initial
  begin
    clk = 1; rst = 0;
    #5 rst = 1; 
    #5 rst = 0; 
    $readmemh("pipeline1.txt", cpu.ifu.IM); 
  end

  always #50 clk = ~clk; 

endmodule
