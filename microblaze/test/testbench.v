`timescale 1ns/100ps

module testbench;

   reg clk;
   reg reset_;
   wire [7:0] leds ;
   
   initial clk = 1;
   always #31.25 clk = ~clk ;

   initial begin
      $dumpfile("waveform.vcd");
      $dumpvars();
   end

   initial begin
      reset_ = 1;
      #10;
      reset_ = 0;
      #110;
      reset_ = 1;
      
      #50000;
      $finish;  
   end

   microblaze uut(
		  .clk(clk),
		  .reset_(reset_),
		  .led(leds)
		  );

   always@ (leds)
     $display ("LEDs changed state to %h at time %d ns", leds, $stime);
   
endmodule
