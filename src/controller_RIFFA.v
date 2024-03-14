`timescale 1ns/1ns
// ----------------------------------------------------------------------
// Copyright (c)
//
//
//
//
// ----------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			controller_RIFFA.v
// Version:				1.00
// Verilog Standard:	Verilog
// Description:		
//
//
//
//
// Author:				A. Mahani
// History:				09-2023
//-----------------------------------------------------------------------------

module controller_RIFFA #(
	parameter C_PCI_DATA_WIDTH = 128,
	parameter N                = 3,   
	parameter M                = 3,
	parameter AXI_WIDTH        = 128,
	parameter BIT_PREC         = 8
)
(
	input                        CLK,
	input                        RST,
	output                       CHNL_RX_CLK, 
	input                        CHNL_RX, 
	output                       CHNL_RX_ACK, 
	input                        CHNL_RX_LAST, 
	input [31:0]                 CHNL_RX_LEN, 
	input [30:0]                 CHNL_RX_OFF, 
	input [C_PCI_DATA_WIDTH-1:0] CHNL_RX_DATA, 
	input                        CHNL_RX_DATA_VALID, 
	output  reg                  CHNL_RX_DATA_REN,
	
	output                       CHNL_TX_CLK, 
	output                       CHNL_TX, 
	input                        CHNL_TX_ACK, 
	output                       CHNL_TX_LAST, 
	output [31:0]                CHNL_TX_LEN, 
	output [30:0]                CHNL_TX_OFF, 
	output [C_PCI_DATA_WIDTH-1:0] CHNL_TX_DATA, 
	output                       CHNL_TX_DATA_VALID, 
	input                        CHNL_TX_DATA_REN
);

reg  [C_PCI_DATA_WIDTH-1:0] rData_x = {C_PCI_DATA_WIDTH{1'b0}};
reg  [C_PCI_DATA_WIDTH-1:0] rData_w = {C_PCI_DATA_WIDTH{1'b0}};
wire [C_PCI_DATA_WIDTH-1:0] tData   = {C_PCI_DATA_WIDTH{1'b0}};
reg  [31:0]   rLen         = 0;     //the length of received variables (divided by 32)
reg  [31:0]   rCount       = 0;     // counter in rcv state machine
reg  [3:0]    rState       = 0;     
reg  [3:0]    tState       = 0;
reg  [31:0]   tLen         = 0;    // the length of transmit variables (divided by 32) 
reg  [31:0]   tCount       = 0;    // counter in tx state machine
reg           io_wr_input  = 0;   
wire          io_wr_ready     ;
reg           io_start     = 0;
reg           io_iormac    = 0;   
wire          io_sys_busy     ;
reg           io_rw_co     = 0; 
reg           io_rd_output = 0;
wire          io_rd_ready     ;
reg  [7:0]    d_Count      = 0;
reg           new_data     = 0;    

assign CHNL_RX_CLK         = CLK;
assign CHNL_RX_ACK         = (rState == 2'd1);

assign CHNL_TX_CLK          = CLK;
assign CHNL_TX              = (tState != 2'd0);
assign CHNL_TX_LAST         = 1'd1;
assign CHNL_TX_LEN          = tLen; // how many words will send out
assign CHNL_TX_OFF          = 0;
//assign CHNL_TX_DATA[127:64] = {64'd0};
//assign CHNL_TX_DATA_VALID   = (tState == 2'd2 & io_rd_ready);
assign CHNL_TX_DATA_VALID   = (tState == 2'd2);

always @(posedge CLK or posedge RST) begin
	if (RST) begin
		rLen           <= #1 0;
		rCount         <= #1 0;
		rState         <= #1 0;
		rData_x        <= #1 0;
		rData_w        <= #1 0;
		io_wr_input    <= #1 0;
		io_start       <= #1 0;
		io_iormac      <= #1 0;
		io_rw_co       <= #1 0;
        io_rd_output   <= #1 0;
		d_Count        <= #1 0;
		new_data       <= #1 0; 				
	end
	else begin
	
	CHNL_RX_DATA_REN    <= io_wr_input; //io_wr_input asserts to high, one cycle after 'CHNL_RX_DATA_VALID', then io_wr_ready transits from 0 to 1
	                                    //it means that both CHNL_RX_DATA_REN and io_wr_ready are high at the same time
	
		case (rState)
		
		3'd0: begin // Wait for start of RX, get RX length
			if (CHNL_RX & tState == 1'b0) begin
//				rLen    <= CHNL_RX_LEN;     //how many words will rcv
				rLen         <= 7'd16;
				rCount       <= 0;
				d_Count      <= 0;
				rState       <= 2'd1;
				new_data     <= 1'b0;
			end
		end
		
		3'd1: begin // the matmul module rcv the command by 'CHNL_RX_DATA_VALID, (io_iormac is change the vertical output of PE)
		    rState                 <= 2'd2;
		    io_iormac              <= 1'b1;	
			io_rw_co               <= 1'b1;
			io_wr_input            <= CHNL_RX_DATA_VALID; // io_wr_input takes one, one cycle after 'CHNL_RX_DATA_VALID'

		end

		3'd2: begin // If the matmul module is ready, then the x_input feeds to the reg file, Wait for last input data "x", then go to the next step for w

			if (CHNL_RX_DATA_VALID & CHNL_RX_DATA_REN) begin
				rData_x                <= CHNL_RX_DATA;
				rCount                 <= (rCount >= 3'd5) ? 1'b0 : rCount + 1'b1; //how many elements need to feed to the regfile
				
			end
				rState                 <= (rCount >= 3'd5) ? 3'd3 : 3'd2;               // go the next state for w_input 
				io_wr_input            <= (rCount >= 3'd5) ? 1'b0 : CHNL_RX_DATA_VALID; //end of x_input
		end
		
		3'd3: begin // same with state 1 for w_input
                rState                 <= 3'd4; 
                io_rw_co               <= 1'b0;   
                io_wr_input            <= CHNL_RX_DATA_VALID;    
        end


		3'd4: begin // same with state 3 for w_input 
		
			if (CHNL_RX_DATA_VALID & CHNL_RX_DATA_REN) begin
				rData_x                 <= CHNL_RX_DATA;
				rCount                  <= rCount + 1'b1;

			end
			    rState                 <= (rCount >= 3'd5) ? 3'd5 : 3'd4;
                io_wr_input            <= (rCount >= 3'd5) ? 1'b0 : (CHNL_RX_DATA_VALID);

		end

		3'd5: begin // start the matmul computation and wait until o_ready
                  d_Count                <= d_Count + 1'b1;
			      io_iormac              <= (d_Count >= 5'd17) ? 1'b0 : 1'b1;    //change the vertical output to mac
			      io_start               <= (d_Count >= 5'd16) ? 1'b0 : 1'b1;    // start the matmul, and stay up for how many cycles?
			      rState                 <= (d_Count >= 5'd16 & io_sys_busy == 1'b0) ? 3'd6 : 3'd5;	//wait for io_sys_busy = 0
		end

		3'd6: begin // wait for through out the results, then go to the state 0 for new x and w 
				
			    rState                 <= (tState == 2'd3) ? 3'd0 : 3'd6;
			    new_data               <= (tState == 2'd3) ? 1'b1 : 1'b0;

		end
		
		endcase
	end
end

always @(posedge CLK or posedge RST) begin
	if (RST) begin
		tState              <= #1 0;
		tCount              <= #1 0;
		tLen                <= #1 0;
	end
	else begin
		case (tState)
		
		2'd0: begin // start TX when o_ready is high
			tState           <= (rState == 3'd6) ? 1'b1 : 1'b0;
			tLen             <= 5'd4;
		end

		2'd1: begin // Wait for the CHNL_TX_ACK
			tState           <= tState + CHNL_TX_ACK;
			
		end
		
		2'd2: begin // Send data to the FIFO, wait for the last packet
		    tCount            <= tCount + CHNL_TX_DATA_REN; 
		    io_rd_output      <= (tCount >= tLen) ?1'b0 : 1'b1;
			tState            <= (tCount >= tLen) ? tState + 1'b1 : tState;
			io_rd_output      <= (tCount >= tLen) ? 1'b0 : 1'b1; 
		end

		2'd3: begin // Finish the TX transaction
			tState            <= 2'd0;
			tCount            <= 1'b0;

		end

		endcase
	end
end


top_2dsys sd_sys(
.clock(CLK),
.reset(RST | new_data),
.io_in(CHNL_RX_DATA),
.io_rw_co(io_rw_co),
.io_ping_pong_wr(1'b1),
.io_ping_pong_rd(1'b1),
.io_wr_input(io_wr_input),
.io_wr_ready(io_wr_ready),
.io_start(io_start),
.io_iormac(io_iormac),
.io_sys_busy(io_sys_busy),
.io_rd_output(io_rd_output),
.io_rd_ready(io_rd_ready),
.io_out(CHNL_TX_DATA)
);


endmodule
