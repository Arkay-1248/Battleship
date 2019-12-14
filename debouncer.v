/*
Borrowed from the given portion of Peter Jamieson's ECE 287 Final Exam 

*/
module debounce_DE2_SW (clk, rst_n, SW, SWO);
input rst_n, clk;
input [9:0]SW;
output [9:0]SWO;
wire [9:0]SWO;

debouncer sw0(clk, rst_n, SW[0], SWO[0]);
debouncer sw1(clk, rst_n, SW[1], SWO[1]);
debouncer sw2(clk, rst_n, SW[2], SWO[2]);
debouncer sw3(clk, rst_n, SW[3], SWO[3]);
debouncer sw4(clk, rst_n, SW[4], SWO[4]);
debouncer sw5(clk, rst_n, SW[5], SWO[5]);
debouncer sw6(clk, rst_n, SW[6], SWO[6]);
debouncer sw7(clk, rst_n, SW[7], SWO[7]);
debouncer sw8(clk, rst_n, SW[8], SWO[8]);
debouncer sw9(clk, rst_n, SW[9], SWO[9]);

endmodule

module debouncer (clk, rst_n, noisy, clean);
input rst_n, clk, noisy;
output clean;
   
reg xnew, clean;

reg [19:0] b_counter;
reg [1:0] S, NS;

parameter 	ON=		2'd0, 
				ON_2_OFF=	2'd1, 
				OFF=		2'd2, 
				OFF_2_ON=	2'd3;

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
		S <= OFF;
	else
		S <= NS;
end				

always @(*)
begin
	case(S)
		OFF:
		begin
			if (noisy == 1'b1)
				NS = OFF_2_ON;
			else
				NS = OFF;
		end
		ON:
		begin
			if (noisy == 1'b0)
				NS = ON_2_OFF;
			else
				NS = ON;
		end
		OFF_2_ON:
		begin
			if (b_counter >= 20'd1000)
				NS = ON;
			else if (noisy == 1'b0)
				NS = OFF;
			else
				NS = OFF_2_ON;
		end
		ON_2_OFF:
		begin
			if (b_counter >= 20'd1000)
				NS = OFF;
			else if (noisy == 1'b1)
				NS = ON;
			else
				NS = ON_2_OFF;
		end
	endcase
end

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		b_counter <= 20'd0;
		clean <= 1'b0;
	end
	else 
	begin
		case (S)
			ON:
			begin
				b_counter <= 20'd0;
				clean <= 1'b1;
			end
			OFF:
			begin
				b_counter <= 20'd0;
				clean <= 1'b0;
			end
			ON_2_OFF:
			begin
				b_counter <= b_counter + 1'b1;
				clean <= 1'b1;
			end
			OFF_2_ON:
			begin
				b_counter <= b_counter + 1'b1;
				clean <= 1'b0;
			end
		endcase
	end
end
	
endmodule
