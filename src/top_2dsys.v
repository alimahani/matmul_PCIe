`timescale 1ns/1ns
// ----------------------------------------------------------------------
// Copyright (c)
//
//
//
//
// ----------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			top_2dsys.v
// Version:				1.00
// Verilog Standard:	Verilog
// Description:	 generated verilog code from Chisel source code 	
//
//
//
//
// Author:				A. Mahani
// History:				09-2023
//-----------------------------------------------------------------------------


module bc_pe(
  input         clock,
  input         reset,
  input  [7:0]  io_ho_input,
  input  [31:0] io_ve_input,
  input         io_input_valid,
  input         io_iormac,
  output [31:0] io_ve_out,
  output [7:0]  io_ho_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mac; // @[bc_pe.scala 26:27]
  reg [7:0] ho_reg; // @[bc_pe.scala 27:27]
  reg [31:0] ve_reg; // @[bc_pe.scala 28:27]
  wire [39:0] _mac_T = $signed(io_ho_input) * $signed(io_ve_input); // @[bc_pe.scala 38:41]
  wire [39:0] _GEN_1 = {{8{mac[31]}},mac}; // @[bc_pe.scala 38:26]
  wire [39:0] _mac_T_3 = $signed(_GEN_1) + $signed(_mac_T); // @[bc_pe.scala 38:26]
  wire [32:0] _mac_T_4 = {{1{mac[31]}},mac}; // @[bc_pe.scala 40:26]
  wire [31:0] _mac_T_6 = _mac_T_4[31:0]; // @[bc_pe.scala 40:26]
  wire [39:0] _GEN_0 = io_input_valid ? $signed(_mac_T_3) : $signed({{8{_mac_T_6[31]}},_mac_T_6}); // @[bc_pe.scala 37:34 38:19 40:19]
  wire [39:0] _GEN_2 = reset ? $signed(40'sh0) : $signed(_GEN_0); // @[bc_pe.scala 26:{27,27}]
  assign io_ve_out = io_iormac ? $signed(ve_reg) : $signed(mac); // @[bc_pe.scala 46:25]
  assign io_ho_out = ho_reg; // @[bc_pe.scala 47:19]
  always @(posedge clock) begin
    mac <= _GEN_2[31:0]; // @[bc_pe.scala 26:{27,27}]
    if (reset) begin // @[bc_pe.scala 27:27]
      ho_reg <= 8'sh0; // @[bc_pe.scala 27:27]
    end else begin
      ho_reg <= io_ho_input; // @[bc_pe.scala 43:19]
    end
    if (reset) begin // @[bc_pe.scala 28:27]
      ve_reg <= 32'sh0; // @[bc_pe.scala 28:27]
    end else begin
      ve_reg <= io_ve_input; // @[bc_pe.scala 44:19]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mac = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ho_reg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  ve_reg = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module bc_mmul(
  input         clock,
  input         reset,
  input  [7:0]  io_x_input_0,
  input  [7:0]  io_x_input_1,
  input  [7:0]  io_x_input_2,
  input  [7:0]  io_x_input_3,
  input  [7:0]  io_w_input_0,
  input  [7:0]  io_w_input_1,
  input  [7:0]  io_w_input_2,
  input  [7:0]  io_w_input_3,
  input         io_input_valid_0,
  input         io_input_valid_1,
  input         io_input_valid_2,
  input         io_input_valid_3,
  input         io_input_valid_4,
  input         io_input_valid_5,
  input         io_input_valid_6,
  input         io_input_valid_7,
  input         io_input_valid_8,
  input         io_input_valid_9,
  input         io_input_valid_10,
  input         io_input_valid_11,
  input         io_input_valid_12,
  input         io_input_valid_13,
  input         io_input_valid_14,
  input         io_input_valid_15,
  input         io_iormac_0,
  input         io_iormac_1,
  input         io_iormac_2,
  input         io_iormac_3,
  input         io_iormac_4,
  input         io_iormac_5,
  input         io_iormac_6,
  input         io_iormac_7,
  input         io_iormac_8,
  input         io_iormac_9,
  input         io_iormac_10,
  input         io_iormac_11,
  input         io_iormac_12,
  input         io_iormac_13,
  input         io_iormac_14,
  input         io_iormac_15,
  output [31:0] io_out_0,
  output [31:0] io_out_1,
  output [31:0] io_out_2,
  output [31:0] io_out_3
);
  wire  bc_pe_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_1_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_1_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_1_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_1_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_1_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_1_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_1_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_1_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_2_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_2_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_2_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_2_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_2_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_2_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_2_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_2_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_3_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_3_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_3_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_3_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_3_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_3_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_3_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_3_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_4_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_4_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_4_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_4_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_4_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_4_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_4_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_4_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_5_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_5_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_5_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_5_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_5_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_5_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_5_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_5_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_6_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_6_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_6_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_6_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_6_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_6_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_6_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_6_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_7_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_7_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_7_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_7_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_7_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_7_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_7_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_7_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_8_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_8_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_8_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_8_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_8_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_8_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_8_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_8_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_9_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_9_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_9_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_9_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_9_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_9_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_9_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_9_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_10_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_10_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_10_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_10_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_10_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_10_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_10_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_10_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_11_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_11_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_11_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_11_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_11_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_11_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_11_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_11_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_12_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_12_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_12_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_12_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_12_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_12_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_12_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_12_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_13_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_13_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_13_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_13_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_13_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_13_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_13_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_13_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_14_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_14_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_14_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_14_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_14_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_14_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_14_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_14_io_ho_out; // @[bc_mmul.scala 24:54]
  wire  bc_pe_15_clock; // @[bc_mmul.scala 24:54]
  wire  bc_pe_15_reset; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_15_io_ho_input; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_15_io_ve_input; // @[bc_mmul.scala 24:54]
  wire  bc_pe_15_io_input_valid; // @[bc_mmul.scala 24:54]
  wire  bc_pe_15_io_iormac; // @[bc_mmul.scala 24:54]
  wire [31:0] bc_pe_15_io_ve_out; // @[bc_mmul.scala 24:54]
  wire [7:0] bc_pe_15_io_ho_out; // @[bc_mmul.scala 24:54]
  bc_pe bc_pe ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_clock),
    .reset(bc_pe_reset),
    .io_ho_input(bc_pe_io_ho_input),
    .io_ve_input(bc_pe_io_ve_input),
    .io_input_valid(bc_pe_io_input_valid),
    .io_iormac(bc_pe_io_iormac),
    .io_ve_out(bc_pe_io_ve_out),
    .io_ho_out(bc_pe_io_ho_out)
  );
  bc_pe bc_pe_1 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_1_clock),
    .reset(bc_pe_1_reset),
    .io_ho_input(bc_pe_1_io_ho_input),
    .io_ve_input(bc_pe_1_io_ve_input),
    .io_input_valid(bc_pe_1_io_input_valid),
    .io_iormac(bc_pe_1_io_iormac),
    .io_ve_out(bc_pe_1_io_ve_out),
    .io_ho_out(bc_pe_1_io_ho_out)
  );
  bc_pe bc_pe_2 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_2_clock),
    .reset(bc_pe_2_reset),
    .io_ho_input(bc_pe_2_io_ho_input),
    .io_ve_input(bc_pe_2_io_ve_input),
    .io_input_valid(bc_pe_2_io_input_valid),
    .io_iormac(bc_pe_2_io_iormac),
    .io_ve_out(bc_pe_2_io_ve_out),
    .io_ho_out(bc_pe_2_io_ho_out)
  );
  bc_pe bc_pe_3 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_3_clock),
    .reset(bc_pe_3_reset),
    .io_ho_input(bc_pe_3_io_ho_input),
    .io_ve_input(bc_pe_3_io_ve_input),
    .io_input_valid(bc_pe_3_io_input_valid),
    .io_iormac(bc_pe_3_io_iormac),
    .io_ve_out(bc_pe_3_io_ve_out),
    .io_ho_out(bc_pe_3_io_ho_out)
  );
  bc_pe bc_pe_4 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_4_clock),
    .reset(bc_pe_4_reset),
    .io_ho_input(bc_pe_4_io_ho_input),
    .io_ve_input(bc_pe_4_io_ve_input),
    .io_input_valid(bc_pe_4_io_input_valid),
    .io_iormac(bc_pe_4_io_iormac),
    .io_ve_out(bc_pe_4_io_ve_out),
    .io_ho_out(bc_pe_4_io_ho_out)
  );
  bc_pe bc_pe_5 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_5_clock),
    .reset(bc_pe_5_reset),
    .io_ho_input(bc_pe_5_io_ho_input),
    .io_ve_input(bc_pe_5_io_ve_input),
    .io_input_valid(bc_pe_5_io_input_valid),
    .io_iormac(bc_pe_5_io_iormac),
    .io_ve_out(bc_pe_5_io_ve_out),
    .io_ho_out(bc_pe_5_io_ho_out)
  );
  bc_pe bc_pe_6 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_6_clock),
    .reset(bc_pe_6_reset),
    .io_ho_input(bc_pe_6_io_ho_input),
    .io_ve_input(bc_pe_6_io_ve_input),
    .io_input_valid(bc_pe_6_io_input_valid),
    .io_iormac(bc_pe_6_io_iormac),
    .io_ve_out(bc_pe_6_io_ve_out),
    .io_ho_out(bc_pe_6_io_ho_out)
  );
  bc_pe bc_pe_7 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_7_clock),
    .reset(bc_pe_7_reset),
    .io_ho_input(bc_pe_7_io_ho_input),
    .io_ve_input(bc_pe_7_io_ve_input),
    .io_input_valid(bc_pe_7_io_input_valid),
    .io_iormac(bc_pe_7_io_iormac),
    .io_ve_out(bc_pe_7_io_ve_out),
    .io_ho_out(bc_pe_7_io_ho_out)
  );
  bc_pe bc_pe_8 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_8_clock),
    .reset(bc_pe_8_reset),
    .io_ho_input(bc_pe_8_io_ho_input),
    .io_ve_input(bc_pe_8_io_ve_input),
    .io_input_valid(bc_pe_8_io_input_valid),
    .io_iormac(bc_pe_8_io_iormac),
    .io_ve_out(bc_pe_8_io_ve_out),
    .io_ho_out(bc_pe_8_io_ho_out)
  );
  bc_pe bc_pe_9 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_9_clock),
    .reset(bc_pe_9_reset),
    .io_ho_input(bc_pe_9_io_ho_input),
    .io_ve_input(bc_pe_9_io_ve_input),
    .io_input_valid(bc_pe_9_io_input_valid),
    .io_iormac(bc_pe_9_io_iormac),
    .io_ve_out(bc_pe_9_io_ve_out),
    .io_ho_out(bc_pe_9_io_ho_out)
  );
  bc_pe bc_pe_10 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_10_clock),
    .reset(bc_pe_10_reset),
    .io_ho_input(bc_pe_10_io_ho_input),
    .io_ve_input(bc_pe_10_io_ve_input),
    .io_input_valid(bc_pe_10_io_input_valid),
    .io_iormac(bc_pe_10_io_iormac),
    .io_ve_out(bc_pe_10_io_ve_out),
    .io_ho_out(bc_pe_10_io_ho_out)
  );
  bc_pe bc_pe_11 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_11_clock),
    .reset(bc_pe_11_reset),
    .io_ho_input(bc_pe_11_io_ho_input),
    .io_ve_input(bc_pe_11_io_ve_input),
    .io_input_valid(bc_pe_11_io_input_valid),
    .io_iormac(bc_pe_11_io_iormac),
    .io_ve_out(bc_pe_11_io_ve_out),
    .io_ho_out(bc_pe_11_io_ho_out)
  );
  bc_pe bc_pe_12 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_12_clock),
    .reset(bc_pe_12_reset),
    .io_ho_input(bc_pe_12_io_ho_input),
    .io_ve_input(bc_pe_12_io_ve_input),
    .io_input_valid(bc_pe_12_io_input_valid),
    .io_iormac(bc_pe_12_io_iormac),
    .io_ve_out(bc_pe_12_io_ve_out),
    .io_ho_out(bc_pe_12_io_ho_out)
  );
  bc_pe bc_pe_13 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_13_clock),
    .reset(bc_pe_13_reset),
    .io_ho_input(bc_pe_13_io_ho_input),
    .io_ve_input(bc_pe_13_io_ve_input),
    .io_input_valid(bc_pe_13_io_input_valid),
    .io_iormac(bc_pe_13_io_iormac),
    .io_ve_out(bc_pe_13_io_ve_out),
    .io_ho_out(bc_pe_13_io_ho_out)
  );
  bc_pe bc_pe_14 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_14_clock),
    .reset(bc_pe_14_reset),
    .io_ho_input(bc_pe_14_io_ho_input),
    .io_ve_input(bc_pe_14_io_ve_input),
    .io_input_valid(bc_pe_14_io_input_valid),
    .io_iormac(bc_pe_14_io_iormac),
    .io_ve_out(bc_pe_14_io_ve_out),
    .io_ho_out(bc_pe_14_io_ho_out)
  );
  bc_pe bc_pe_15 ( // @[bc_mmul.scala 24:54]
    .clock(bc_pe_15_clock),
    .reset(bc_pe_15_reset),
    .io_ho_input(bc_pe_15_io_ho_input),
    .io_ve_input(bc_pe_15_io_ve_input),
    .io_input_valid(bc_pe_15_io_input_valid),
    .io_iormac(bc_pe_15_io_iormac),
    .io_ve_out(bc_pe_15_io_ve_out),
    .io_ho_out(bc_pe_15_io_ho_out)
  );
  assign io_out_0 = bc_pe_12_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign io_out_1 = bc_pe_13_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign io_out_2 = bc_pe_14_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign io_out_3 = bc_pe_15_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_clock = clock;
  assign bc_pe_reset = reset;
  assign bc_pe_io_ho_input = io_x_input_0; // @[bc_mmul.scala 24:28 38:42]
  assign bc_pe_io_ve_input = {{24{io_w_input_0[7]}},io_w_input_0}; // @[bc_mmul.scala 24:28 37:42]
  assign bc_pe_io_input_valid = io_input_valid_0; // @[bc_mmul.scala 24:28 39:42]
  assign bc_pe_io_iormac = io_iormac_0; // @[bc_mmul.scala 24:28 40:42]
  assign bc_pe_1_clock = clock;
  assign bc_pe_1_reset = reset;
  assign bc_pe_1_io_ho_input = bc_pe_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_1_io_ve_input = {{24{io_w_input_1[7]}},io_w_input_1}; // @[bc_mmul.scala 24:28 48:43]
  assign bc_pe_1_io_input_valid = io_input_valid_1; // @[bc_mmul.scala 24:28 50:43]
  assign bc_pe_1_io_iormac = io_iormac_1; // @[bc_mmul.scala 24:28 51:43]
  assign bc_pe_2_clock = clock;
  assign bc_pe_2_reset = reset;
  assign bc_pe_2_io_ho_input = bc_pe_1_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_2_io_ve_input = {{24{io_w_input_2[7]}},io_w_input_2}; // @[bc_mmul.scala 24:28 48:43]
  assign bc_pe_2_io_input_valid = io_input_valid_2; // @[bc_mmul.scala 24:28 50:43]
  assign bc_pe_2_io_iormac = io_iormac_2; // @[bc_mmul.scala 24:28 51:43]
  assign bc_pe_3_clock = clock;
  assign bc_pe_3_reset = reset;
  assign bc_pe_3_io_ho_input = bc_pe_2_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_3_io_ve_input = {{24{io_w_input_3[7]}},io_w_input_3}; // @[bc_mmul.scala 24:28 48:43]
  assign bc_pe_3_io_input_valid = io_input_valid_3; // @[bc_mmul.scala 24:28 50:43]
  assign bc_pe_3_io_iormac = io_iormac_3; // @[bc_mmul.scala 24:28 51:43]
  assign bc_pe_4_clock = clock;
  assign bc_pe_4_reset = reset;
  assign bc_pe_4_io_ho_input = io_x_input_1; // @[bc_mmul.scala 24:28 60:41]
  assign bc_pe_4_io_ve_input = bc_pe_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_4_io_input_valid = io_input_valid_4; // @[bc_mmul.scala 24:28 62:41]
  assign bc_pe_4_io_iormac = io_iormac_4; // @[bc_mmul.scala 24:28 63:41]
  assign bc_pe_5_clock = clock;
  assign bc_pe_5_reset = reset;
  assign bc_pe_5_io_ho_input = bc_pe_4_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_5_io_ve_input = bc_pe_1_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_5_io_input_valid = io_input_valid_5; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_5_io_iormac = io_iormac_5; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_6_clock = clock;
  assign bc_pe_6_reset = reset;
  assign bc_pe_6_io_ho_input = bc_pe_5_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_6_io_ve_input = bc_pe_2_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_6_io_input_valid = io_input_valid_6; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_6_io_iormac = io_iormac_6; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_7_clock = clock;
  assign bc_pe_7_reset = reset;
  assign bc_pe_7_io_ho_input = bc_pe_6_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_7_io_ve_input = bc_pe_3_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_7_io_input_valid = io_input_valid_7; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_7_io_iormac = io_iormac_7; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_8_clock = clock;
  assign bc_pe_8_reset = reset;
  assign bc_pe_8_io_ho_input = io_x_input_2; // @[bc_mmul.scala 24:28 60:41]
  assign bc_pe_8_io_ve_input = bc_pe_4_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_8_io_input_valid = io_input_valid_8; // @[bc_mmul.scala 24:28 62:41]
  assign bc_pe_8_io_iormac = io_iormac_8; // @[bc_mmul.scala 24:28 63:41]
  assign bc_pe_9_clock = clock;
  assign bc_pe_9_reset = reset;
  assign bc_pe_9_io_ho_input = bc_pe_8_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_9_io_ve_input = bc_pe_5_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_9_io_input_valid = io_input_valid_9; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_9_io_iormac = io_iormac_9; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_10_clock = clock;
  assign bc_pe_10_reset = reset;
  assign bc_pe_10_io_ho_input = bc_pe_9_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_10_io_ve_input = bc_pe_6_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_10_io_input_valid = io_input_valid_10; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_10_io_iormac = io_iormac_10; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_11_clock = clock;
  assign bc_pe_11_reset = reset;
  assign bc_pe_11_io_ho_input = bc_pe_10_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_11_io_ve_input = bc_pe_7_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_11_io_input_valid = io_input_valid_11; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_11_io_iormac = io_iormac_11; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_12_clock = clock;
  assign bc_pe_12_reset = reset;
  assign bc_pe_12_io_ho_input = io_x_input_3; // @[bc_mmul.scala 24:28 60:41]
  assign bc_pe_12_io_ve_input = bc_pe_8_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_12_io_input_valid = io_input_valid_12; // @[bc_mmul.scala 24:28 62:41]
  assign bc_pe_12_io_iormac = io_iormac_12; // @[bc_mmul.scala 24:28 63:41]
  assign bc_pe_13_clock = clock;
  assign bc_pe_13_reset = reset;
  assign bc_pe_13_io_ho_input = bc_pe_12_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_13_io_ve_input = bc_pe_9_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_13_io_input_valid = io_input_valid_13; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_13_io_iormac = io_iormac_13; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_14_clock = clock;
  assign bc_pe_14_reset = reset;
  assign bc_pe_14_io_ho_input = bc_pe_13_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_14_io_ve_input = bc_pe_10_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_14_io_input_valid = io_input_valid_14; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_14_io_iormac = io_iormac_14; // @[bc_mmul.scala 24:28 78:47]
  assign bc_pe_15_clock = clock;
  assign bc_pe_15_reset = reset;
  assign bc_pe_15_io_ho_input = bc_pe_14_io_ho_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_15_io_ve_input = bc_pe_11_io_ve_out; // @[bc_mmul.scala 24:{28,28}]
  assign bc_pe_15_io_input_valid = io_input_valid_15; // @[bc_mmul.scala 24:28 77:47]
  assign bc_pe_15_io_iormac = io_iormac_15; // @[bc_mmul.scala 24:28 78:47]
endmodule
module demux4to1(
  input        io_in,
  input  [1:0] io_sel,
  output       io_out0,
  output       io_out1,
  output       io_out2,
  output       io_out3
);
  assign io_out0 = io_sel == 2'h0 & io_in; // @[dmux4to1.scala 19:19]
  assign io_out1 = io_sel == 2'h1 & io_in; // @[dmux4to1.scala 20:19]
  assign io_out2 = io_sel == 2'h2 & io_in; // @[dmux4to1.scala 21:19]
  assign io_out3 = io_sel == 2'h3 & io_in; // @[dmux4to1.scala 22:19]
endmodule
module regfile(
  input          clock,
  input          reset,
  input  [127:0] io_din,
  input  [4:0]   io_addrs,
  input          io_en,
  input          io_load,
  output [127:0] io_regout
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [127:0] _RAND_1;
  reg [127:0] _RAND_2;
  reg [127:0] _RAND_3;
  reg [127:0] _RAND_4;
  reg [127:0] _RAND_5;
  reg [127:0] _RAND_6;
  reg [127:0] _RAND_7;
  reg [127:0] _RAND_8;
  reg [127:0] _RAND_9;
  reg [127:0] _RAND_10;
  reg [127:0] _RAND_11;
  reg [127:0] _RAND_12;
  reg [127:0] _RAND_13;
  reg [127:0] _RAND_14;
  reg [127:0] _RAND_15;
  reg [127:0] _RAND_16;
  reg [127:0] _RAND_17;
  reg [127:0] _RAND_18;
  reg [127:0] _RAND_19;
  reg [127:0] _RAND_20;
  reg [127:0] _RAND_21;
  reg [127:0] _RAND_22;
  reg [127:0] _RAND_23;
  reg [127:0] _RAND_24;
  reg [127:0] _RAND_25;
  reg [127:0] _RAND_26;
  reg [127:0] _RAND_27;
  reg [127:0] _RAND_28;
  reg [127:0] _RAND_29;
  reg [127:0] _RAND_30;
  reg [127:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] buffer_0; // @[regfile.scala 22:23]
  reg [127:0] buffer_1; // @[regfile.scala 22:23]
  reg [127:0] buffer_2; // @[regfile.scala 22:23]
  reg [127:0] buffer_3; // @[regfile.scala 22:23]
  reg [127:0] buffer_4; // @[regfile.scala 22:23]
  reg [127:0] buffer_5; // @[regfile.scala 22:23]
  reg [127:0] buffer_6; // @[regfile.scala 22:23]
  reg [127:0] buffer_7; // @[regfile.scala 22:23]
  reg [127:0] buffer_8; // @[regfile.scala 22:23]
  reg [127:0] buffer_9; // @[regfile.scala 22:23]
  reg [127:0] buffer_10; // @[regfile.scala 22:23]
  reg [127:0] buffer_11; // @[regfile.scala 22:23]
  reg [127:0] buffer_12; // @[regfile.scala 22:23]
  reg [127:0] buffer_13; // @[regfile.scala 22:23]
  reg [127:0] buffer_14; // @[regfile.scala 22:23]
  reg [127:0] buffer_15; // @[regfile.scala 22:23]
  reg [127:0] buffer_16; // @[regfile.scala 22:23]
  reg [127:0] buffer_17; // @[regfile.scala 22:23]
  reg [127:0] buffer_18; // @[regfile.scala 22:23]
  reg [127:0] buffer_19; // @[regfile.scala 22:23]
  reg [127:0] buffer_20; // @[regfile.scala 22:23]
  reg [127:0] buffer_21; // @[regfile.scala 22:23]
  reg [127:0] buffer_22; // @[regfile.scala 22:23]
  reg [127:0] buffer_23; // @[regfile.scala 22:23]
  reg [127:0] buffer_24; // @[regfile.scala 22:23]
  reg [127:0] buffer_25; // @[regfile.scala 22:23]
  reg [127:0] buffer_26; // @[regfile.scala 22:23]
  reg [127:0] buffer_27; // @[regfile.scala 22:23]
  reg [127:0] buffer_28; // @[regfile.scala 22:23]
  reg [127:0] buffer_29; // @[regfile.scala 22:23]
  reg [127:0] buffer_30; // @[regfile.scala 22:23]
  reg [127:0] buffer_31; // @[regfile.scala 22:23]
  wire [127:0] _GEN_33 = 5'h1 == io_addrs ? buffer_1 : buffer_0; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_34 = 5'h2 == io_addrs ? buffer_2 : _GEN_33; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_35 = 5'h3 == io_addrs ? buffer_3 : _GEN_34; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_36 = 5'h4 == io_addrs ? buffer_4 : _GEN_35; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_37 = 5'h5 == io_addrs ? buffer_5 : _GEN_36; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_38 = 5'h6 == io_addrs ? buffer_6 : _GEN_37; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_39 = 5'h7 == io_addrs ? buffer_7 : _GEN_38; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_40 = 5'h8 == io_addrs ? buffer_8 : _GEN_39; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_41 = 5'h9 == io_addrs ? buffer_9 : _GEN_40; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_42 = 5'ha == io_addrs ? buffer_10 : _GEN_41; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_43 = 5'hb == io_addrs ? buffer_11 : _GEN_42; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_44 = 5'hc == io_addrs ? buffer_12 : _GEN_43; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_45 = 5'hd == io_addrs ? buffer_13 : _GEN_44; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_46 = 5'he == io_addrs ? buffer_14 : _GEN_45; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_47 = 5'hf == io_addrs ? buffer_15 : _GEN_46; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_48 = 5'h10 == io_addrs ? buffer_16 : _GEN_47; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_49 = 5'h11 == io_addrs ? buffer_17 : _GEN_48; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_50 = 5'h12 == io_addrs ? buffer_18 : _GEN_49; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_51 = 5'h13 == io_addrs ? buffer_19 : _GEN_50; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_52 = 5'h14 == io_addrs ? buffer_20 : _GEN_51; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_53 = 5'h15 == io_addrs ? buffer_21 : _GEN_52; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_54 = 5'h16 == io_addrs ? buffer_22 : _GEN_53; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_55 = 5'h17 == io_addrs ? buffer_23 : _GEN_54; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_56 = 5'h18 == io_addrs ? buffer_24 : _GEN_55; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_57 = 5'h19 == io_addrs ? buffer_25 : _GEN_56; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_58 = 5'h1a == io_addrs ? buffer_26 : _GEN_57; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_59 = 5'h1b == io_addrs ? buffer_27 : _GEN_58; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_60 = 5'h1c == io_addrs ? buffer_28 : _GEN_59; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_61 = 5'h1d == io_addrs ? buffer_29 : _GEN_60; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_62 = 5'h1e == io_addrs ? buffer_30 : _GEN_61; // @[regfile.scala 38:{17,17}]
  wire [127:0] _GEN_63 = 5'h1f == io_addrs ? buffer_31 : _GEN_62; // @[regfile.scala 38:{17,17}]
  assign io_regout = ~io_load & io_en ? _GEN_63 : 128'h0; // @[regfile.scala 36:35 38:17 42:17]
  always @(posedge clock) begin
    if (reset) begin // @[regfile.scala 22:23]
      buffer_0 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h0 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_0 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_1 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_1 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_2 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h2 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_2 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_3 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h3 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_3 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_4 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h4 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_4 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_5 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h5 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_5 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_6 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h6 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_6 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_7 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h7 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_7 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_8 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h8 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_8 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_9 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h9 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_9 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_10 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'ha == io_addrs) begin // @[regfile.scala 33:24]
        buffer_10 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_11 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hb == io_addrs) begin // @[regfile.scala 33:24]
        buffer_11 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_12 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hc == io_addrs) begin // @[regfile.scala 33:24]
        buffer_12 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_13 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hd == io_addrs) begin // @[regfile.scala 33:24]
        buffer_13 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_14 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'he == io_addrs) begin // @[regfile.scala 33:24]
        buffer_14 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_15 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hf == io_addrs) begin // @[regfile.scala 33:24]
        buffer_15 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_16 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h10 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_16 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_17 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h11 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_17 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_18 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h12 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_18 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_19 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h13 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_19 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_20 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h14 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_20 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_21 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h15 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_21 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_22 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h16 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_22 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_23 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h17 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_23 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_24 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h18 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_24 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_25 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h19 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_25 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_26 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1a == io_addrs) begin // @[regfile.scala 33:24]
        buffer_26 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_27 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1b == io_addrs) begin // @[regfile.scala 33:24]
        buffer_27 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_28 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1c == io_addrs) begin // @[regfile.scala 33:24]
        buffer_28 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_29 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1d == io_addrs) begin // @[regfile.scala 33:24]
        buffer_29 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_30 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1e == io_addrs) begin // @[regfile.scala 33:24]
        buffer_30 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_31 <= 128'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1f == io_addrs) begin // @[regfile.scala 33:24]
        buffer_31 <= io_din; // @[regfile.scala 33:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {4{`RANDOM}};
  buffer_0 = _RAND_0[127:0];
  _RAND_1 = {4{`RANDOM}};
  buffer_1 = _RAND_1[127:0];
  _RAND_2 = {4{`RANDOM}};
  buffer_2 = _RAND_2[127:0];
  _RAND_3 = {4{`RANDOM}};
  buffer_3 = _RAND_3[127:0];
  _RAND_4 = {4{`RANDOM}};
  buffer_4 = _RAND_4[127:0];
  _RAND_5 = {4{`RANDOM}};
  buffer_5 = _RAND_5[127:0];
  _RAND_6 = {4{`RANDOM}};
  buffer_6 = _RAND_6[127:0];
  _RAND_7 = {4{`RANDOM}};
  buffer_7 = _RAND_7[127:0];
  _RAND_8 = {4{`RANDOM}};
  buffer_8 = _RAND_8[127:0];
  _RAND_9 = {4{`RANDOM}};
  buffer_9 = _RAND_9[127:0];
  _RAND_10 = {4{`RANDOM}};
  buffer_10 = _RAND_10[127:0];
  _RAND_11 = {4{`RANDOM}};
  buffer_11 = _RAND_11[127:0];
  _RAND_12 = {4{`RANDOM}};
  buffer_12 = _RAND_12[127:0];
  _RAND_13 = {4{`RANDOM}};
  buffer_13 = _RAND_13[127:0];
  _RAND_14 = {4{`RANDOM}};
  buffer_14 = _RAND_14[127:0];
  _RAND_15 = {4{`RANDOM}};
  buffer_15 = _RAND_15[127:0];
  _RAND_16 = {4{`RANDOM}};
  buffer_16 = _RAND_16[127:0];
  _RAND_17 = {4{`RANDOM}};
  buffer_17 = _RAND_17[127:0];
  _RAND_18 = {4{`RANDOM}};
  buffer_18 = _RAND_18[127:0];
  _RAND_19 = {4{`RANDOM}};
  buffer_19 = _RAND_19[127:0];
  _RAND_20 = {4{`RANDOM}};
  buffer_20 = _RAND_20[127:0];
  _RAND_21 = {4{`RANDOM}};
  buffer_21 = _RAND_21[127:0];
  _RAND_22 = {4{`RANDOM}};
  buffer_22 = _RAND_22[127:0];
  _RAND_23 = {4{`RANDOM}};
  buffer_23 = _RAND_23[127:0];
  _RAND_24 = {4{`RANDOM}};
  buffer_24 = _RAND_24[127:0];
  _RAND_25 = {4{`RANDOM}};
  buffer_25 = _RAND_25[127:0];
  _RAND_26 = {4{`RANDOM}};
  buffer_26 = _RAND_26[127:0];
  _RAND_27 = {4{`RANDOM}};
  buffer_27 = _RAND_27[127:0];
  _RAND_28 = {4{`RANDOM}};
  buffer_28 = _RAND_28[127:0];
  _RAND_29 = {4{`RANDOM}};
  buffer_29 = _RAND_29[127:0];
  _RAND_30 = {4{`RANDOM}};
  buffer_30 = _RAND_30[127:0];
  _RAND_31 = {4{`RANDOM}};
  buffer_31 = _RAND_31[127:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module regfile_4(
  input         clock,
  input         reset,
  input  [31:0] io_din,
  input  [4:0]  io_addrs,
  input         io_en,
  input         io_load,
  output [31:0] io_regout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] buffer_0; // @[regfile.scala 22:23]
  reg [31:0] buffer_1; // @[regfile.scala 22:23]
  reg [31:0] buffer_2; // @[regfile.scala 22:23]
  reg [31:0] buffer_3; // @[regfile.scala 22:23]
  reg [31:0] buffer_4; // @[regfile.scala 22:23]
  reg [31:0] buffer_5; // @[regfile.scala 22:23]
  reg [31:0] buffer_6; // @[regfile.scala 22:23]
  reg [31:0] buffer_7; // @[regfile.scala 22:23]
  reg [31:0] buffer_8; // @[regfile.scala 22:23]
  reg [31:0] buffer_9; // @[regfile.scala 22:23]
  reg [31:0] buffer_10; // @[regfile.scala 22:23]
  reg [31:0] buffer_11; // @[regfile.scala 22:23]
  reg [31:0] buffer_12; // @[regfile.scala 22:23]
  reg [31:0] buffer_13; // @[regfile.scala 22:23]
  reg [31:0] buffer_14; // @[regfile.scala 22:23]
  reg [31:0] buffer_15; // @[regfile.scala 22:23]
  reg [31:0] buffer_16; // @[regfile.scala 22:23]
  reg [31:0] buffer_17; // @[regfile.scala 22:23]
  reg [31:0] buffer_18; // @[regfile.scala 22:23]
  reg [31:0] buffer_19; // @[regfile.scala 22:23]
  reg [31:0] buffer_20; // @[regfile.scala 22:23]
  reg [31:0] buffer_21; // @[regfile.scala 22:23]
  reg [31:0] buffer_22; // @[regfile.scala 22:23]
  reg [31:0] buffer_23; // @[regfile.scala 22:23]
  reg [31:0] buffer_24; // @[regfile.scala 22:23]
  reg [31:0] buffer_25; // @[regfile.scala 22:23]
  reg [31:0] buffer_26; // @[regfile.scala 22:23]
  reg [31:0] buffer_27; // @[regfile.scala 22:23]
  reg [31:0] buffer_28; // @[regfile.scala 22:23]
  reg [31:0] buffer_29; // @[regfile.scala 22:23]
  reg [31:0] buffer_30; // @[regfile.scala 22:23]
  reg [31:0] buffer_31; // @[regfile.scala 22:23]
  wire [31:0] _GEN_33 = 5'h1 == io_addrs ? buffer_1 : buffer_0; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_34 = 5'h2 == io_addrs ? buffer_2 : _GEN_33; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_35 = 5'h3 == io_addrs ? buffer_3 : _GEN_34; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_36 = 5'h4 == io_addrs ? buffer_4 : _GEN_35; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_37 = 5'h5 == io_addrs ? buffer_5 : _GEN_36; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_38 = 5'h6 == io_addrs ? buffer_6 : _GEN_37; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_39 = 5'h7 == io_addrs ? buffer_7 : _GEN_38; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_40 = 5'h8 == io_addrs ? buffer_8 : _GEN_39; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_41 = 5'h9 == io_addrs ? buffer_9 : _GEN_40; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_42 = 5'ha == io_addrs ? buffer_10 : _GEN_41; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_43 = 5'hb == io_addrs ? buffer_11 : _GEN_42; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_44 = 5'hc == io_addrs ? buffer_12 : _GEN_43; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_45 = 5'hd == io_addrs ? buffer_13 : _GEN_44; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_46 = 5'he == io_addrs ? buffer_14 : _GEN_45; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_47 = 5'hf == io_addrs ? buffer_15 : _GEN_46; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_48 = 5'h10 == io_addrs ? buffer_16 : _GEN_47; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_49 = 5'h11 == io_addrs ? buffer_17 : _GEN_48; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_50 = 5'h12 == io_addrs ? buffer_18 : _GEN_49; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_51 = 5'h13 == io_addrs ? buffer_19 : _GEN_50; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_52 = 5'h14 == io_addrs ? buffer_20 : _GEN_51; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_53 = 5'h15 == io_addrs ? buffer_21 : _GEN_52; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_54 = 5'h16 == io_addrs ? buffer_22 : _GEN_53; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_55 = 5'h17 == io_addrs ? buffer_23 : _GEN_54; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_56 = 5'h18 == io_addrs ? buffer_24 : _GEN_55; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_57 = 5'h19 == io_addrs ? buffer_25 : _GEN_56; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_58 = 5'h1a == io_addrs ? buffer_26 : _GEN_57; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_59 = 5'h1b == io_addrs ? buffer_27 : _GEN_58; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_60 = 5'h1c == io_addrs ? buffer_28 : _GEN_59; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_61 = 5'h1d == io_addrs ? buffer_29 : _GEN_60; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_62 = 5'h1e == io_addrs ? buffer_30 : _GEN_61; // @[regfile.scala 38:{17,17}]
  wire [31:0] _GEN_63 = 5'h1f == io_addrs ? buffer_31 : _GEN_62; // @[regfile.scala 38:{17,17}]
  assign io_regout = ~io_load & io_en ? _GEN_63 : 32'h0; // @[regfile.scala 36:35 38:17 42:17]
  always @(posedge clock) begin
    if (reset) begin // @[regfile.scala 22:23]
      buffer_0 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h0 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_0 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_1 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_1 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_2 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h2 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_2 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_3 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h3 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_3 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_4 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h4 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_4 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_5 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h5 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_5 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_6 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h6 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_6 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_7 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h7 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_7 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_8 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h8 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_8 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_9 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h9 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_9 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_10 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'ha == io_addrs) begin // @[regfile.scala 33:24]
        buffer_10 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_11 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hb == io_addrs) begin // @[regfile.scala 33:24]
        buffer_11 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_12 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hc == io_addrs) begin // @[regfile.scala 33:24]
        buffer_12 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_13 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hd == io_addrs) begin // @[regfile.scala 33:24]
        buffer_13 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_14 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'he == io_addrs) begin // @[regfile.scala 33:24]
        buffer_14 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_15 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'hf == io_addrs) begin // @[regfile.scala 33:24]
        buffer_15 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_16 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h10 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_16 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_17 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h11 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_17 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_18 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h12 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_18 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_19 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h13 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_19 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_20 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h14 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_20 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_21 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h15 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_21 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_22 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h16 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_22 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_23 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h17 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_23 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_24 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h18 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_24 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_25 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h19 == io_addrs) begin // @[regfile.scala 33:24]
        buffer_25 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_26 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1a == io_addrs) begin // @[regfile.scala 33:24]
        buffer_26 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_27 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1b == io_addrs) begin // @[regfile.scala 33:24]
        buffer_27 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_28 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1c == io_addrs) begin // @[regfile.scala 33:24]
        buffer_28 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_29 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1d == io_addrs) begin // @[regfile.scala 33:24]
        buffer_29 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_30 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1e == io_addrs) begin // @[regfile.scala 33:24]
        buffer_30 <= io_din; // @[regfile.scala 33:24]
      end
    end
    if (reset) begin // @[regfile.scala 22:23]
      buffer_31 <= 32'h0; // @[regfile.scala 22:23]
    end else if (io_load & io_en) begin // @[regfile.scala 31:28]
      if (5'h1f == io_addrs) begin // @[regfile.scala 33:24]
        buffer_31 <= io_din; // @[regfile.scala 33:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  buffer_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  buffer_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  buffer_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  buffer_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  buffer_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  buffer_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  buffer_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  buffer_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  buffer_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  buffer_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  buffer_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  buffer_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  buffer_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  buffer_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  buffer_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  buffer_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  buffer_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  buffer_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  buffer_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  buffer_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  buffer_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  buffer_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  buffer_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  buffer_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  buffer_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  buffer_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  buffer_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  buffer_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  buffer_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  buffer_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  buffer_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  buffer_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module top_2dsys(
  input          clock,
  input          reset,
  input  [127:0] io_in,
  input          io_rw_co,
  input          io_ping_pong_wr,
  input          io_ping_pong_rd,
  input          io_wr_input,
  output         io_wr_ready,
  input          io_start,
  input          io_iormac,
  output         io_sys_busy,
  input          io_rd_output,
  output         io_rd_ready,
  output [127:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [127:0] _RAND_9;
  reg [127:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  bc_mmul_clock; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_reset; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_x_input_0; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_x_input_1; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_x_input_2; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_x_input_3; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_w_input_0; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_w_input_1; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_w_input_2; // @[top_2dsys.scala 37:31]
  wire [7:0] bc_mmul_io_w_input_3; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_0; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_1; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_2; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_3; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_4; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_5; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_6; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_7; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_8; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_9; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_10; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_11; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_12; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_13; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_14; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_input_valid_15; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_0; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_1; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_2; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_3; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_4; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_5; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_6; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_7; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_8; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_9; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_10; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_11; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_12; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_13; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_14; // @[top_2dsys.scala 37:31]
  wire  bc_mmul_io_iormac_15; // @[top_2dsys.scala 37:31]
  wire [31:0] bc_mmul_io_out_0; // @[top_2dsys.scala 37:31]
  wire [31:0] bc_mmul_io_out_1; // @[top_2dsys.scala 37:31]
  wire [31:0] bc_mmul_io_out_2; // @[top_2dsys.scala 37:31]
  wire [31:0] bc_mmul_io_out_3; // @[top_2dsys.scala 37:31]
  wire  demux4to1_io_in; // @[top_2dsys.scala 38:31]
  wire [1:0] demux4to1_io_sel; // @[top_2dsys.scala 38:31]
  wire  demux4to1_io_out0; // @[top_2dsys.scala 38:31]
  wire  demux4to1_io_out1; // @[top_2dsys.scala 38:31]
  wire  demux4to1_io_out2; // @[top_2dsys.scala 38:31]
  wire  demux4to1_io_out3; // @[top_2dsys.scala 38:31]
  wire  regfile_clock; // @[top_2dsys.scala 39:31]
  wire  regfile_reset; // @[top_2dsys.scala 39:31]
  wire [127:0] regfile_io_din; // @[top_2dsys.scala 39:31]
  wire [4:0] regfile_io_addrs; // @[top_2dsys.scala 39:31]
  wire  regfile_io_en; // @[top_2dsys.scala 39:31]
  wire  regfile_io_load; // @[top_2dsys.scala 39:31]
  wire [127:0] regfile_io_regout; // @[top_2dsys.scala 39:31]
  wire  regfile_1_clock; // @[top_2dsys.scala 40:31]
  wire  regfile_1_reset; // @[top_2dsys.scala 40:31]
  wire [127:0] regfile_1_io_din; // @[top_2dsys.scala 40:31]
  wire [4:0] regfile_1_io_addrs; // @[top_2dsys.scala 40:31]
  wire  regfile_1_io_en; // @[top_2dsys.scala 40:31]
  wire  regfile_1_io_load; // @[top_2dsys.scala 40:31]
  wire [127:0] regfile_1_io_regout; // @[top_2dsys.scala 40:31]
  wire  regfile_2_clock; // @[top_2dsys.scala 41:31]
  wire  regfile_2_reset; // @[top_2dsys.scala 41:31]
  wire [127:0] regfile_2_io_din; // @[top_2dsys.scala 41:31]
  wire [4:0] regfile_2_io_addrs; // @[top_2dsys.scala 41:31]
  wire  regfile_2_io_en; // @[top_2dsys.scala 41:31]
  wire  regfile_2_io_load; // @[top_2dsys.scala 41:31]
  wire [127:0] regfile_2_io_regout; // @[top_2dsys.scala 41:31]
  wire  regfile_3_clock; // @[top_2dsys.scala 42:31]
  wire  regfile_3_reset; // @[top_2dsys.scala 42:31]
  wire [127:0] regfile_3_io_din; // @[top_2dsys.scala 42:31]
  wire [4:0] regfile_3_io_addrs; // @[top_2dsys.scala 42:31]
  wire  regfile_3_io_en; // @[top_2dsys.scala 42:31]
  wire  regfile_3_io_load; // @[top_2dsys.scala 42:31]
  wire [127:0] regfile_3_io_regout; // @[top_2dsys.scala 42:31]
  wire  regfile_4_clock; // @[top_2dsys.scala 43:52]
  wire  regfile_4_reset; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_4_io_din; // @[top_2dsys.scala 43:52]
  wire [4:0] regfile_4_io_addrs; // @[top_2dsys.scala 43:52]
  wire  regfile_4_io_en; // @[top_2dsys.scala 43:52]
  wire  regfile_4_io_load; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_4_io_regout; // @[top_2dsys.scala 43:52]
  wire  regfile_5_clock; // @[top_2dsys.scala 43:52]
  wire  regfile_5_reset; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_5_io_din; // @[top_2dsys.scala 43:52]
  wire [4:0] regfile_5_io_addrs; // @[top_2dsys.scala 43:52]
  wire  regfile_5_io_en; // @[top_2dsys.scala 43:52]
  wire  regfile_5_io_load; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_5_io_regout; // @[top_2dsys.scala 43:52]
  wire  regfile_6_clock; // @[top_2dsys.scala 43:52]
  wire  regfile_6_reset; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_6_io_din; // @[top_2dsys.scala 43:52]
  wire [4:0] regfile_6_io_addrs; // @[top_2dsys.scala 43:52]
  wire  regfile_6_io_en; // @[top_2dsys.scala 43:52]
  wire  regfile_6_io_load; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_6_io_regout; // @[top_2dsys.scala 43:52]
  wire  regfile_7_clock; // @[top_2dsys.scala 43:52]
  wire  regfile_7_reset; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_7_io_din; // @[top_2dsys.scala 43:52]
  wire [4:0] regfile_7_io_addrs; // @[top_2dsys.scala 43:52]
  wire  regfile_7_io_en; // @[top_2dsys.scala 43:52]
  wire  regfile_7_io_load; // @[top_2dsys.scala 43:52]
  wire [31:0] regfile_7_io_regout; // @[top_2dsys.scala 43:52]
  reg  wr_fsm; // @[top_2dsys.scala 48:23]
  reg [1:0] matmul_fsm; // @[top_2dsys.scala 51:27]
  reg  rd_fsm; // @[top_2dsys.scala 54:23]
  reg [4:0] addr_count_wr; // @[top_2dsys.scala 59:36]
  reg [4:0] addr_count_rd; // @[top_2dsys.scala 60:36]
  reg [4:0] addr_count_out; // @[top_2dsys.scala 61:36]
  reg  reg_en; // @[top_2dsys.scala 62:36]
  reg  reg_load; // @[top_2dsys.scala 63:36]
  reg [1:0] demux_sel; // @[top_2dsys.scala 64:36]
  reg [127:0] x_input; // @[top_2dsys.scala 65:36]
  reg [127:0] w_input; // @[top_2dsys.scala 66:36]
  reg  iormac_reg_0; // @[top_2dsys.scala 67:36]
  reg  iormac_reg_1; // @[top_2dsys.scala 67:36]
  reg  iormac_reg_2; // @[top_2dsys.scala 67:36]
  reg  shiftRegister_0; // @[top_2dsys.scala 70:36]
  reg  shiftRegister_1; // @[top_2dsys.scala 70:36]
  reg  shiftRegister_2; // @[top_2dsys.scala 70:36]
  reg  shiftRegister_3; // @[top_2dsys.scala 70:36]
  reg  shiftRegister_4; // @[top_2dsys.scala 70:36]
  reg  shiftRegister_5; // @[top_2dsys.scala 70:36]
  reg  shiftRegister_6; // @[top_2dsys.scala 70:36]
  wire  _T = matmul_fsm == 2'h0; // @[top_2dsys.scala 78:51]
  wire [7:0] _T_34 = x_input[7:0]; // @[top_2dsys.scala 91:104]
  wire [7:0] _T_38 = x_input[15:8]; // @[top_2dsys.scala 91:104]
  wire [7:0] _T_42 = x_input[23:16]; // @[top_2dsys.scala 91:104]
  wire [7:0] _T_46 = x_input[31:24]; // @[top_2dsys.scala 91:104]
  wire [7:0] _T_50 = w_input[7:0]; // @[top_2dsys.scala 95:104]
  wire [7:0] _T_54 = w_input[15:8]; // @[top_2dsys.scala 95:104]
  wire [7:0] _T_58 = w_input[23:16]; // @[top_2dsys.scala 95:104]
  wire [7:0] _T_62 = w_input[31:24]; // @[top_2dsys.scala 95:104]
  wire  _io_rd_ready_T = ~rd_fsm; // @[top_2dsys.scala 111:43]
  wire  _io_wr_ready_T = ~wr_fsm; // @[top_2dsys.scala 112:43]
  wire [31:0] reg_out_1_regout = regfile_5_io_regout; // @[top_2dsys.scala 43:{30,30}]
  wire [31:0] reg_out_0_regout = regfile_4_io_regout; // @[top_2dsys.scala 43:{30,30}]
  wire [63:0] io_out_lo = {reg_out_1_regout,reg_out_0_regout}; // @[Cat.scala 33:92]
  wire [31:0] reg_out_3_regout = regfile_7_io_regout; // @[top_2dsys.scala 43:{30,30}]
  wire [31:0] reg_out_2_regout = regfile_6_io_regout; // @[top_2dsys.scala 43:{30,30}]
  wire [63:0] io_out_hi = {reg_out_3_regout,reg_out_2_regout}; // @[Cat.scala 33:92]
  wire  _GEN_0 = io_ping_pong_wr ? 1'h0 : 1'h1; // @[top_2dsys.scala 171:42 172:30 174:30]
  wire  _T_103 = io_wr_input & ~io_rw_co; // @[top_2dsys.scala 176:39]
  wire [1:0] _GEN_1 = io_ping_pong_wr ? 2'h2 : 2'h3; // @[top_2dsys.scala 179:42 180:30 182:30]
  wire  _GEN_4 = io_wr_input & io_rw_co | _T_103; // @[top_2dsys.scala 168:58 169:30]
  wire [4:0] _addr_count_wr_T_1 = addr_count_wr + 5'h1; // @[top_2dsys.scala 190:46]
  wire  _GEN_7 = io_wr_input & reg_load; // @[top_2dsys.scala 191:35 195:31 63:36]
  wire  _GEN_11 = _io_wr_ready_T | reg_en; // @[top_2dsys.scala 164:18 166:30 62:36]
  wire [4:0] _addr_count_rd_T_1 = addr_count_rd + 5'h1; // @[top_2dsys.scala 211:46]
  wire [4:0] _GEN_16 = io_start ? _addr_count_rd_T_1 : 5'h0; // @[top_2dsys.scala 209:29 210:33 211:29]
  wire [1:0] _matmul_fsm_T_1 = ~iormac_reg_2 ? 2'h3 : 2'h2; // @[top_2dsys.scala 224:35]
  wire [1:0] _GEN_20 = addr_count_rd >= 5'h3 ? 2'h0 : matmul_fsm; // @[top_2dsys.scala 228:47 229:31 51:27]
  wire [4:0] _GEN_21 = 2'h3 == matmul_fsm ? _addr_count_rd_T_1 : addr_count_rd; // @[top_2dsys.scala 207:21 227:31 60:36]
  wire [1:0] _GEN_22 = 2'h3 == matmul_fsm ? _GEN_20 : matmul_fsm; // @[top_2dsys.scala 207:21 51:27]
  wire  _GEN_29 = io_rd_output | rd_fsm; // @[top_2dsys.scala 242:37 243:31 54:23]
  wire [4:0] _addr_count_out_T_1 = addr_count_out + 5'h1; // @[top_2dsys.scala 251:52]
  bc_mmul bc_mmul ( // @[top_2dsys.scala 37:31]
    .clock(bc_mmul_clock),
    .reset(bc_mmul_reset),
    .io_x_input_0(bc_mmul_io_x_input_0),
    .io_x_input_1(bc_mmul_io_x_input_1),
    .io_x_input_2(bc_mmul_io_x_input_2),
    .io_x_input_3(bc_mmul_io_x_input_3),
    .io_w_input_0(bc_mmul_io_w_input_0),
    .io_w_input_1(bc_mmul_io_w_input_1),
    .io_w_input_2(bc_mmul_io_w_input_2),
    .io_w_input_3(bc_mmul_io_w_input_3),
    .io_input_valid_0(bc_mmul_io_input_valid_0),
    .io_input_valid_1(bc_mmul_io_input_valid_1),
    .io_input_valid_2(bc_mmul_io_input_valid_2),
    .io_input_valid_3(bc_mmul_io_input_valid_3),
    .io_input_valid_4(bc_mmul_io_input_valid_4),
    .io_input_valid_5(bc_mmul_io_input_valid_5),
    .io_input_valid_6(bc_mmul_io_input_valid_6),
    .io_input_valid_7(bc_mmul_io_input_valid_7),
    .io_input_valid_8(bc_mmul_io_input_valid_8),
    .io_input_valid_9(bc_mmul_io_input_valid_9),
    .io_input_valid_10(bc_mmul_io_input_valid_10),
    .io_input_valid_11(bc_mmul_io_input_valid_11),
    .io_input_valid_12(bc_mmul_io_input_valid_12),
    .io_input_valid_13(bc_mmul_io_input_valid_13),
    .io_input_valid_14(bc_mmul_io_input_valid_14),
    .io_input_valid_15(bc_mmul_io_input_valid_15),
    .io_iormac_0(bc_mmul_io_iormac_0),
    .io_iormac_1(bc_mmul_io_iormac_1),
    .io_iormac_2(bc_mmul_io_iormac_2),
    .io_iormac_3(bc_mmul_io_iormac_3),
    .io_iormac_4(bc_mmul_io_iormac_4),
    .io_iormac_5(bc_mmul_io_iormac_5),
    .io_iormac_6(bc_mmul_io_iormac_6),
    .io_iormac_7(bc_mmul_io_iormac_7),
    .io_iormac_8(bc_mmul_io_iormac_8),
    .io_iormac_9(bc_mmul_io_iormac_9),
    .io_iormac_10(bc_mmul_io_iormac_10),
    .io_iormac_11(bc_mmul_io_iormac_11),
    .io_iormac_12(bc_mmul_io_iormac_12),
    .io_iormac_13(bc_mmul_io_iormac_13),
    .io_iormac_14(bc_mmul_io_iormac_14),
    .io_iormac_15(bc_mmul_io_iormac_15),
    .io_out_0(bc_mmul_io_out_0),
    .io_out_1(bc_mmul_io_out_1),
    .io_out_2(bc_mmul_io_out_2),
    .io_out_3(bc_mmul_io_out_3)
  );
  demux4to1 demux4to1 ( // @[top_2dsys.scala 38:31]
    .io_in(demux4to1_io_in),
    .io_sel(demux4to1_io_sel),
    .io_out0(demux4to1_io_out0),
    .io_out1(demux4to1_io_out1),
    .io_out2(demux4to1_io_out2),
    .io_out3(demux4to1_io_out3)
  );
  regfile regfile ( // @[top_2dsys.scala 39:31]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_din(regfile_io_din),
    .io_addrs(regfile_io_addrs),
    .io_en(regfile_io_en),
    .io_load(regfile_io_load),
    .io_regout(regfile_io_regout)
  );
  regfile regfile_1 ( // @[top_2dsys.scala 40:31]
    .clock(regfile_1_clock),
    .reset(regfile_1_reset),
    .io_din(regfile_1_io_din),
    .io_addrs(regfile_1_io_addrs),
    .io_en(regfile_1_io_en),
    .io_load(regfile_1_io_load),
    .io_regout(regfile_1_io_regout)
  );
  regfile regfile_2 ( // @[top_2dsys.scala 41:31]
    .clock(regfile_2_clock),
    .reset(regfile_2_reset),
    .io_din(regfile_2_io_din),
    .io_addrs(regfile_2_io_addrs),
    .io_en(regfile_2_io_en),
    .io_load(regfile_2_io_load),
    .io_regout(regfile_2_io_regout)
  );
  regfile regfile_3 ( // @[top_2dsys.scala 42:31]
    .clock(regfile_3_clock),
    .reset(regfile_3_reset),
    .io_din(regfile_3_io_din),
    .io_addrs(regfile_3_io_addrs),
    .io_en(regfile_3_io_en),
    .io_load(regfile_3_io_load),
    .io_regout(regfile_3_io_regout)
  );
  regfile_4 regfile_4 ( // @[top_2dsys.scala 43:52]
    .clock(regfile_4_clock),
    .reset(regfile_4_reset),
    .io_din(regfile_4_io_din),
    .io_addrs(regfile_4_io_addrs),
    .io_en(regfile_4_io_en),
    .io_load(regfile_4_io_load),
    .io_regout(regfile_4_io_regout)
  );
  regfile_4 regfile_5 ( // @[top_2dsys.scala 43:52]
    .clock(regfile_5_clock),
    .reset(regfile_5_reset),
    .io_din(regfile_5_io_din),
    .io_addrs(regfile_5_io_addrs),
    .io_en(regfile_5_io_en),
    .io_load(regfile_5_io_load),
    .io_regout(regfile_5_io_regout)
  );
  regfile_4 regfile_6 ( // @[top_2dsys.scala 43:52]
    .clock(regfile_6_clock),
    .reset(regfile_6_reset),
    .io_din(regfile_6_io_din),
    .io_addrs(regfile_6_io_addrs),
    .io_en(regfile_6_io_en),
    .io_load(regfile_6_io_load),
    .io_regout(regfile_6_io_regout)
  );
  regfile_4 regfile_7 ( // @[top_2dsys.scala 43:52]
    .clock(regfile_7_clock),
    .reset(regfile_7_reset),
    .io_din(regfile_7_io_din),
    .io_addrs(regfile_7_io_addrs),
    .io_en(regfile_7_io_en),
    .io_load(regfile_7_io_load),
    .io_regout(regfile_7_io_regout)
  );
  assign io_wr_ready = ~wr_fsm ? 1'h0 : 1'h1; // @[top_2dsys.scala 112:35]
  assign io_sys_busy = _T ? 1'h0 : 1'h1; // @[top_2dsys.scala 110:35]
  assign io_rd_ready = ~rd_fsm ? 1'h0 : 1'h1; // @[top_2dsys.scala 111:35]
  assign io_out = {io_out_hi,io_out_lo}; // @[Cat.scala 33:92]
  assign bc_mmul_clock = clock;
  assign bc_mmul_reset = reset;
  assign bc_mmul_io_x_input_0 = _T ? $signed(8'sh0) : $signed(_T_34); // @[top_2dsys.scala 91:38]
  assign bc_mmul_io_x_input_1 = _T ? $signed(8'sh0) : $signed(_T_38); // @[top_2dsys.scala 91:38]
  assign bc_mmul_io_x_input_2 = _T ? $signed(8'sh0) : $signed(_T_42); // @[top_2dsys.scala 91:38]
  assign bc_mmul_io_x_input_3 = _T ? $signed(8'sh0) : $signed(_T_46); // @[top_2dsys.scala 91:38]
  assign bc_mmul_io_w_input_0 = _T ? $signed(8'sh0) : $signed(_T_50); // @[top_2dsys.scala 95:38]
  assign bc_mmul_io_w_input_1 = _T ? $signed(8'sh0) : $signed(_T_54); // @[top_2dsys.scala 95:38]
  assign bc_mmul_io_w_input_2 = _T ? $signed(8'sh0) : $signed(_T_58); // @[top_2dsys.scala 95:38]
  assign bc_mmul_io_w_input_3 = _T ? $signed(8'sh0) : $signed(_T_62); // @[top_2dsys.scala 95:38]
  assign bc_mmul_io_input_valid_0 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_1 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_2 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_3 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_4 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_5 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_6 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_7 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_8 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_9 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_10 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_11 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_12 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_13 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_14 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_input_valid_15 = matmul_fsm == 2'h0 ? 1'h0 : io_start; // @[top_2dsys.scala 78:39]
  assign bc_mmul_io_iormac_0 = io_iormac ? io_iormac : shiftRegister_0; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_1 = io_iormac ? io_iormac : shiftRegister_0; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_2 = io_iormac ? io_iormac : shiftRegister_0; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_3 = io_iormac ? io_iormac : shiftRegister_0; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_4 = io_iormac ? io_iormac : shiftRegister_2; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_5 = io_iormac ? io_iormac : shiftRegister_2; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_6 = io_iormac ? io_iormac : shiftRegister_2; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_7 = io_iormac ? io_iormac : shiftRegister_2; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_8 = io_iormac ? io_iormac : shiftRegister_4; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_9 = io_iormac ? io_iormac : shiftRegister_4; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_10 = io_iormac ? io_iormac : shiftRegister_4; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_11 = io_iormac ? io_iormac : shiftRegister_4; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_12 = io_iormac ? io_iormac : shiftRegister_6; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_13 = io_iormac ? io_iormac : shiftRegister_6; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_14 = io_iormac ? io_iormac : shiftRegister_6; // @[top_2dsys.scala 105:53]
  assign bc_mmul_io_iormac_15 = io_iormac ? io_iormac : shiftRegister_6; // @[top_2dsys.scala 105:53]
  assign demux4to1_io_in = reg_load; // @[top_2dsys.scala 130:29]
  assign demux4to1_io_sel = demux_sel; // @[top_2dsys.scala 131:29]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_din = io_in; // @[top_2dsys.scala 119:29]
  assign regfile_io_addrs = demux_sel == 2'h0 & io_wr_ready ? addr_count_wr : addr_count_rd; // @[top_2dsys.scala 137:35]
  assign regfile_io_en = reg_en; // @[top_2dsys.scala 125:29]
  assign regfile_io_load = demux4to1_io_out0; // @[top_2dsys.scala 132:29]
  assign regfile_1_clock = clock;
  assign regfile_1_reset = reset;
  assign regfile_1_io_din = io_in; // @[top_2dsys.scala 121:29]
  assign regfile_1_io_addrs = demux_sel == 2'h2 & io_wr_ready ? addr_count_wr : addr_count_rd; // @[top_2dsys.scala 139:35]
  assign regfile_1_io_en = reg_en; // @[top_2dsys.scala 127:29]
  assign regfile_1_io_load = demux4to1_io_out2; // @[top_2dsys.scala 134:29]
  assign regfile_2_clock = clock;
  assign regfile_2_reset = reset;
  assign regfile_2_io_din = io_in; // @[top_2dsys.scala 120:29]
  assign regfile_2_io_addrs = demux_sel == 2'h1 & io_wr_ready ? addr_count_wr : addr_count_rd; // @[top_2dsys.scala 138:35]
  assign regfile_2_io_en = reg_en; // @[top_2dsys.scala 126:29]
  assign regfile_2_io_load = demux4to1_io_out1; // @[top_2dsys.scala 133:29]
  assign regfile_3_clock = clock;
  assign regfile_3_reset = reset;
  assign regfile_3_io_din = io_in; // @[top_2dsys.scala 122:29]
  assign regfile_3_io_addrs = demux_sel == 2'h3 & io_wr_ready ? addr_count_wr : addr_count_rd; // @[top_2dsys.scala 140:35]
  assign regfile_3_io_en = reg_en; // @[top_2dsys.scala 128:29]
  assign regfile_3_io_load = demux4to1_io_out3; // @[top_2dsys.scala 135:29]
  assign regfile_4_clock = clock;
  assign regfile_4_reset = reset;
  assign regfile_4_io_din = bc_mmul_io_out_0; // @[top_2dsys.scala 149:51]
  assign regfile_4_io_addrs = rd_fsm ? addr_count_out : addr_count_rd; // @[top_2dsys.scala 150:42]
  assign regfile_4_io_en = reg_en; // @[top_2dsys.scala 43:30 151:36]
  assign regfile_4_io_load = matmul_fsm == 2'h3; // @[top_2dsys.scala 152:54]
  assign regfile_5_clock = clock;
  assign regfile_5_reset = reset;
  assign regfile_5_io_din = bc_mmul_io_out_1; // @[top_2dsys.scala 149:51]
  assign regfile_5_io_addrs = rd_fsm ? addr_count_out : addr_count_rd; // @[top_2dsys.scala 150:42]
  assign regfile_5_io_en = reg_en; // @[top_2dsys.scala 43:30 151:36]
  assign regfile_5_io_load = matmul_fsm == 2'h3; // @[top_2dsys.scala 152:54]
  assign regfile_6_clock = clock;
  assign regfile_6_reset = reset;
  assign regfile_6_io_din = bc_mmul_io_out_2; // @[top_2dsys.scala 149:51]
  assign regfile_6_io_addrs = rd_fsm ? addr_count_out : addr_count_rd; // @[top_2dsys.scala 150:42]
  assign regfile_6_io_en = reg_en; // @[top_2dsys.scala 43:30 151:36]
  assign regfile_6_io_load = matmul_fsm == 2'h3; // @[top_2dsys.scala 152:54]
  assign regfile_7_clock = clock;
  assign regfile_7_reset = reset;
  assign regfile_7_io_din = bc_mmul_io_out_3; // @[top_2dsys.scala 149:51]
  assign regfile_7_io_addrs = rd_fsm ? addr_count_out : addr_count_rd; // @[top_2dsys.scala 150:42]
  assign regfile_7_io_en = reg_en; // @[top_2dsys.scala 43:30 151:36]
  assign regfile_7_io_load = matmul_fsm == 2'h3; // @[top_2dsys.scala 152:54]
  always @(posedge clock) begin
    if (reset) begin // @[top_2dsys.scala 48:23]
      wr_fsm <= 1'h0; // @[top_2dsys.scala 48:23]
    end else if (_io_wr_ready_T) begin // @[top_2dsys.scala 164:18]
      wr_fsm <= _GEN_4;
    end else if (wr_fsm) begin // @[top_2dsys.scala 164:18]
      wr_fsm <= io_wr_input;
    end
    if (reset) begin // @[top_2dsys.scala 51:27]
      matmul_fsm <= 2'h0; // @[top_2dsys.scala 51:27]
    end else if (2'h0 == matmul_fsm) begin // @[top_2dsys.scala 207:21]
      if (io_start) begin // @[top_2dsys.scala 210:33]
        matmul_fsm <= 2'h1; // @[top_2dsys.scala 212:29]
      end
    end else if (2'h1 == matmul_fsm) begin // @[top_2dsys.scala 207:21]
      if (!(io_start)) begin // @[top_2dsys.scala 216:33]
        matmul_fsm <= 2'h2; // @[top_2dsys.scala 220:30]
      end
    end else if (2'h2 == matmul_fsm) begin // @[top_2dsys.scala 207:21]
      matmul_fsm <= _matmul_fsm_T_1; // @[top_2dsys.scala 224:29]
    end else begin
      matmul_fsm <= _GEN_22;
    end
    if (reset) begin // @[top_2dsys.scala 54:23]
      rd_fsm <= 1'h0; // @[top_2dsys.scala 54:23]
    end else if (_io_rd_ready_T) begin // @[top_2dsys.scala 239:17]
      rd_fsm <= _GEN_29;
    end else if (rd_fsm) begin // @[top_2dsys.scala 239:17]
      if (addr_count_out >= 5'h3) begin // @[top_2dsys.scala 247:46]
        rd_fsm <= 1'h0; // @[top_2dsys.scala 249:32]
      end
    end
    if (reset) begin // @[top_2dsys.scala 59:36]
      addr_count_wr <= 5'h0; // @[top_2dsys.scala 59:36]
    end else if (_io_wr_ready_T) begin // @[top_2dsys.scala 164:18]
      addr_count_wr <= 5'h0; // @[top_2dsys.scala 167:29]
    end else if (wr_fsm) begin // @[top_2dsys.scala 164:18]
      addr_count_wr <= _addr_count_wr_T_1; // @[top_2dsys.scala 190:29]
    end
    if (reset) begin // @[top_2dsys.scala 60:36]
      addr_count_rd <= 5'h0; // @[top_2dsys.scala 60:36]
    end else if (2'h0 == matmul_fsm) begin // @[top_2dsys.scala 207:21]
      addr_count_rd <= _GEN_16;
    end else if (2'h1 == matmul_fsm) begin // @[top_2dsys.scala 207:21]
      addr_count_rd <= _GEN_16;
    end else if (!(2'h2 == matmul_fsm)) begin // @[top_2dsys.scala 207:21]
      addr_count_rd <= _GEN_21;
    end
    if (reset) begin // @[top_2dsys.scala 61:36]
      addr_count_out <= 5'h0; // @[top_2dsys.scala 61:36]
    end else if (_io_rd_ready_T) begin // @[top_2dsys.scala 239:17]
      addr_count_out <= 5'h0; // @[top_2dsys.scala 241:31]
    end else if (rd_fsm) begin // @[top_2dsys.scala 239:17]
      if (addr_count_out >= 5'h3) begin // @[top_2dsys.scala 247:46]
        addr_count_out <= 5'h0; // @[top_2dsys.scala 248:32]
      end else begin
        addr_count_out <= _addr_count_out_T_1; // @[top_2dsys.scala 251:34]
      end
    end
    if (reset) begin // @[top_2dsys.scala 62:36]
      reg_en <= 1'h0; // @[top_2dsys.scala 62:36]
    end else begin
      reg_en <= _GEN_11;
    end
    if (reset) begin // @[top_2dsys.scala 63:36]
      reg_load <= 1'h0; // @[top_2dsys.scala 63:36]
    end else if (_io_wr_ready_T) begin // @[top_2dsys.scala 164:18]
      reg_load <= _GEN_4;
    end else if (wr_fsm) begin // @[top_2dsys.scala 164:18]
      reg_load <= _GEN_7;
    end
    if (reset) begin // @[top_2dsys.scala 64:36]
      demux_sel <= 2'h2; // @[top_2dsys.scala 64:36]
    end else if (_io_wr_ready_T) begin // @[top_2dsys.scala 164:18]
      if (io_wr_input & io_rw_co) begin // @[top_2dsys.scala 168:58]
        demux_sel <= {{1'd0}, _GEN_0};
      end else if (io_wr_input & ~io_rw_co) begin // @[top_2dsys.scala 176:62]
        demux_sel <= _GEN_1;
      end
    end
    if (reset) begin // @[top_2dsys.scala 65:36]
      x_input <= 128'h0; // @[top_2dsys.scala 65:36]
    end else if (io_ping_pong_rd) begin // @[top_2dsys.scala 87:34]
      x_input <= regfile_io_regout;
    end else begin
      x_input <= regfile_2_io_regout;
    end
    if (reset) begin // @[top_2dsys.scala 66:36]
      w_input <= 128'h0; // @[top_2dsys.scala 66:36]
    end else if (io_ping_pong_rd) begin // @[top_2dsys.scala 88:34]
      w_input <= regfile_1_io_regout;
    end else begin
      w_input <= regfile_3_io_regout;
    end
    iormac_reg_0 <= reset | io_iormac; // @[top_2dsys.scala 67:{36,36} 85:28]
    iormac_reg_1 <= reset | iormac_reg_0; // @[top_2dsys.scala 67:{36,36} 99:32]
    iormac_reg_2 <= reset | iormac_reg_1; // @[top_2dsys.scala 67:{36,36} 99:32]
    shiftRegister_0 <= reset | io_iormac; // @[top_2dsys.scala 70:{36,36} 84:28]
    shiftRegister_1 <= reset | shiftRegister_0; // @[top_2dsys.scala 70:{36,36} 81:28]
    shiftRegister_2 <= reset | shiftRegister_1; // @[top_2dsys.scala 70:{36,36} 81:28]
    shiftRegister_3 <= reset | shiftRegister_2; // @[top_2dsys.scala 70:{36,36} 81:28]
    shiftRegister_4 <= reset | shiftRegister_3; // @[top_2dsys.scala 70:{36,36} 81:28]
    shiftRegister_5 <= reset | shiftRegister_4; // @[top_2dsys.scala 70:{36,36} 81:28]
    shiftRegister_6 <= reset | shiftRegister_5; // @[top_2dsys.scala 70:{36,36} 81:28]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  wr_fsm = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  matmul_fsm = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rd_fsm = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  addr_count_wr = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  addr_count_rd = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  addr_count_out = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  reg_en = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  reg_load = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  demux_sel = _RAND_8[1:0];
  _RAND_9 = {4{`RANDOM}};
  x_input = _RAND_9[127:0];
  _RAND_10 = {4{`RANDOM}};
  w_input = _RAND_10[127:0];
  _RAND_11 = {1{`RANDOM}};
  iormac_reg_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  iormac_reg_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  iormac_reg_2 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  shiftRegister_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  shiftRegister_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  shiftRegister_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  shiftRegister_3 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  shiftRegister_4 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  shiftRegister_5 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  shiftRegister_6 = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
