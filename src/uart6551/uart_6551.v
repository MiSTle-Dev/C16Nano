module glb6551(
RESET_N,
CLK,
RX_CLK,
RX_CLK_IN,
XTAL_CLK_IN,
PH_2,
DI,
DO,
IRQ,
CS,
RW_N,
RS,
TXDATA_OUT,
RXDATA_IN,
RTS,
CTS,
DCD,
DTR,
DSR,

// serial rs232 connection to io controller
serial_data_out_available,  // bytes available
serial_data_in_free,        // free buffer available
serial_strobe_out,
serial_data_out,
serial_status_out,

// serial rs223 connection from io controller
serial_strobe_in,
serial_data_in
);

input				RESET_N;
input				CLK;
output				RX_CLK;
input				RX_CLK_IN;
input				XTAL_CLK_IN;
input				PH_2;
input		[7:0]	DI;
output		[7:0]	DO;
output				IRQ;
input		[1:0]	CS;
input		[1:0]	RS;
input				RW_N;
output				TXDATA_OUT;
input				RXDATA_IN;
output				RTS;
input				CTS;
input				DCD;
output				DTR;
input				DSR;

// serial rs232 connection to io controller
output		[7:0]	serial_data_out_available;
output		[7:0]	serial_data_in_free;
input				serial_strobe_out;
output		[7:0]	serial_data_out;
output    [31:0]	serial_status_out;

// serial rs223 connection from io controller
input				serial_strobe_in;
input		[7:0]	serial_data_in;


wire	[7:0]		STATUS_REG;
reg		[7:0]		CTL_REG = 8'd0;
reg		[7:0]		CMD_REG = 8'd0;
reg					OVERRUN = 1'b0;
reg					FRAME = 1'b0;
reg					PARITY = 1'b0;
reg					TDRE;
reg					RDRF;

wire	[1:0]		WORD_SELECT;
wire				RESET_X;
wire				PAR_DIS;
reg					RESET_NX;

