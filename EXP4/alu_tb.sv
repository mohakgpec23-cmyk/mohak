

`timescale 1ns/1ps

import defs_pkg::*;

module tb;
  logic [7:0] a, b, y;
  opcode_e op;
  alu dut(.*);
  
  covergroup cg_alu;
    cp_op: coverpoint op;
  endgroup

  //Declare handle 'cg'
  cg_alu cg; 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    //Instantiate inside initial block
    cg = new(); 
    
    repeat(50) begin
      a = $urandom(); 
      b = $urandom();
      // Cast the random integer to the enum type
      op = opcode_e'($urandom_range(0, 3));
      
      #5; 
      //Now 'cg' matches the handle name
      cg.sample(); 
    end
    $display("Coverage: %0.2f %%", cg.get_inst_coverage());
  end
endmodule
