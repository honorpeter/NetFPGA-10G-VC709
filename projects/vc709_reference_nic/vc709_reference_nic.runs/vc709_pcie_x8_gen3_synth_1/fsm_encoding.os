
 add_fsm_encoding \
       {vc709_pcie_x8_gen3_pcie_init_ctrl_7vx.reg_state} \
       { }  \
       {{000 00000001} {001 00000010} {010 00000100} {011 00001000} {100 00010000} {101 00100000} {111 01000000} {110 10000000} }

 add_fsm_encoding \
       {vc709_pcie_x8_gen3_pipe_reset.fsm} \
       { }  \
       {{00001 000000000000000001} {00010 000000000000000010} {00101 000000000000000100} {00110 000000000000001000} {00011 000000000000010000} {00100 000000000000100000} {00111 000000000001000000} {01000 000000000010000000} {01001 000000000100000000} {01010 000000001000000000} {01011 000000010000000000} {01100 000000100000000000} {01101 000001000000000000} {01110 000010000000000000} {01111 000100000000000000} {10000 001000000000000000} {00000 010000000000000000} }

 add_fsm_encoding \
       {vc709_pcie_x8_gen3_rxeq_scan.fsm} \
       { }  \
       {{0000 000001} {0001 000010} {0010 000100} {0100 001000} {1000 010000} }

 add_fsm_encoding \
       {vc709_pcie_x8_gen3_pipe_eq.fsm_tx} \
       { }  \
       {{000000 00000001} {000001 00000010} {000010 00000100} {000100 00001000} {001000 00010000} {010000 00100000} {100000 01000000} }

 add_fsm_encoding \
       {vc709_pcie_x8_gen3_pipe_eq.fsm_rx} \
       { }  \
       {{000000 00000001} {000001 00000010} {000010 00000100} {000100 00001000} {001000 00010000} {010000 00100000} {100000 01000000} }
