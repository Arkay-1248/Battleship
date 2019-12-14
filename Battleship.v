module Battleship(
    input 		CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input[9:0] SW,
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output reg [3:0] VGA_R,    // 4-bit VGA red output
    output reg [3:0] VGA_G,    // 4-bit VGA green output
    output reg [3:0] VGA_B,     // 4-bit VGA blue output
    output [6:0] HEX0, HEX1
	 );

	 assign RST_BTN = SW[9];	 // reset button
	 assign START = SW[8];
	 assign FIRE = SW[6];
	 
	 wire rst = ~RST_BTN;    // reset is active low for the vga640x480 module
	 
    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000

    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511

    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );


	wire box1, box2, box3, box4, box5, box6, box7, box8, box9, box10, box11, box12, box13, 
			box14, box15, box16, box17, box18, box19, box20, box21, box22, box23, box24, box25;
		
   assign box1	 	= ((x > 120) & (y > 160) & (x < 150) & (y < 190)) ? 1 : 0;
	assign box6 	= ((x > 120) & (y > 192) & (x < 150) & (y < 222)) ? 1 : 0;
	assign box11 	= ((x > 120) & (y > 224) & (x < 150) & (y < 254)) ? 1 : 0;
	assign box16 	= ((x > 120) & (y > 256) & (x < 150) & (y < 286)) ? 1 : 0;
	assign box21 	= ((x > 120) & (y > 288) & (x < 150) & (y < 316)) ? 1 : 0;
	
	assign box2 	= ((x > 152) & (y > 160) & (x < 182) & (y < 190)) ? 1 : 0;
	assign box7	 	= ((x > 152) & (y > 192) & (x < 182) & (y < 222)) ? 1 : 0;
	assign box12 	= ((x > 152) & (y > 224) & (x < 182) & (y < 254)) ? 1 : 0;
	assign box17 	= ((x > 152) & (y > 256) & (x < 182) & (y < 286)) ? 1 : 0;
   assign box22 	= ((x > 152) & (y > 288) & (x < 182) & (y < 316)) ? 1 : 0;
	
   assign box3 	= ((x > 184) & (y > 160) & (x < 214) & (y < 190)) ? 1 : 0;
	assign box8 	= ((x > 184) & (y > 192) & (x < 214) & (y < 222)) ? 1 : 0;
	assign box13 	= ((x > 184) & (y > 224) & (x < 214) & (y < 254)) ? 1 : 0;
	assign box18 	= ((x > 184) & (y > 256) & (x < 214) & (y < 286)) ? 1 : 0;
	assign box23 	= ((x > 184) & (y > 288) & (x < 214) & (y < 316)) ? 1 : 0;
	
	assign box4		= ((x > 216) & (y > 160) & (x < 246) & (y < 190)) ? 1 : 0;
	assign box9		= ((x > 216) & (y > 192) & (x < 246) & (y < 222)) ? 1 : 0;
	assign box14	= ((x > 216) & (y > 224) & (x < 246) & (y < 254)) ? 1 : 0;
	assign box19	= ((x > 216) & (y > 256) & (x < 246) & (y < 286)) ? 1 : 0;
	assign box24	= ((x > 216) & (y > 288) & (x < 246) & (y < 316)) ? 1 : 0;
	
	assign box5		= ((x > 248) & (y > 160) & (x < 278) & (y < 190)) ? 1 : 0;
	assign box10	= ((x > 248) & (y > 192) & (x < 278) & (y < 222)) ? 1 : 0;
	assign box15	= ((x > 248) & (y > 224) & (x < 278) & (y < 254)) ? 1 : 0;
	assign box20	= ((x > 248) & (y > 256) & (x < 278) & (y < 286)) ? 1 : 0;
	assign box25	= ((x > 248) & (y > 288) & (x < 278) & (y < 316)) ? 1 : 0;

		wire boxi1, boxi2, boxi3, boxi4, boxi5, boxi6, boxi7, boxi8, boxi9, boxi10, boxi11, boxi12, boxi13, 
		boxi14, boxi15, boxi16, boxi17, boxi18, boxi19, boxi20, boxi21, boxi22, boxi23, boxi24, boxi25;
		
   assign boxi1	= ((x > 320) & (y > 160) & (x < 350) & (y < 190)) ? 1 : 0;
	assign boxi6 	= ((x > 320) & (y > 192) & (x < 350) & (y < 222)) ? 1 : 0;
	assign boxi11 	= ((x > 320) & (y > 224) & (x < 350) & (y < 254)) ? 1 : 0;
	assign boxi16 	= ((x > 320) & (y > 256) & (x < 350) & (y < 286)) ? 1 : 0;
	assign boxi21 	= ((x > 320) & (y > 288) & (x < 350) & (y < 316)) ? 1 : 0;
	
	assign boxi2 	= ((x > 352) & (y > 160) & (x < 382) & (y < 190)) ? 1 : 0;
	assign boxi7	= ((x > 352) & (y > 192) & (x < 382) & (y < 222)) ? 1 : 0;
	assign boxi12 	= ((x > 352) & (y > 224) & (x < 382) & (y < 254)) ? 1 : 0;
	assign boxi17 	= ((x > 352) & (y > 256) & (x < 382) & (y < 286)) ? 1 : 0;
   assign boxi22 	= ((x > 352) & (y > 288) & (x < 382) & (y < 316)) ? 1 : 0;
	
   assign boxi3 	= ((x > 384) & (y > 160) & (x < 414) & (y < 190)) ? 1 : 0;
	assign boxi8 	= ((x > 384) & (y > 192) & (x < 414) & (y < 222)) ? 1 : 0;
	assign boxi13 	= ((x > 384) & (y > 224) & (x < 414) & (y < 254)) ? 1 : 0;
	assign boxi18 	= ((x > 384) & (y > 256) & (x < 414) & (y < 286)) ? 1 : 0;
	assign boxi23 	= ((x > 384) & (y > 288) & (x < 414) & (y < 316)) ? 1 : 0;
	
	assign boxi4	= ((x > 416) & (y > 160) & (x < 446) & (y < 190)) ? 1 : 0;
	assign boxi9	= ((x > 416) & (y > 192) & (x < 446) & (y < 222)) ? 1 : 0;
	assign boxi14	= ((x > 416) & (y > 224) & (x < 446) & (y < 254)) ? 1 : 0;
	assign boxi19	= ((x > 416) & (y > 256) & (x < 446) & (y < 286)) ? 1 : 0;
	assign boxi24	= ((x > 416) & (y > 288) & (x < 446) & (y < 316)) ? 1 : 0;
	
	assign boxi5	= ((x > 448) & (y > 160) & (x < 478) & (y < 190)) ? 1 : 0;
	assign boxi10	= ((x > 448) & (y > 192) & (x < 478) & (y < 222)) ? 1 : 0;
	assign boxi15	= ((x > 448) & (y > 224) & (x < 478) & (y < 254)) ? 1 : 0;
	assign boxi20	= ((x > 448) & (y > 256) & (x < 478) & (y < 286)) ? 1 : 0;
	assign boxi25	= ((x > 448) & (y > 288) & (x < 478) & (y < 316)) ? 1 : 0;

	wire startscreenS1, startscreenS2, startscreenS3, startscreenS4, startscreenS5, startscreenT1, 
	startscreent2, startscreenT3, startscreenT4, startscreenR1, startscreenR2, startscreenR3, startscreenR4, 
	startscreenA1, startscreenA2, startscreenA3, startscreenA4;
	
	assign startscreenS1 = ((x > 100) & (y > 160) & (x < 125) & (y < 240)) ? 1 : 0;
	assign startscreenS2 = ((x > 100) & (y > 160) & (x < 175) & (y < 190)) ? 1 : 0;
	assign startscreenS3 = ((x > 100) & (y > 210) & (x < 175) & (y < 240)) ? 1 : 0;
	assign startscreenS4 = ((x > 150) & (y > 210) & (x < 175) & (y < 290)) ? 1 : 0;
	assign startscreenS5 = ((x > 100) & (y > 260) & (x < 175) & (y < 290)) ? 1 : 0;
	
	assign startscreenT1 = ((x > 200) & (y > 160) & (x < 275) & (y < 190)) ? 1 : 0;
	assign startscreenT2 = ((x > 225) & (y > 160) & (x < 250) & (y < 290)) ? 1 : 0;
	
	assign startscreenA1  = ((x > 320) & (y > 160) & (x < 355) & (y < 190)) ? 1 : 0;
	assign startscreenA2  = ((x > 300) & (y > 210) & (x < 375) & (y < 240)) ? 1 : 0;
	assign startscreenA3  = ((x > 300) & (y > 180) & (x < 325) & (y < 290)) ? 1 : 0;
	assign startscreenA4  = ((x > 350) & (y > 180) & (x < 375) & (y < 290)) ? 1 : 0;
	
	assign startscreenR1  = ((x > 400) & (y > 160) & (x < 425) & (y < 290)) ? 1 : 0;
	assign startscreenR2  = ((x > 400) & (y > 160) & (x < 460) & (y < 190)) ? 1 : 0;
	assign startscreenR3  = ((x > 450) & (y > 180) & (x < 475) & (y < 290)) ? 1 : 0;
	assign startscreenR4  = ((x > 400) & (y > 210) & (x < 475) & (y < 240)) ? 1 : 0;
	
	assign startscreenT3  = ((x > 500) & (y > 160) & (x < 575) & (y < 190)) ? 1 : 0;
	assign startscreenT4  = ((x > 525) & (y > 160) & (x < 550) & (y < 290)) ? 1 : 0;

	
	wire vgastart, vgagame, vgaendgame, hit;
	reg [49:0] updatevgaboard;
	reg [3:0] sn1, sn2;
	reg  [4:0] hits1, hits2, shipplace1, shipplace2, board1, board2;
	wire [9:0] SWO;
	debounce_DE2_SW deb(CLOCK_50, rst, SW[9:0], SWO);
	lab_4 hex1(sn1[3],sn1[2],sn1[1],sn1[0],HEX0);
	lab_4 hex2(sn2[3],sn2[2],sn2[1],sn2[0],HEX1);
	
	reg [3:0] S,NS;
	
	initial sn1 = 4'b0;
	initial sn2 = 4'b0;
	
	parameter 
		start 		= 4'd0,
		p1select		= 4'd1,
		p2select		= 4'd2,
		p1shot		= 4'd3,
		miss1			= 4'd4,
		hit1			= 4'd5,
		p2shot		= 4'd6,
		miss2			= 4'd7,
		hit2			= 4'd8,
		p1win			= 4'd9,
		p2win 		= 4'd10,
		endgame		= 4'd11,
		p1placed		= 4'd12,
		p2placed		= 4'd13;
	
	always@(posedge CLK or negedge RST_BTN)
		begin
			if(!RST_BTN)
				S <= start;
			else 
				S <= NS;
		end
	
	always@(*)
		begin	
			case(S)
				start:
					if(START)
						NS <= p1select;
					else
						NS <= start;
				p1select:
					if(sn1 < 4'd2)
						if(FIRE)
							NS <= p1placed;
						else  
							NS <= p1select;
					else 
						NS <= p2select;
				p1placed:
					if(!FIRE)	
						NS <= p1select;
					else
						NS <= p1placed;
				p2select:
					if(sn2 < 4'd2)
						if(FIRE)
							NS <= p2placed;
						else  
							NS <= p2select;
					else 
						NS <= p1shot;
				p2placed:
					if(!FIRE)
						NS <= p2select;
					else 
						NS <= p2placed;
				p1shot:
					if(hit)
						NS <= hit1;
					else
						NS <= miss1;
				hit1:	
					if(hits1==4'd8)
						NS <= p1win;
					else
						NS <= p2shot;
				miss1:
						NS <= p2shot;
				p2shot:
					if(hit)
						NS <= hit2;
					else
						NS <= miss2;
				hit2:
					if(hits2==4'd8)
						NS <= p2win;
					else
						NS <= p1shot;
				miss2:
						NS <= p1shot;
				p1win:
						NS <= endgame;
				p2win:
						NS <= endgame;
				endgame:
					if(!RST_BTN)
						NS <= start;
					else	
						NS <= endgame;
				default: NS <= start;		
			endcase
		end

	always@(*)
		begin
			case(S)
				start:
				begin
					updatevgaboard[49:0] = 50'b0;
				end
				p1select:
				begin	
					
				end
				p1placed:
				begin
					if(SW[4:0]<=5'd20 && SW[4:0]>5'd0)
						sn1 = sn1 + 1'd1;
					else
						sn2 = sn2;
					shipplace1 = SW[4:0];
				end
				p2select:
				begin
				
				end
				p2placed:
				begin
					if(SW[4:0]<=5'd20 && SW[4:0]>5'd0)
						sn2 = sn2 + 1'd1;
					else
						sn2 = sn2;
					shipplace2 = SW[4:0];
				end
				p1shot:
				begin
					/*updatevgaboard[49] = 1'b1;
					updatevgaboard[48] = 1'b1;
					updatevgaboard[47] = 1'b1;*/
				end
				hit1:
				begin
				
				end
				miss1:
				begin
				
				end
				p2shot:
				begin
				
				end
				hit2:
				begin
				
				end
				miss2:
				begin
				
				end
				
			endcase
		end
					
	assign vgastart 	= (S==start) ? 1 :0;
	assign vgagame 	= (S==p1select|S==p2select|S==p1placed|S>=p2placed) ? 1 :0;
	//assign 
	assign vgaendgame	= (S==p1shot) ? 1 :0;
	
	always@(*)
		begin	
			if(vgagame)	
				VGA_B[3] =
				box1| box2| box3| box4| box5| box6| box7| box8| box9| box10| 
				box11| box12| box13| box14| box15| box16| box17| box18| box19| 
				box20| box21| box22| box23| box24| box25| 
				boxi1| boxi2| boxi3| boxi4| boxi5| boxi6| boxi7| boxi8| boxi9| boxi10| 
				boxi11| boxi12| boxi13| boxi14| boxi15| boxi16| boxi17| boxi18| boxi19| 
				boxi20| boxi21| boxi22| boxi23| boxi24| boxi25;
			else if (vgastart)
				VGA_R[3] = startscreenS1| startscreenS2| startscreenS3| startscreenS4| startscreenS5| startscreenT1| 
				startscreenT2| startscreenT3| startscreenT4| startscreenR1| startscreenR2| startscreenR3| startscreenR4|
				startscreenA1| startscreenA2| startscreenA3| startscreenA4;
			else if (updatevgaboard[49]&vgaendgame)
			begin
				VGA_B[3] =
				box1| box2| box3| box4| box5| box6| box7| box8| box9| box10| 
				box11| box12| box13| box14| box15| box16| box17| box18| box19| 
				box20| box21| box22| box23| box24| box25| 
				boxi1| boxi2| boxi3| boxi4| boxi5| boxi6| boxi7| boxi8| boxi9| boxi10| 
				boxi11| boxi12| boxi13| boxi14| boxi15| boxi16| boxi17| boxi18| boxi19| 
				boxi20| boxi21| boxi22| boxi23| boxi24;
				VGA_R[3] = boxi25;
			end
			else if (updatevgaboard[48]&vgaendgame)
			begin
				VGA_B[3] =
				box1| box2| box3| box4| box5| box6| box7| box8| box9| box10| 
				box11| box12| box13| box14| box15| box16| box17| box18| box19| 
				box20| box21| box22| box23| box24| box25| 
				boxi1| boxi2| boxi3| boxi4| boxi5| boxi6| boxi7| boxi8| boxi9| boxi10| 
				boxi11| boxi12| boxi13| boxi14| boxi15| boxi16| boxi17| boxi18| boxi19| 
				boxi20| boxi21| boxi22| boxi23| boxi25;
				VGA_R[3] = boxi24;
			end
			else if (updatevgaboard[47]&vgaendgame)
			begin
				VGA_B[3] =
				box1| box2| box3| box4| box5| box6| box7| box8| box9| box10| 
				box11| box12| box13| box14| box15| box16| box17| box18| box19| 
				box20| box21| box22| box23| box24| box25| 
				boxi1| boxi2| boxi3| boxi4| boxi5| boxi6| boxi7| boxi8| boxi9| boxi10| 
				boxi11| boxi12| boxi13| boxi14| boxi15| boxi16| boxi17| boxi18| boxi19| 
				boxi20| boxi21| boxi22| boxi24| boxi25;
				VGA_R[3] = boxi23;
			end
			/*if(vgaendgame)	
				VGA_R[2] =
				box1| box2| box3| box4| box5| box6| box7| box8| box9| box10| 
				box11| box12| box13| box14| box15| box16| box17| box18| box19| 
				box20| box21| box22| box23| box24| box25| 
				boxi1| boxi2| boxi3| boxi4| boxi5| boxi6| boxi7| boxi8| boxi9| boxi10| 
				boxi11| boxi12| boxi13| boxi14| boxi15| boxi16| boxi17| boxi18| boxi19| 
				boxi20| boxi21| boxi22| boxi23| boxi24| boxi25;*/
				
			
		end
		
	
endmodule 
