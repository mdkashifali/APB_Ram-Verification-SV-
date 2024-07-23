class monitor;
  virtual abp_if vif;
  mailbox #(transaction) mbx;
  transaction tr;
 
  
 
 
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;     
  endfunction;
  
  task run();
    tr = new();
    forever begin
      @(posedge vif.clk);
      if((vif.psel) && (!vif.penable)) 
        begin
          @(posedge vif.clk);
          if(vif.psel && vif.pwrite && vif.penable) ////write access
            begin
              @(posedge vif.clk);  
              tr.pwdata = vif.pwdata;
        	  tr.padr = vif.padr;
        	  tr.pwrite = vif.pwrite;
              tr.pslverr = vif.pslverr;
              $display("[MON] : DATA WRITE data : %0d and addr : %0d write :%0b", vif.pwdata, vif.padr, vif.pwrite);
              @(posedge vif.clk);
         	end ////write access
          else if (vif.psel && !vif.pwrite && vif.penable)
            begin
              @(posedge vif.clk);
              tr.prdata = vif.prdata;
         	  tr.pwrite = vif.pwrite;
        	  tr.padr = vif.padr;
              tr.pslverr = vif.pslverr;
              @(posedge vif.clk);
              $display("[MON] : DATA READ data : %0d and addr : %0d write:%0b", vif.prdata,vif.padr, vif.pwrite);
            end
          mbx.put(tr);
        end
    end
  endtask
endclass
