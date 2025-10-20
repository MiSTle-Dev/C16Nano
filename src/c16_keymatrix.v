`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Copyright 2013-2016 Istvan Hegedus
//
//  FPGATED is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  FPGATED is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>. 
//
// Create Date:    19:38:44 12/16/2015 
// Module Name:    c16_keymatrix.v
// Project Name: 	 FPGATED
//
// Description: 	C16/Plus4 keyboard matrix emulation for PS2 keyboards.
//
// Revisions:
// 1.0	first release
//
//////////////////////////////////////////////////////////////////////////////////
module c16_keymatrix
(
	input         clk,
	input  [10:0] ps2_key,
	input   [7:0] row,
	output reg    key_play,
	output  [7:0] kbus
);

reg [7:0] colsel=0;
reg key_A=0,key_B=0,key_C=0,key_D=0,key_E=0,key_F=0,key_G=0,key_H=0,key_I=0,key_J=0,key_K=0,key_L=0,key_M=0,key_N=0,key_O=0,key_P=0,key_Q=0,key_R=0,key_S=0,key_T=0,key_U=0,key_V=0,key_W=0,key_X=0,key_Y=0,key_Z=0;
reg key_1=0,key_2=0,key_3=0,key_4=0,key_5=0,key_6=0,key_7=0,key_8=0,key_9=0,key_0=0,key_del=0,key_return=0,key_help=0,key_F1=0,key_F2=0,key_F3=0,key_AT=0,key_shift=0,key_comma=0,key_dot=0;
reg key_minus=0,key_colon=0,key_star=0,key_semicolon=0,key_esc=0,key_equal=0,key_plus=0,key_slash=0,key_control=0,key_space=0,key_runstop=0;
reg key_pound=0,key_down=0,key_up=0,key_left=0,key_right=0,key_home=0,key_commodore=0;
wire [7:0] rowsel;

assign rowsel=~row;

wire       pressed  = ~ps2_key[7];
wire [6:0] scancode = ps2_key[6:0];

reg [7:0] ukey;
reg kbd_toggle;
always @(posedge clk) begin
    ukey <= ps2_key[7:0];
	if(ukey != ps2_key[7:0]) begin 
		kbd_toggle <= ~kbd_toggle; 
	end
end

always @(posedge clk) begin
	reg flg1,flg2;

	flg1 <= kbd_toggle;
	flg2 <= flg1;
	
	if(flg2 != flg1) begin
		case(scancode)

			// base code keys
			7'h04: key_A<=pressed;
			7'h05: key_B<=pressed;
			7'h06: key_C<=pressed;
			7'h07: key_D<=pressed;
			7'h08: key_E<=pressed;
			7'h09: key_F<=pressed;
			7'h0A: key_G<=pressed;
			7'h0B: key_H<=pressed;
			7'h0C: key_I<=pressed;
			7'h0D: key_J<=pressed;
			7'h0E: key_K<=pressed;
			7'h0F: key_L<=pressed;
			7'h10: key_M<=pressed;
			7'h11: key_N<=pressed;
			7'h12: key_O<=pressed;
			7'h13: key_P<=pressed;
			7'h14: key_Q<=pressed;
			7'h15: key_R<=pressed;
			7'h16: key_S<=pressed;
			7'h17: key_T<=pressed;
			7'h18: key_U<=pressed;
			7'h19: key_V<=pressed;
			7'h1A: key_W<=pressed;
			7'h1B: key_X<=pressed;
			7'h1C: key_Y<=pressed;
			7'h1D: key_Z<=pressed;
			7'h1E: key_1<=pressed;
			7'h1F: key_2<=pressed;
			7'h20: key_3<=pressed;
			7'h21: key_4<=pressed;
			7'h22: key_5<=pressed;
			7'h23: key_6<=pressed;
			7'h24: key_7<=pressed;
			7'h25: key_8<=pressed;
			7'h26: key_9<=pressed;
			7'h27: key_0<=pressed;
			7'h2A: key_del<=pressed;
			7'h28: key_return<=pressed;
         	7'h40: key_help<=pressed; // F7
			7'h3A: key_F1<=pressed;
			7'h3B: key_F2<=pressed;
			7'h3C: key_F3<=pressed;
			7'h2F: key_AT<=pressed;
			7'h6D: key_shift<=pressed;
			7'h36: key_comma<=pressed;
			7'h37: key_dot<=pressed;
			7'h2D: key_minus<=pressed;
			7'h33: key_colon<=pressed;
			7'h30: key_star<=pressed;
			7'h34: key_semicolon<=pressed;
			7'h35: key_esc<=pressed;
			7'h59: key_equal<=pressed;
			7'h2E: key_plus<=pressed;
			7'h38: key_slash<=pressed;
			7'h2C: key_space<=pressed;
			7'h29: key_runstop<=pressed;
			7'h6A: key_commodore<=pressed;
			// extended code keys
			7'h31: key_pound<=pressed;
			7'h51: key_down<=pressed;
			7'h52: key_up<=pressed;
			7'h50: key_left<=pressed;
			7'h4F: key_right<=pressed;
			7'h4A: key_home<=pressed;
  			7'h68: key_control<=pressed;   // Left Control
  			7'h6A: key_commodore<=pressed; // Left Alt
			7'h6E: key_commodore<=pressed; // Right Alt
			7'h6B: key_commodore<=pressed; // Left GUI
			7'h6F: key_commodore<=pressed; // Right GUI
			7'h69: key_shift<=pressed;     // Left Shift
			7'h38: key_slash<=pressed;
			7'h4C: key_del<=pressed;
			7'h44: key_play<=pressed; // F11
	endcase
	end
end

always @(posedge clk) begin
	colsel[0]<=(key_del & rowsel[0]) | (key_3 & rowsel[1]) | (key_5 & rowsel[2]) | (key_7 & rowsel[3]) | (key_9 & rowsel[4]) | (key_down & rowsel[5]) | (key_left & rowsel[6]) | (key_1 & rowsel[7]);
	colsel[1]<=(key_return & rowsel[0]) | (key_W & rowsel[1]) | (key_R & rowsel[2]) | (key_Y & rowsel[3]) | (key_I & rowsel[4]) | (key_P & rowsel[5]) | (key_star & rowsel[6]) | (key_home & rowsel[7]);
	colsel[2]<=(key_pound & rowsel[0]) | (key_A & rowsel[1]) | (key_D & rowsel[2]) | (key_G & rowsel[3]) | (key_J & rowsel[4]) | (key_L & rowsel[5]) | (key_semicolon & rowsel[6]) | (key_control & rowsel[7]);
	colsel[3]<=(key_help & rowsel[0]) | (key_4 & rowsel[1]) | (key_6 & rowsel[2]) | (key_8 & rowsel[3]) | (key_0 & rowsel[4]) | (key_up & rowsel[5]) | (key_right & rowsel[6]) | (key_2 & rowsel[7]);
	colsel[4]<=(key_F1 & rowsel[0]) | (key_Z & rowsel[1]) | (key_C & rowsel[2]) | (key_B & rowsel[3]) | (key_M & rowsel[4]) | (key_dot & rowsel[5]) | (key_esc & rowsel[6]) | (key_space & rowsel[7]);
	colsel[5]<=(key_F2 & rowsel[0]) | (key_S & rowsel[1]) | (key_F & rowsel[2]) | (key_H & rowsel[3]) | (key_K & rowsel[4]) | (key_colon & rowsel[5]) | (key_equal & rowsel[6]) | (key_commodore & rowsel[7]);
	colsel[6]<=(key_F3 & rowsel[0]) | (key_E & rowsel[1]) | (key_T & rowsel[2]) | (key_U & rowsel[3]) | (key_O & rowsel[4]) | (key_minus & rowsel[5]) | (key_plus & rowsel[6]) | (key_Q & rowsel[7]);
	colsel[7]<=(key_AT & rowsel[0]) | (key_shift & rowsel[1]) | (key_X & rowsel[2]) | (key_V & rowsel[3]) | (key_N & rowsel[4]) | (key_comma & rowsel[5]) | (key_slash & rowsel[6]) | (key_runstop & rowsel[7]);
end

assign kbus=~colsel;

endmodule
