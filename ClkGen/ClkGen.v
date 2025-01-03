module ClkGen #(
	parameter times = 12
)(
	input clkFast,
	input reset_n,

	output reg clkSlow
);

integer count;

always @(posedge clkFast or negedge reset_n) begin
	if (~reset_n) begin
		count <= 0;
		clkSlow <= 0;
	end
	else begin
		count <= (count + 1) % times;
		if (count == 0) begin
			clkSlow <= ~clkSlow;
		end
	end
end

endmodule

