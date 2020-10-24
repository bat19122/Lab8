module cnt(input wire clk, en, lo, rst,
          input wire [11:0]In,
          output reg [11:0]Ou);

initial Ou = 0;
always @(posedge clk) begin
  if (rst == 1) Ou <= 12'b0;
  else if (rst == 0) begin
    if (en == 1) begin
      if (lo == 1) Ou <= In;
      else Ou <= Ou + 1'b1;
    end else if (en == 0) Ou <= Ou;
  end
end
endmodule
