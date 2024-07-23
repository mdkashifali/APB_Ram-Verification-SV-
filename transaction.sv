class transaction;
  
  typedef enum int {write = 0, read = 1, random = 2, error = 3} op_type;
  
  randc op_type oper ;
  rand bit [31:0] padr;
  rand bit [31:0] pwdata;
  rand bit psel;
  rand bit penable;
  rand bit pwrite;
  bit [31:0] prdata;
  bit pready;
  bit pslverr;
  
 
  
  constraint addr_c {
  padr > 1; padr < 5;////2 3 4
  }
  
  constraint data_c {
  pwdata > 1; pwdata < 10; /// 2-9
  }
  
  function void display(input string tag);
    $display("[%0s] : OP:%0s  padr:%0d  pwdata:%0d  psel:%0b  penable:%0b  pwrite:%0b  prdata:%0d  pready:%0b  pslverr:%0b",tag,oper.name(),padr,pwdata,psel, penable, pwrite, prdata, pready, pslverr);
  endfunction
  
  function transaction copy();
    copy = new();
    copy.oper = this.oper;
    copy.padr = this.padr;
    copy.pwdata = this.pwdata;
    copy.psel = this.psel;
    copy.penable = this.penable;
    copy.pwrite = this.pwrite;
    copy.prdata = this.prdata;
    copy.pready = this.pready;
    copy.pslverr = this.pslverr;
  endfunction
  
  
endclass
