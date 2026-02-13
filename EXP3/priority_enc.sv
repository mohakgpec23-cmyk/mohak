
module priority_enc(
  input logic [3:0] in,
  output logic [1:0] out,
  output logic valid
);
  always_comb begin
    valid = 1;

    casez(in)
      4'b1???: out = 2'b11; 
      4'b01??: out = 2'b10;
      4'b001?: out = 2'b01;
      4'b0001: out = 2'b00;
      default: begin 
        out = 2'b00; 
        valid = 0;
      end
    endcase
  end
endmodule
