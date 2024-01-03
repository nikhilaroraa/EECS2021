module testbench;
	reg [31:0] instruction;
	initial begin
		$display("Time: ", $time, ", Instruction: ", instruction);
		#10 instruction = 10;
		$display("Time: %5d", $time, ", Instruction: %16h", instruction);
		#20 instruction = 20;
		$display("Time: %5d", $time, ", Instruction: %16h", instruction);
		#30 instruction = 30;
		$display("Time: %5d", $time, ", Instruction: %16h", instruction);
		$finish;
	end
endmodule
