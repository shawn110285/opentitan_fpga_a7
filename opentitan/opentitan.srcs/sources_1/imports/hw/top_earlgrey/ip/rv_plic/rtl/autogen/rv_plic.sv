// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
// util/topgen.py -t hw/top_earlgrey/doc/top_earlgrey.hjson --plic-only -o hw/top_earlgrey/

// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// RISC-V Platform-Level Interrupt Controller compliant INTC
//
//   Current version doesn't support MSI interrupt but it is easy to add
//   the feature. Create one external register and connect qe signal to the
//   gateway module (as edge-triggered)
//
//   Consider to set MAX_PRIO as small number as possible. It is main factor
//   of area increase if edge-triggered counter isn't implemented.
//
// verilog parameter
//   N_SOURCE: Number of interrupt sources
//   N_TARGET: Number of interrupt targets (#receptor)
//   MAX_PRIO: Maximum value of interrupt priority

module rv_plic #(
  parameter int N_SOURCE    = 55,
  parameter int N_TARGET    = 1,
  parameter     FIND_MAX    = "SEQUENTIAL", // SEQUENTIAL | MATRIX

  parameter int SRCW       = $clog2(N_SOURCE+1)  // derived parameter
) (
  input     clk_i,
  input     rst_ni,

  // Bus Interface (device)
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,

  // Interrupt Sources
  input  [N_SOURCE-1:0] intr_src_i,

  // Interrupt notification to targets
  output [N_TARGET-1:0] irq_o,
  output [SRCW-1:0]     irq_id_o [N_TARGET],

  output logic [N_TARGET-1:0] msip_o
);

  import rv_plic_reg_pkg::*;

  rv_plic_reg2hw_t reg2hw;
  rv_plic_hw2reg_t hw2reg;

  localparam int MAX_PRIO    = 3;
  localparam int PRIOW = $clog2(MAX_PRIO+1);

  logic [N_SOURCE-1:0] le; // 0:level 1:edge
  logic [N_SOURCE-1:0] ip;

  logic [N_SOURCE-1:0] ie [N_TARGET];

  logic [N_TARGET-1:0] claim_re; // Target read indicator
  logic [SRCW-1:0]     claim_id [N_TARGET];
  logic [N_SOURCE-1:0] claim; // Converted from claim_re/claim_id

  logic [N_TARGET-1:0] complete_we; // Target write indicator
  logic [SRCW-1:0]     complete_id [N_TARGET];
  logic [N_SOURCE-1:0] complete; // Converted from complete_re/complete_id

  logic [SRCW-1:0]     cc_id [N_TARGET]; // Write ID

  logic [PRIOW-1:0] prio [N_SOURCE];

  logic [PRIOW-1:0] threshold [N_TARGET];

  // Glue logic between rv_plic_reg_top and others
  assign cc_id = irq_id_o;

  always_comb begin
    claim = '0;
    for (int i = 0 ; i < N_TARGET ; i++) begin
      if (claim_re[i]) claim[claim_id[i] -1] = 1'b1;
    end
  end
  always_comb begin
    complete = '0;
    for (int i = 0 ; i < N_TARGET ; i++) begin
      if (complete_we[i]) complete[complete_id[i] -1] = 1'b1;
    end
  end

  //`ASSERT_PULSE(claimPulse, claim_re[i], clk_i, !rst_ni)
  //`ASSERT_PULSE(completePulse, complete_we[i], clk_i, !rst_ni)

  `ASSERT(onehot0Claim, $onehot0(claim_re), clk_i, !rst_ni)

  `ASSERT(onehot0Complete, $onehot0(complete_we), clk_i, !rst_ni)

  //////////////
  // Priority //
  //////////////
  assign prio[0] = reg2hw.prio0.q;
  assign prio[1] = reg2hw.prio1.q;
  assign prio[2] = reg2hw.prio2.q;
  assign prio[3] = reg2hw.prio3.q;
  assign prio[4] = reg2hw.prio4.q;
  assign prio[5] = reg2hw.prio5.q;
  assign prio[6] = reg2hw.prio6.q;
  assign prio[7] = reg2hw.prio7.q;
  assign prio[8] = reg2hw.prio8.q;
  assign prio[9] = reg2hw.prio9.q;
  assign prio[10] = reg2hw.prio10.q;
  assign prio[11] = reg2hw.prio11.q;
  assign prio[12] = reg2hw.prio12.q;
  assign prio[13] = reg2hw.prio13.q;
  assign prio[14] = reg2hw.prio14.q;
  assign prio[15] = reg2hw.prio15.q;
  assign prio[16] = reg2hw.prio16.q;
  assign prio[17] = reg2hw.prio17.q;
  assign prio[18] = reg2hw.prio18.q;
  assign prio[19] = reg2hw.prio19.q;
  assign prio[20] = reg2hw.prio20.q;
  assign prio[21] = reg2hw.prio21.q;
  assign prio[22] = reg2hw.prio22.q;
  assign prio[23] = reg2hw.prio23.q;
  assign prio[24] = reg2hw.prio24.q;
  assign prio[25] = reg2hw.prio25.q;
  assign prio[26] = reg2hw.prio26.q;
  assign prio[27] = reg2hw.prio27.q;
  assign prio[28] = reg2hw.prio28.q;
  assign prio[29] = reg2hw.prio29.q;
  assign prio[30] = reg2hw.prio30.q;
  assign prio[31] = reg2hw.prio31.q;
  assign prio[32] = reg2hw.prio32.q;
  assign prio[33] = reg2hw.prio33.q;
  assign prio[34] = reg2hw.prio34.q;
  assign prio[35] = reg2hw.prio35.q;
  assign prio[36] = reg2hw.prio36.q;
  assign prio[37] = reg2hw.prio37.q;
  assign prio[38] = reg2hw.prio38.q;
  assign prio[39] = reg2hw.prio39.q;
  assign prio[40] = reg2hw.prio40.q;
  assign prio[41] = reg2hw.prio41.q;
  assign prio[42] = reg2hw.prio42.q;
  assign prio[43] = reg2hw.prio43.q;
  assign prio[44] = reg2hw.prio44.q;
  assign prio[45] = reg2hw.prio45.q;
  assign prio[46] = reg2hw.prio46.q;
  assign prio[47] = reg2hw.prio47.q;
  assign prio[48] = reg2hw.prio48.q;
  assign prio[49] = reg2hw.prio49.q;
  assign prio[50] = reg2hw.prio50.q;
  assign prio[51] = reg2hw.prio51.q;
  assign prio[52] = reg2hw.prio52.q;
  assign prio[53] = reg2hw.prio53.q;
  assign prio[54] = reg2hw.prio54.q;

  //////////////////////
  // Interrupt Enable //
  //////////////////////
  for (genvar s = 0; s < 55; s++) begin : gen_ie0
    assign ie[0][s] = reg2hw.ie0[s].q;
  end

  ////////////////////////
  // THRESHOLD register //
  ////////////////////////
  assign threshold[0] = reg2hw.threshold0.q;

  /////////////////
  // CC register //
  /////////////////
  assign claim_re[0]    = reg2hw.cc0.re;
  assign claim_id[0]    = irq_id_o[0];
  assign complete_we[0] = reg2hw.cc0.qe;
  assign complete_id[0] = reg2hw.cc0.q;
  assign hw2reg.cc0.d   = cc_id[0];

  ///////////////////
  // MSIP register //
  ///////////////////
  assign msip_o[0] = reg2hw.msip0.q;

  ////////
  // IP //
  ////////
  for (genvar s = 0; s < 55; s++) begin : gen_ip
    assign hw2reg.ip[s].de = 1'b1; // Always write
    assign hw2reg.ip[s].d  = ip[s];
  end

  ///////////////////////////////////
  // Detection:: 0: Level, 1: Edge //
  ///////////////////////////////////
  for (genvar s = 0; s < 55; s++) begin : gen_le
    assign le[s] = reg2hw.le[s].q;
  end

  //////////////
  // Gateways //
  //////////////
  rv_plic_gateway #(
    .N_SOURCE (N_SOURCE)
  ) u_gateway (
    .clk_i,
    .rst_ni,

    .src (intr_src_i),
    .le,

    .claim,
    .complete,

    .ip
  );

  ///////////////////////////////////
  // Target interrupt notification //
  ///////////////////////////////////
  for (genvar i = 0 ; i < N_TARGET ; i++) begin : gen_target
    rv_plic_target #(
      .N_SOURCE (N_SOURCE),
      .MAX_PRIO (MAX_PRIO),
      .ALGORITHM(FIND_MAX)
    ) u_target (
      .clk_i,
      .rst_ni,

      .ip,
      .ie        (ie[i]),

      .prio,
      .threshold (threshold[i]),

      .irq       (irq_o[i]),
      .irq_id    (irq_id_o[i])

    );
  end

  ////////////////////////
  // Register interface //
  ////////////////////////
  //  Limitation of register tool prevents the module from having flexibility to parameters
  //  So, signals are manually tied at the top.
  rv_plic_reg_top u_reg (
    .clk_i,
    .rst_ni,

    .tl_i,
    .tl_o,

    .reg2hw,
    .hw2reg,

    .devmode_i  (1'b1)
  );

    // Assertions
  `ASSERT_KNOWN(TlKnownO_A, tl_o, clk_i, !rst_ni)
  `ASSERT_KNOWN(IrqKnownO_A, irq_o, clk_i, !rst_ni)
  `ASSERT_KNOWN(IrqIdKnownO_A, irq_id_o, clk_i, !rst_ni)
  `ASSERT_KNOWN(MsipKnownO_A, msip_o, clk_i, !rst_ni)

endmodule
