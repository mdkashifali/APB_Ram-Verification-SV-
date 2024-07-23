interface abp_if;
  
  logic preset;
  logic clk;
  logic psel;
  logic penable;
  logic pwrite;
  logic [31:0] padr, pwdata;
  logic [31:0] prdata;
  logic pready, pslverr;  
  
endinterface