// report the available unused space in the input fifo
assign serial_data_in_free = { 4'h0, serial_data_in_space };

wire serial_data_out_fifo_full;
wire serial_data_in_full;

wire write = PH_2 && CS==2'b01 && !RW_N && RS==2'b00;
wire read  = PH_2 && CS==2'b01 &&  RW_N && RS==2'b00;
wire read_status = PH_2 && CS==2'b01 && RW_N && RS==2'b01;

// --- 6551 output fifo ---
// filled by the CPU when writing to the uart data register
// emptied by the io controller when reading via SPI
assign serial_data_out_available[7:4] = 4'h0;

assign RX_CLK = 1'b0 ;

io_fifo uart_out_fifo (
	.reset            ( ~RESET_N ),

	.in_clk           ( CLK ),
	.in               ( DI ),
	.in_strobe        ( 1'b0 ),
	.in_enable        ( write ),

	.out_clk          ( CLK ),
	.out              ( serial_data_out ),
	.out_strobe       ( serial_strobe_out ),
	.out_enable       ( 1'b0 ),

	.space            (  ),
	.used             ( serial_data_out_available[3:0] ),
	.empty            (  ),
	.full             ( serial_data_out_fifo_full )
);

reg serial_cpu_data_read;
wire [7:0] serial_data_in_cpu;
wire	   serial_data_in_empty;
wire [3:0] serial_data_in_used;
wire [3:0] serial_data_in_space;
wire	   uart_rx_busy;

// As long as "rx busy" the same previous byte can still be read from the
// rx fifo. Thus we increment the io_fifo read pointer at the end of
// the rx_busy phase which is the falling edge of uart_rx_busy
reg uart_rx_busyD;
reg serial_data_in_availableD;
reg uart_tx_busyD;
reg rx_irq_pending;
reg tx_irq_pending;
reg ext_irq_pending;
reg dcdb_latch;
reg dsrb_latch;

always @(posedge CLK) begin
	if (!RESET_N || !RESET_X)
		uart_rx_busyD <= 1'b0;
	else
		uart_rx_busyD <= uart_rx_busy;
end
wire uart_rx_busy_ends = !uart_rx_busy && uart_rx_busyD;
   
// --- uart input fifo ---
// filled by the io controller when writing via SPI
// emptied by CPU when reading the uart RXD data register
io_fifo uart_in_fifo (
	.reset            ( ~RESET_N ),

	.in_clk           ( CLK ),
	.in               ( serial_data_in ),
	.in_strobe        ( serial_strobe_in ),
	.in_enable        ( 1'b0 ),

	.out_clk          ( CLK ),
	.out              ( serial_data_in_cpu ),
	.out_strobe       ( 1'b0 ),
	.out_enable       ( !serial_data_in_empty &&
						 (uart_rx_busy_ends ||
						  (serial_cpu_data_read && !uart_rx_busy && !uart_rx_busyD && CTL_REG[3:0] == 4'h0)) ),

	.space            ( serial_data_in_space ),
	.used             ( serial_data_in_used ),
	.empty            ( serial_data_in_empty ),
	.full             ( serial_data_in_full )
);

// ---------------- uart data to/from io controller ------------
always @(posedge CLK) begin
	serial_cpu_data_read <= 1'b0;
		// read on uart RX data register
		if(read) 
			serial_cpu_data_read <= 1'b1;
end

// assemble output status structure. Adjust bitrate endianess
assign serial_status_out = { 
	bitrate[7:0], bitrate[15:8], bitrate[23:16], 
	databits, parity, stopbits };

// --- export bit rate based on 6551 config ---
wire [23:0] bitrate = 
	(CTL_REG[3:0] == 4'hf)?24'd19200:       // 19200 bit/s
	(CTL_REG[3:0] == 4'he)?24'd9600:        // 9600 bit/s
	(CTL_REG[3:0] == 4'hd)?24'd7200:        // 7200 bit/s
	(CTL_REG[3:0] == 4'hc)?24'd4800:        // 4800 bit/s
	(CTL_REG[3:0] == 4'hb)?24'd3600:        // 3600 bit/s
	(CTL_REG[3:0] == 4'ha)?24'd2400:        // 2400 bit/s
	(CTL_REG[3:0] == 4'h9)?24'd1800:        // 1800 bit/s
	(CTL_REG[3:0] == 4'h8)?24'd1200:        // 1200 bit/s
	(CTL_REG[3:0] == 4'h7)?24'd600:         // 600 bit/s
	(CTL_REG[3:0] == 4'h6)?24'd300:         // 300 bit/s
	(CTL_REG[3:0] == 4'h5)?24'd150:         // 150 bit/s
	(CTL_REG[3:0] == 4'h4)?24'd134:         // 134.5 bit/s
	(CTL_REG[3:0] == 4'h3)?24'd110:         // 109.92 bit/s
	(CTL_REG[3:0] == 4'h2)?24'd75:          // 75 bit/s
	(CTL_REG[3:0] == 4'h1)?24'd50:          // 50 bit/s
	24'd230400;                             // external clock mode, bridged as 230400 bit/s
	
// timer to simulate the timing behaviour of a serial transmitter by
// reporting "tx buffer not empty" for about one byte time after each byte
// being requested to be sent
wire [1:0] parity = 2'h0;
wire [1:0] stopbits = 2'h0;
wire [3:0] databits = 4'd8;
wire [7:0] timerd_set_data =
	(CTL_REG[3:0] == 4'hf)?8'h02:  // 19200 bit/s
	(CTL_REG[3:0] == 4'he)?8'h04:  // 9600 bit/s
	(CTL_REG[3:0] == 4'hd)?8'h05:  // 7200 bit/s
	(CTL_REG[3:0] == 4'hc)?8'h08:  // 4800 bit/s
	(CTL_REG[3:0] == 4'hb)?8'h0b:  // 3600 bit/s
	(CTL_REG[3:0] == 4'ha)?8'h10:  // 2400 bit/s
	(CTL_REG[3:0] == 4'h9)?8'h15:  // 1800 bit/s
	(CTL_REG[3:0] == 4'h8)?8'h20:  // 1200 bit/s
	(CTL_REG[3:0] == 4'h7)?8'h40:  // 600 bit/s
	(CTL_REG[3:0] == 4'h6)?8'h80:  // 300 bit/s
	(CTL_REG[3:0] == 4'h5)?8'h40:  // 150 bit/s
	(CTL_REG[3:0] == 4'h4)?8'h47:  // 134.5 bit/s
	(CTL_REG[3:0] == 4'h3)?8'h57:  // 109.92 bit/s
	(CTL_REG[3:0] == 4'h2)?8'h80:  // 75 bit/s
	(CTL_REG[3:0] == 4'h1)?8'hc0:  // 50 bit/s
	8'h00;                         // external clock mode has no local busy delay

// bps is 1.8432MHz /32/prescaler/datavalue. These values are used for byte timing
// and are thus 10*the bit values (1 start + 8 data + 1 stop)
wire [10:0] uart_prediv =
	(CTL_REG[3:0] == 4'h5 || CTL_REG[3:0] == 4'h4 ||
	 CTL_REG[3:0] == 4'h3 || CTL_REG[3:0] == 4'h2 ||
	 CTL_REG[3:0] == 4'h1)?11'd60:11'd15;

reg [15:0]	uart_rx_prediv_cnt;
reg [15:0]	uart_tx_prediv_cnt;
reg [7:0]	uart_tx_delay_cnt;
wire		uart_tx_busy = uart_tx_delay_cnt != 8'd0;
reg [7:0]	uart_rx_delay_cnt;
assign		uart_rx_busy = uart_rx_delay_cnt != 8'd0;

// delay data_in_available one more cycle to give the fifo a chance to remove one item
wire	   serial_data_in_available = !serial_data_in_empty && !uart_rx_busy && !uart_rx_busyD;

always @(posedge CLK) begin
	if (!RESET_N || !RESET_X) begin
		uart_rx_prediv_cnt <= 16'd0;
		uart_tx_prediv_cnt <= 16'd0;
		uart_rx_delay_cnt <= 8'd0;
		uart_tx_delay_cnt <= 8'd0;
	end else begin
		// XTAL_CLK_IN is a 1.8432 MHz clock enable.
		if(XTAL_CLK_IN) begin
			if(uart_rx_prediv_cnt != 16'd0)
				uart_rx_prediv_cnt <= uart_rx_prediv_cnt - 16'd1;
			else begin
				uart_rx_prediv_cnt <= { uart_prediv-11'd1, 5'b11111 };
				if(uart_rx_delay_cnt != 8'd0)
					uart_rx_delay_cnt <= uart_rx_delay_cnt - 8'd1;
			end

			if(uart_tx_prediv_cnt != 16'd0)
				uart_tx_prediv_cnt <= uart_tx_prediv_cnt - 16'd1;
			else begin
				uart_tx_prediv_cnt <= { uart_prediv-11'd1, 5'b11111 };
				if(uart_tx_delay_cnt != 8'd0)
					uart_tx_delay_cnt <= uart_tx_delay_cnt - 8'd1;
			end
		end

		if(serial_cpu_data_read && serial_data_in_available) begin
			uart_rx_delay_cnt <= timerd_set_data;
			uart_rx_prediv_cnt <= { uart_prediv-11'd1, 5'b11111 };
		end

		if(write) begin
			uart_tx_delay_cnt <= timerd_set_data;
			uart_tx_prediv_cnt <= { uart_prediv-11'd1, 5'b11111 };
		end
	end
end

always @(posedge CLK) begin
	if (!RESET_N || !RESET_X) begin
		serial_data_in_availableD <= 1'b0;
		uart_tx_busyD <= 1'b0;
		rx_irq_pending <= 1'b0;
		tx_irq_pending <= 1'b0;
		ext_irq_pending <= 1'b0;
		dcdb_latch <= DCD;
		dsrb_latch <= DSR;
	end else begin
		serial_data_in_availableD <= serial_data_in_available;
		uart_tx_busyD <= uart_tx_busy;

		if (read_status) begin
			rx_irq_pending <= 1'b0;
			tx_irq_pending <= 1'b0;
			ext_irq_pending <= 1'b0;
			dcdb_latch <= DCD;
			dsrb_latch <= DSR;
		end

		if (serial_data_in_available && !serial_data_in_availableD)
			rx_irq_pending <= 1'b1;
		if ((uart_tx_busyD && !uart_tx_busy) || (write && timerd_set_data == 8'd0))
			tx_irq_pending <= 1'b1;

		else if (!ext_irq_pending) begin
			dcdb_latch <= DCD;
			dsrb_latch <= DSR;
			if ((dcdb_latch ^ DCD) || (dsrb_latch ^ DSR))
				ext_irq_pending <= 1'b1;
		end
	end
end

// 6551 UART

assign RESET_X = RESET_NX 					?	1'b0:
											RESET_N;
assign TXDATA_OUT =	1'b1;

assign TDRE = !serial_data_out_fifo_full && !uart_tx_busy;
assign RDRF = serial_data_in_available;

assign STATUS_REG = {!IRQ, DSR, DCD, TDRE, RDRF, OVERRUN, FRAME, PARITY};
assign DO =	(RS == 2'b00)	?	serial_data_in_cpu:
			(RS == 2'b01)	?	STATUS_REG:
			(RS == 2'b10)	?	CMD_REG:
								CTL_REG;

assign IRQ = ~(ext_irq_pending |
				(tx_irq_pending && CMD_REG[3:2] == 2'b01) |
				(rx_irq_pending && !CMD_REG[1]));

assign RTS = (CMD_REG[3:2] == 2'b00);
assign DTR = ~CMD_REG[0];
assign PAR_DIS = ~CMD_REG[5];
assign WORD_SELECT = CTL_REG[6:5];

always @ (negedge CLK or negedge RESET_N)
begin
	if(!RESET_N)
		RESET_NX <= 1'b1;
	else
	begin
		if (PH_2)
			if({RW_N, CS, RS} == 5'b00101) // Software RESET
				RESET_NX <= 1'b1;
			else
				RESET_NX <= 1'b0;
			end
end

always @ (negedge CLK or negedge RESET_X)
begin
	if(!RESET_X)
	begin
		CTL_REG <= 8'h00;
		CMD_REG <= 8'h00;
		OVERRUN <= 1'b0;
		FRAME <= 1'b0;
		PARITY <= 1'b0;
	end
	else
	begin
		if (PH_2)
		begin
			if({RW_N, CS, RS} == 5'b00110) // Write CMD register
				CMD_REG <= DI;

			if({RW_N, CS, RS} == 5'b00111) // Write CTL register
				CTL_REG <= DI;
		end
	end
end

endmodule
