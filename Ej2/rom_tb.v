module rom_tb;
 reg [7:0] add;
 reg Lect, ce;
 wire [7:0] lo;
 integer x;

 initial begin
   add = 0;
   Lect = 0;
   ce      = 0;
   #10 $display ("Valor entrada | Valor cargado | Lectura activada | Chip activado | iteración");
      $monitor("%b | %b | %b | %b | %d", add, lo, Lect, ce, x);

   for (x = 0; x <3999; x = x +1 )begin
     #5 add = x;
     Lect = 1;
     ce = 1;
     #5 Lect = 0;
     ce = 0;
     add = 0;
   end
 end

rom U(add, lo, Lect,ce);

initial
  #500000 $finish;
initial begin
  $dumpfile("rom_tb.vcd");
  $dumpvars(0, rom_tb);
end

endmodule
