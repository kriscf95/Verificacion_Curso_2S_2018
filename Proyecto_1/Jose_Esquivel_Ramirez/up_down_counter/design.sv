module up_down_counter(
  count,
  up_down,
  clk,
  rst
);

  output[7:0] count;

  input up_down, clk, rst;
  
  reg[7:0] count;
  
  always @(posedge clk)
    if(rst) begin
      count <= 8'b0;
    end else if (up_down) begin
      count <= count + 1;
    end else begin
      count <= count - 1;
    end
  
endmodule