module testbench;
	reg [31:0] instruction;
	initial begin
		$display("Time: %5d, Instruction: %d (Decimal), %b (Binary), %h (Hex)", $time, instruction, instruction, instruction);
		#10 instruction = 10;
		$display("Time: %5d, Instruction: %d (Decimal), %b (Binary), %h (Hex)", $time, instruction, instruction, instruction);
		#20 instruction = 20;
		$display("Time: %5d, Instruction: %d (Decimal), %b (Binary), %h (Hex)", $time, instruction, instruction, instruction);
		#30 instruction = 30;
		$display("Time: %5d, Instruction: %d (Decimal), %b (Binary), %h (Hex)", $time, instruction, instruction, instruction);
		$finish;
	end
endmodule
