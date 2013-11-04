//---------------------------------------------------------------------------
// Title      : FF Synchronizer with Enable
// Project    : 10 Gigabit Ethernet PCS/PMA Core
// File       : ten_gig_eth_pcs_pma_ip_ff_synchronizer_en.v
// Author     : Xilinx Inc.
// Description: This module provides a parameterizable multi stage 
//              FF Synchronizer with appropriate synth attributes
//              to mark ASYNC_REG and prevent SRL inference
//              An active high enable is included 
//---------------------------------------------------------------------------
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and 
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------

`timescale 1ns / 1ps

module ten_gig_eth_pcs_pma_ip_ff_synchronizer_en #(
  parameter   C_NUM_SYNC_REGS = 3
  )
  (
    input   wire  clk,
    input   wire  en,
    input   wire  data_in,
    output  wire  data_out
  );
  
(* shreg_extract = "no", ASYNC_REG = "TRUE" *) reg  [C_NUM_SYNC_REGS-1:0]    sync1_en_r = {C_NUM_SYNC_REGS{1'b0}};

  //----------------------------------------------------------------------------
  // Synchronizer
  //----------------------------------------------------------------------------
  always @(posedge clk) begin
    if(en)
      sync1_en_r <= {sync1_en_r[C_NUM_SYNC_REGS-2:0], data_in};
  end    
  
  assign data_out = sync1_en_r[C_NUM_SYNC_REGS-1];
endmodule
