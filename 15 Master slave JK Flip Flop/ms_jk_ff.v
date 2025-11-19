// module ms_jk_ff(
//     input clk,
//     input J,K,
//     output reg Q,Qn
// );
//     reg Qm,Qmn;
//     wire Js, Ks;
    
//     assign Js = Qm;
//     assign Ks = Qmn;

//     always @(posedge clk ) begin
//         case ({J,K})
//             2'b00: {Qm,Qmn} <= {Qm,Qmn};   // Hold state
//             2'b01: {Qm,Qmn} <= 2'b01;    // Reset
//             2'b10: {Qm,Qmn} <= 2'b10;    // Set
//             2'b11: {Qm,Qmn} <= {Qmn,Qm};    // Invalid
//         endcase
//     end

//     always @(negedge clk ) begin
//         case ({Js,Ks})
//             2'b00: {Q,Qn} <= {Q,Qn};   // Hold state
//             2'b01: {Q,Qn} <= 2'b01;    // Reset
//             2'b10: {Q,Qn} <= 2'b10;    // Set
//             2'b11: {Q,Qn} <= {Qn,Q};    // Invalid
//         endcase
//     end
// endmodule

module ms_jk_ff(
    input       clk,
    input       J,
    input       K,
    output reg  Q,
    output reg  Qn
);

    reg Qm, Qmn;  // master outputs

    // MASTER: posedge
    always @(posedge clk) begin
        case ({J,K})
            2'b01: {Qm, Qmn} <= 2'b01;        // Reset
            2'b10: {Qm, Qmn} <= 2'b10;        // Set
            2'b11: {Qm, Qmn} <= {Qmn, Qm};    // Toggle
            // 2'b00: hold
        endcase
    end

    // SLAVE: negedge
    always @(negedge clk) begin
        {Q, Qn} <= {Qm, Qmn};                 // Since we know that Qm != Qmn, we do not have to worry like before
    end
endmodule