if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2024.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) "1"
set para(prj_dir) "C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- lab7_better_lab7_better.vm lab7_better_lab7_better.ldc
::radiant::runengine::run_engine_newmsg synthesis -f "lab7_better_lab7_better_lattice.synproj" -logfile "lab7_better_lab7_better_lattice.srp"
::radiant::runengine::run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o lab7_better_lab7_better_syn.udb lab7_better_lab7_better.vm] [list {C:/Users/Marina/OneDrive/Documents/Marina/College/MicroPs/E155-lab7/fpga/radiant project/lab7_better/lab7_better/lab7_better_lab7_better.ldc}]

} out]} {
   ::radiant::runengine::runtime_log $out
   exit 1
}
