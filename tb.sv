module tb;
    
  abp_if vif();
 
  apb_ram dut (vif.preset, vif.clk, vif.psel, vif.penable, vif.pwrite, vif.padr, vif.pwdata, vif.prdata, vif.pready,vif.pslverr);
   
    initial begin
      vif.clk <= 0;
    end
    
    always #10 vif.clk <= ~vif.clk;
    
    environment env;
    
    initial begin
      env = new(vif);
      env.gen.count = 30;
      env.run();
    end

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  endmodule
