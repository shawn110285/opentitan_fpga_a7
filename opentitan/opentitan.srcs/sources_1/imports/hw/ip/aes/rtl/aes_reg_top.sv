// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`

module aes_reg_top (
  input clk_i,
  input rst_ni,

  // Below Regster interface can be changed
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,
  // To HW
  output aes_reg_pkg::aes_reg2hw_t reg2hw, // Write
  input  aes_reg_pkg::aes_hw2reg_t hw2reg, // Read

  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import aes_reg_pkg::* ;

  localparam AW = 7;
  localparam DW = 32;
  localparam DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  tlul_pkg::tl_h2d_t tl_reg_h2d;
  tlul_pkg::tl_d2h_t tl_reg_d2h;

  assign tl_reg_h2d = tl_i;
  assign tl_o       = tl_reg_d2h;

  tlul_adapter_reg #(
    .RegAw(AW),
    .RegDw(DW)
  ) u_reg_if (
    .clk_i,
    .rst_ni,

    .tl_i (tl_reg_h2d),
    .tl_o (tl_reg_d2h),

    .we_o    (reg_we),
    .re_o    (reg_re),
    .addr_o  (reg_addr),
    .wdata_o (reg_wdata),
    .be_o    (reg_be),
    .rdata_i (reg_rdata),
    .error_i (reg_error)
  );

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err ;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic [31:0] key0_wd;
  logic key0_we;
  logic [31:0] key1_wd;
  logic key1_we;
  logic [31:0] key2_wd;
  logic key2_we;
  logic [31:0] key3_wd;
  logic key3_we;
  logic [31:0] key4_wd;
  logic key4_we;
  logic [31:0] key5_wd;
  logic key5_we;
  logic [31:0] key6_wd;
  logic key6_we;
  logic [31:0] key7_wd;
  logic key7_we;
  logic [31:0] data_in0_wd;
  logic data_in0_we;
  logic [31:0] data_in1_wd;
  logic data_in1_we;
  logic [31:0] data_in2_wd;
  logic data_in2_we;
  logic [31:0] data_in3_wd;
  logic data_in3_we;
  logic [31:0] data_out0_qs;
  logic data_out0_re;
  logic [31:0] data_out1_qs;
  logic data_out1_re;
  logic [31:0] data_out2_qs;
  logic data_out2_re;
  logic [31:0] data_out3_qs;
  logic data_out3_re;
  logic ctrl_mode_qs;
  logic ctrl_mode_wd;
  logic ctrl_mode_we;
  logic [2:0] ctrl_key_len_qs;
  logic [2:0] ctrl_key_len_wd;
  logic ctrl_key_len_we;
  logic ctrl_manual_start_trigger_qs;
  logic ctrl_manual_start_trigger_wd;
  logic ctrl_manual_start_trigger_we;
  logic ctrl_force_data_overwrite_qs;
  logic ctrl_force_data_overwrite_wd;
  logic ctrl_force_data_overwrite_we;
  logic trigger_start_qs;
  logic trigger_start_wd;
  logic trigger_start_we;
  logic trigger_key_clear_qs;
  logic trigger_key_clear_wd;
  logic trigger_key_clear_we;
  logic trigger_data_out_clear_qs;
  logic trigger_data_out_clear_wd;
  logic trigger_data_out_clear_we;
  logic status_idle_qs;
  logic status_stall_qs;
  logic status_output_valid_qs;
  logic status_input_ready_qs;

  // Register instances

  // Subregister 0 of Multireg key
  // R[key0]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key0 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key0_we),
    .wd     (key0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[0].qe),
    .q      (reg2hw.key[0].q ),

    .qs     ()
  );

  // Subregister 1 of Multireg key
  // R[key1]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key1 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key1_we),
    .wd     (key1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[1].qe),
    .q      (reg2hw.key[1].q ),

    .qs     ()
  );

  // Subregister 2 of Multireg key
  // R[key2]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key2 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key2_we),
    .wd     (key2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[2].qe),
    .q      (reg2hw.key[2].q ),

    .qs     ()
  );

  // Subregister 3 of Multireg key
  // R[key3]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key3 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key3_we),
    .wd     (key3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[3].qe),
    .q      (reg2hw.key[3].q ),

    .qs     ()
  );

  // Subregister 4 of Multireg key
  // R[key4]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key4 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key4_we),
    .wd     (key4_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[4].qe),
    .q      (reg2hw.key[4].q ),

    .qs     ()
  );

  // Subregister 5 of Multireg key
  // R[key5]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key5 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key5_we),
    .wd     (key5_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[5].qe),
    .q      (reg2hw.key[5].q ),

    .qs     ()
  );

  // Subregister 6 of Multireg key
  // R[key6]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key6 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key6_we),
    .wd     (key6_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[6].qe),
    .q      (reg2hw.key[6].q ),

    .qs     ()
  );

  // Subregister 7 of Multireg key
  // R[key7]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_key7 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (key7_we),
    .wd     (key7_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.key[7].qe),
    .q      (reg2hw.key[7].q ),

    .qs     ()
  );



  // Subregister 0 of Multireg data_in
  // R[data_in0]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in0 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in0_we),
    .wd     (data_in0_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.data_in[0].qe),
    .q      (reg2hw.data_in[0].q ),

    .qs     ()
  );

  // Subregister 1 of Multireg data_in
  // R[data_in1]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in1 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in1_we),
    .wd     (data_in1_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.data_in[1].qe),
    .q      (reg2hw.data_in[1].q ),

    .qs     ()
  );

  // Subregister 2 of Multireg data_in
  // R[data_in2]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in2 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in2_we),
    .wd     (data_in2_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.data_in[2].qe),
    .q      (reg2hw.data_in[2].q ),

    .qs     ()
  );

  // Subregister 3 of Multireg data_in
  // R[data_in3]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in3 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in3_we),
    .wd     (data_in3_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.data_in[3].qe),
    .q      (reg2hw.data_in[3].q ),

    .qs     ()
  );



  // Subregister 0 of Multireg data_out
  // R[data_out0]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out0 (
    .re     (data_out0_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[0].d),
    .qre    (reg2hw.data_out[0].re),
    .qe     (),
    .q      (reg2hw.data_out[0].q ),
    .qs     (data_out0_qs)
  );

  // Subregister 1 of Multireg data_out
  // R[data_out1]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out1 (
    .re     (data_out1_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[1].d),
    .qre    (reg2hw.data_out[1].re),
    .qe     (),
    .q      (reg2hw.data_out[1].q ),
    .qs     (data_out1_qs)
  );

  // Subregister 2 of Multireg data_out
  // R[data_out2]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out2 (
    .re     (data_out2_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[2].d),
    .qre    (reg2hw.data_out[2].re),
    .qe     (),
    .q      (reg2hw.data_out[2].q ),
    .qs     (data_out2_qs)
  );

  // Subregister 3 of Multireg data_out
  // R[data_out3]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out3 (
    .re     (data_out3_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[3].d),
    .qre    (reg2hw.data_out[3].re),
    .qe     (),
    .q      (reg2hw.data_out[3].q ),
    .qs     (data_out3_qs)
  );


  // R[ctrl]: V(False)

  //   F[mode]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ctrl_mode (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ctrl_mode_we),
    .wd     (ctrl_mode_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.ctrl.mode.qe),
    .q      (reg2hw.ctrl.mode.q ),

    // to register interface (read)
    .qs     (ctrl_mode_qs)
  );


  //   F[key_len]: 3:1
  prim_subreg #(
    .DW      (3),
    .SWACCESS("RW"),
    .RESVAL  (3'h1)
  ) u_ctrl_key_len (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ctrl_key_len_we),
    .wd     (ctrl_key_len_wd),

    // from internal hardware
    .de     (hw2reg.ctrl.key_len.de),
    .d      (hw2reg.ctrl.key_len.d ),

    // to internal hardware
    .qe     (reg2hw.ctrl.key_len.qe),
    .q      (reg2hw.ctrl.key_len.q ),

    // to register interface (read)
    .qs     (ctrl_key_len_qs)
  );


  //   F[manual_start_trigger]: 4:4
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ctrl_manual_start_trigger (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ctrl_manual_start_trigger_we),
    .wd     (ctrl_manual_start_trigger_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.ctrl.manual_start_trigger.qe),
    .q      (reg2hw.ctrl.manual_start_trigger.q ),

    // to register interface (read)
    .qs     (ctrl_manual_start_trigger_qs)
  );


  //   F[force_data_overwrite]: 5:5
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_ctrl_force_data_overwrite (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (ctrl_force_data_overwrite_we),
    .wd     (ctrl_force_data_overwrite_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (reg2hw.ctrl.force_data_overwrite.qe),
    .q      (reg2hw.ctrl.force_data_overwrite.q ),

    // to register interface (read)
    .qs     (ctrl_force_data_overwrite_qs)
  );


  // R[trigger]: V(False)

  //   F[start]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_trigger_start (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_start_we),
    .wd     (trigger_start_wd),

    // from internal hardware
    .de     (hw2reg.trigger.start.de),
    .d      (hw2reg.trigger.start.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.start.q ),

    // to register interface (read)
    .qs     (trigger_start_qs)
  );


  //   F[key_clear]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_trigger_key_clear (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_key_clear_we),
    .wd     (trigger_key_clear_wd),

    // from internal hardware
    .de     (hw2reg.trigger.key_clear.de),
    .d      (hw2reg.trigger.key_clear.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.key_clear.q ),

    // to register interface (read)
    .qs     (trigger_key_clear_qs)
  );


  //   F[data_out_clear]: 2:2
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_trigger_data_out_clear (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_data_out_clear_we),
    .wd     (trigger_data_out_clear_wd),

    // from internal hardware
    .de     (hw2reg.trigger.data_out_clear.de),
    .d      (hw2reg.trigger.data_out_clear.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.data_out_clear.q ),

    // to register interface (read)
    .qs     (trigger_data_out_clear_qs)
  );


  // R[status]: V(False)

  //   F[idle]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_status_idle (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.idle.de),
    .d      (hw2reg.status.idle.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_idle_qs)
  );


  //   F[stall]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_status_stall (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.stall.de),
    .d      (hw2reg.status.stall.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_stall_qs)
  );


  //   F[output_valid]: 2:2
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_status_output_valid (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.output_valid.de),
    .d      (hw2reg.status.output_valid.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_output_valid_qs)
  );


  //   F[input_ready]: 3:3
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h1)
  ) u_status_input_ready (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.input_ready.de),
    .d      (hw2reg.status.input_ready.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_input_ready_qs)
  );




  logic [18:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == AES_KEY0_OFFSET);
    addr_hit[ 1] = (reg_addr == AES_KEY1_OFFSET);
    addr_hit[ 2] = (reg_addr == AES_KEY2_OFFSET);
    addr_hit[ 3] = (reg_addr == AES_KEY3_OFFSET);
    addr_hit[ 4] = (reg_addr == AES_KEY4_OFFSET);
    addr_hit[ 5] = (reg_addr == AES_KEY5_OFFSET);
    addr_hit[ 6] = (reg_addr == AES_KEY6_OFFSET);
    addr_hit[ 7] = (reg_addr == AES_KEY7_OFFSET);
    addr_hit[ 8] = (reg_addr == AES_DATA_IN0_OFFSET);
    addr_hit[ 9] = (reg_addr == AES_DATA_IN1_OFFSET);
    addr_hit[10] = (reg_addr == AES_DATA_IN2_OFFSET);
    addr_hit[11] = (reg_addr == AES_DATA_IN3_OFFSET);
    addr_hit[12] = (reg_addr == AES_DATA_OUT0_OFFSET);
    addr_hit[13] = (reg_addr == AES_DATA_OUT1_OFFSET);
    addr_hit[14] = (reg_addr == AES_DATA_OUT2_OFFSET);
    addr_hit[15] = (reg_addr == AES_DATA_OUT3_OFFSET);
    addr_hit[16] = (reg_addr == AES_CTRL_OFFSET);
    addr_hit[17] = (reg_addr == AES_TRIGGER_OFFSET);
    addr_hit[18] = (reg_addr == AES_STATUS_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = 1'b0;
    if (addr_hit[ 0] && reg_we && (AES_PERMIT[ 0] != (AES_PERMIT[ 0] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 1] && reg_we && (AES_PERMIT[ 1] != (AES_PERMIT[ 1] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 2] && reg_we && (AES_PERMIT[ 2] != (AES_PERMIT[ 2] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 3] && reg_we && (AES_PERMIT[ 3] != (AES_PERMIT[ 3] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 4] && reg_we && (AES_PERMIT[ 4] != (AES_PERMIT[ 4] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 5] && reg_we && (AES_PERMIT[ 5] != (AES_PERMIT[ 5] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 6] && reg_we && (AES_PERMIT[ 6] != (AES_PERMIT[ 6] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 7] && reg_we && (AES_PERMIT[ 7] != (AES_PERMIT[ 7] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 8] && reg_we && (AES_PERMIT[ 8] != (AES_PERMIT[ 8] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 9] && reg_we && (AES_PERMIT[ 9] != (AES_PERMIT[ 9] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[10] && reg_we && (AES_PERMIT[10] != (AES_PERMIT[10] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[11] && reg_we && (AES_PERMIT[11] != (AES_PERMIT[11] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[12] && reg_we && (AES_PERMIT[12] != (AES_PERMIT[12] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[13] && reg_we && (AES_PERMIT[13] != (AES_PERMIT[13] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[14] && reg_we && (AES_PERMIT[14] != (AES_PERMIT[14] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[15] && reg_we && (AES_PERMIT[15] != (AES_PERMIT[15] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[16] && reg_we && (AES_PERMIT[16] != (AES_PERMIT[16] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[17] && reg_we && (AES_PERMIT[17] != (AES_PERMIT[17] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[18] && reg_we && (AES_PERMIT[18] != (AES_PERMIT[18] & reg_be))) wr_err = 1'b1 ;
  end

  assign key0_we = addr_hit[0] & reg_we & ~wr_err;
  assign key0_wd = reg_wdata[31:0];

  assign key1_we = addr_hit[1] & reg_we & ~wr_err;
  assign key1_wd = reg_wdata[31:0];

  assign key2_we = addr_hit[2] & reg_we & ~wr_err;
  assign key2_wd = reg_wdata[31:0];

  assign key3_we = addr_hit[3] & reg_we & ~wr_err;
  assign key3_wd = reg_wdata[31:0];

  assign key4_we = addr_hit[4] & reg_we & ~wr_err;
  assign key4_wd = reg_wdata[31:0];

  assign key5_we = addr_hit[5] & reg_we & ~wr_err;
  assign key5_wd = reg_wdata[31:0];

  assign key6_we = addr_hit[6] & reg_we & ~wr_err;
  assign key6_wd = reg_wdata[31:0];

  assign key7_we = addr_hit[7] & reg_we & ~wr_err;
  assign key7_wd = reg_wdata[31:0];

  assign data_in0_we = addr_hit[8] & reg_we & ~wr_err;
  assign data_in0_wd = reg_wdata[31:0];

  assign data_in1_we = addr_hit[9] & reg_we & ~wr_err;
  assign data_in1_wd = reg_wdata[31:0];

  assign data_in2_we = addr_hit[10] & reg_we & ~wr_err;
  assign data_in2_wd = reg_wdata[31:0];

  assign data_in3_we = addr_hit[11] & reg_we & ~wr_err;
  assign data_in3_wd = reg_wdata[31:0];

  assign data_out0_re = addr_hit[12] && reg_re;

  assign data_out1_re = addr_hit[13] && reg_re;

  assign data_out2_re = addr_hit[14] && reg_re;

  assign data_out3_re = addr_hit[15] && reg_re;

  assign ctrl_mode_we = addr_hit[16] & reg_we & ~wr_err;
  assign ctrl_mode_wd = reg_wdata[0];

  assign ctrl_key_len_we = addr_hit[16] & reg_we & ~wr_err;
  assign ctrl_key_len_wd = reg_wdata[3:1];

  assign ctrl_manual_start_trigger_we = addr_hit[16] & reg_we & ~wr_err;
  assign ctrl_manual_start_trigger_wd = reg_wdata[4];

  assign ctrl_force_data_overwrite_we = addr_hit[16] & reg_we & ~wr_err;
  assign ctrl_force_data_overwrite_wd = reg_wdata[5];

  assign trigger_start_we = addr_hit[17] & reg_we & ~wr_err;
  assign trigger_start_wd = reg_wdata[0];

  assign trigger_key_clear_we = addr_hit[17] & reg_we & ~wr_err;
  assign trigger_key_clear_wd = reg_wdata[1];

  assign trigger_data_out_clear_we = addr_hit[17] & reg_we & ~wr_err;
  assign trigger_data_out_clear_wd = reg_wdata[2];





  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[1]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[2]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[3]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[4]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[5]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[6]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[7]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[8]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[9]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[10]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[11]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[12]: begin
        reg_rdata_next[31:0] = data_out0_qs;
      end

      addr_hit[13]: begin
        reg_rdata_next[31:0] = data_out1_qs;
      end

      addr_hit[14]: begin
        reg_rdata_next[31:0] = data_out2_qs;
      end

      addr_hit[15]: begin
        reg_rdata_next[31:0] = data_out3_qs;
      end

      addr_hit[16]: begin
        reg_rdata_next[0] = ctrl_mode_qs;
        reg_rdata_next[3:1] = ctrl_key_len_qs;
        reg_rdata_next[4] = ctrl_manual_start_trigger_qs;
        reg_rdata_next[5] = ctrl_force_data_overwrite_qs;
      end

      addr_hit[17]: begin
        reg_rdata_next[0] = trigger_start_qs;
        reg_rdata_next[1] = trigger_key_clear_qs;
        reg_rdata_next[2] = trigger_data_out_clear_qs;
      end

      addr_hit[18]: begin
        reg_rdata_next[0] = status_idle_qs;
        reg_rdata_next[1] = status_stall_qs;
        reg_rdata_next[2] = status_output_valid_qs;
        reg_rdata_next[3] = status_input_ready_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Assertions for Register Interface
  `ASSERT_PULSE(wePulse, reg_we, clk_i, !rst_ni)
  `ASSERT_PULSE(rePulse, reg_re, clk_i, !rst_ni)

  `ASSERT(reAfterRv, $rose(reg_re || reg_we) |=> tl_o.d_valid, clk_i, !rst_ni)

  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit), clk_i, !rst_ni)

  `ASSERT(reqParity, tl_reg_h2d.a_valid |-> tl_reg_h2d.a_user.parity_en == 1'b0, clk_i, !rst_ni)

endmodule
