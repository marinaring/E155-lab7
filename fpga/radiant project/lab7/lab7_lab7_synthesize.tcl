if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2024.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) "1"
set para(prj_dir) "C:/Users/mring/Documents/MicroPs/E155-lab7/fpga/radiant project"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- lab7_lab7.vm lab7_lab7.ldc
if {[ catch {::radiant::runengine::run_engine synpwrap -prj "lab7_lab7_synplify.tcl" -log "lab7_lab7.srf"} result options ]} {
    file delete -force -- lab7_lab7.vm lab7_lab7.ldc
    return -options $options $result
}
::radiant::runengine::run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o lab7_lab7_syn.udb lab7_lab7.vm] [list {C:/Users/mring/Documents/MicroPs/E155-lab7/fpga/radiant project/lab7/lab7_lab7.ldc}]

} out]} {
   ::radiant::runengine::runtime_log $out
   exit 1
}
