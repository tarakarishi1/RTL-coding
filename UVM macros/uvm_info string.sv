//This should be run in EDA playground with the UVM 1.2


`include "uvm_macros.svh"  /// uvm_info
import uvm_pkg::*;

module tb;

    int data = 56;

    initial begin

        `uvm_info("TB_TOP",$sformatf("Value of a variable : %0d", data) , UVM_NONE);
        $display("Hello world with display";)
    end
endmodule

