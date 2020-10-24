module testbench ();
reg clk, en, lo, rst;
reg [11:0]In;
wire [11:0]Ou;

  cnt c1(clk, en, lo, rst, In, Ou);

  always begin
    clk = 1;
    #1 clk<=~clk;
  end
  initial begin

    $display("Contador");
    $display("clk rst | load enable In | Ou");
    $display("------------------------------");
    $monitor("%b %b | %b %b %b | %b", clk, rst, lo, en, In, Ou);
  end

  initial begin

    rst = 0; en=0; lo=0; In = 1001;
    #5 lo = 1;
    #10 en = 1; lo = 0;
    #15 lo = 1;
    #20 rst = 1; en=0; lo=0;
    #25 lo = 1;
    #30 en = 1; lo = 0;
    #35 lo = 1;

  end

  initial
    #50 $finish;
  initial begin
    $dumpfile("cnt_tb.vcd");
    $dumpvars(0,testbench);
  end
endmodule
