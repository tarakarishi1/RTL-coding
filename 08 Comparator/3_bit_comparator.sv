module comparator_tb();
    logic [2:0] in1, in2;
    logic lesser, equal, greater;

    comparator dut(in1,in2,lesser, equal, greater);

    initial begin
        repeat(20) begin
        in1 = $urandom_range(0,7);
        in2 = $urandom_range(0,7);
        #20;
        end
    end

    initial begin
        $monitor($time, "| in1: %d | in2: %d | lesser: %b | equal: %b | greater: %b", in1, in2, lesser, equal, greater);
    end



endmodule