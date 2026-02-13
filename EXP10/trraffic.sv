

package traffic_pkg;
  typedef enum bit [1:0] {RED, GREEN, YELLOW} light_t;
endpackage

import traffic_pkg::*;

module traffic(
  input logic clk, rst,
  output light_t colour
);
  
  always_ff @(posedge clk) begin
    if(rst)
      colour <= RED;
    else
      case(colour)
        RED:    colour <= GREEN;
        GREEN:  colour <= YELLOW;
        YELLOW: colour <= RED;
        default: colour <= RED;
      endcase
  end
endmodule
