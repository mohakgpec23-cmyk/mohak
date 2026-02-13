

module digital_clock(
  input logic clk,
  input logic rst,
  output logic [5:0] sec,
  output logic [5:0] min
);

  // Seconds Logic
  always_ff @(posedge clk) begin
    if (rst) 
      sec <= 0;
    else if (sec == 59)
      sec <= 0;
    else
      sec <= sec + 1;
  end

  // Minutes Logic
  always_ff @(posedge clk) begin
    if (rst) begin
      min <= 0;
    end else if (sec == 59) begin
      if (min == 59)
        min <= 0;
      else
        min <= min + 1;
    end
  end

endmodule
