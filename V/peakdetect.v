/*
Rohan Krishna Ramkhumar, rxr353
resets peak when peak is output (senses peak)
*/

module peakdetect(
						input clk,
						input rst,
						input valid,
						input [11:0] data,
						output reg [11:0] peak
						);

reg [11:0] tmp;

always @(posedge clk)
	begin
		if (rst)
			begin
				peak = tmp;
				tmp = 0;
			end
		if (valid)
			begin
				if (data > tmp)
					tmp <= data;
			end
	end
endmodule
