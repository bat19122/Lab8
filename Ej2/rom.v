
module rom (add, lo, Lect, ce);
input [7:0] add;
output [7:0] lo;
input Lect;
input ce;


reg [7:0]    mem [0:3999] ;
integer file_pointer;

assign lo = (ce && Lect) ? mem[add] : 8'b0;

integer x;

initial begin
  $readmemb("Ej2.list",mem);
end


endmodule
