#-- Lattice Semiconductor Corporation Ltd.
#-- Place & Route run script generated by Radiant

set ret 0
if {[catch {

sys_set_attribute -gui on -msg {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/promote.xml}
msg_load {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/promote.xml}
des_set_project_udb -in {lab7_better_lab7_better_map.udb} -out {lab7_better_lab7_better.udb} -milestone par -pm ice40tp
des_set_reference_udb -clean
# par option
par_set_option { disable_timing_driven false placement_iterations 1 placement_iteration_start_point 1 placement_save_best_run "1"  number_of_host_machine_cores "1" path_based_placement on  stop_once_timing_is_met false   set_speed_grade_for_hold_optimization m disable_auto_hold_timing_correction false prioritize_hold_correction_over_setup_performance false run_placement_only false impose_hold_timing_correction false}
# run place & route
par_run
# backup netlist & constraint file
if {[file exists {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better_syn.udb}] && [file exists {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better_map.udb}] && [file exists {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better.udb}]} {
  file delete -force {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/lab7_better_lab7_better_syn.udb} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/lab7_better_lab7_better_map.udb} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/lab7_better_lab7_better.udb} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/lastrun.pdc}
  file copy -force -- {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better_syn.udb} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/postsyn.udb}
  file copy -force -- {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better_map.udb} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/postmap.udb}
  file copy -force -- {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better.udb} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/postpar.udb}
  if [file exists {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/pin_map.pdc}] {
    file copy -force -- {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/pin_map.pdc} {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/incr/lastrun.pdc}
  }
}

} out]} {
   puts $out
   set ret 1
}

exit -force ${ret}
