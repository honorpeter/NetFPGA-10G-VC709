# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx690tffg1761-2
set_property target_language Verilog [current_project]
set_property board xilinx.com:virtex7:vc709:1.0 [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property ip_repo_paths {
  /root/NetFPGA-10G-VC709-2013.3/projects/nf10_input_arbiter
  /root/NetFPGA-10G-VC709-2013.3/projects/nf10_bram_output_queues
  /root/NetFPGA-10G-VC709-2013.3/projects/nf10_nic_output_port_lookup
} [current_fileset]

read_ip /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.srcs/sources_1/ip/axis_async_fifo/axis_async_fifo.xci
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.srcs/sources_1/ip/axis_async_fifo/axis_async_fifo.xci]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.data/wt [current_project]
set_property parent.project_dir /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic [current_project]
synth_design -top axis_async_fifo -part xc7vx690tffg1761-2 -mode out_of_context

rename_ref -prefix_all axis_async_fifo
write_checkpoint -noxdef axis_async_fifo.dcp
report_utilization -file axis_async_fifo_utilization_synth.rpt -pb axis_async_fifo_utilization_synth.pb
if { [catch {
  file copy -force /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.runs/axis_async_fifo_synth_1/axis_async_fifo.dcp /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.srcs/sources_1/ip/axis_async_fifo/axis_async_fifo.dcp
  write_verilog -force -mode synth_stub /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.srcs/sources_1/ip/axis_async_fifo/axis_async_fifo_stub.v
  write_verilog -force -mode funcsim /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.srcs/sources_1/ip/axis_async_fifo/axis_async_fifo_funcsim.v
  write_vhdl -force -mode funcsim /root/NetFPGA-10G-VC709-2013.3/projects/vc709_reference_nic/vc709_reference_nic.srcs/sources_1/ip/axis_async_fifo/axis_async_fifo_funcsim.vhdl
} _RESULT ] } { 
  puts "Critical Warning: Unable to successfully create or copy supporting IP files."
}
