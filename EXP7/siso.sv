

module siso(
  input clk, rst,
  input si,
  output logic so
);
  logic [3:0] q;
  
  assign so = q[3];
  
  always_ff @(posedge clk or posedge rst) begin
    if (rst) 
      q <= 4'b0000;
    else 
      q <= {q[2:0], si};
  end
endmodule
