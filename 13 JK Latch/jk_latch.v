module jk_latch(
    input J,K,
    output reg Q,Qn
);
    always @(*) begin
        if ({J,K} == 2'b00)
        {Q,Qn} = {Q,Qn};
        else if ({J,K} == 2'b01)
        {Q,Qn} = 2'b01;
        else if ({J,K} == 2'b10)
        {Q,Qn} = 2'b10;
        else if ({J,K} == 2'b11)
        {Q,Qn} = {Qn,Q};
    end
endmodule
