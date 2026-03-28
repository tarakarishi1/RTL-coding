//This should be run in EDA playground with the UVM 1.2


`include "uvm_macros.svh"  /// uvm_info
import uvm_pkg::*;

module tb;
    initial begin
        `uvm_info("TB_YOP", "Hello World", UVM_LOW);
        $display("Hello world with display";)
    end
endmodule