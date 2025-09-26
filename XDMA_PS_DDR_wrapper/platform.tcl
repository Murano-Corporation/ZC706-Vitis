# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/murano/ZC706-Vitis-Workspace/XDMA_PS_DDR_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/murano/ZC706-Vitis-Workspace/XDMA_PS_DDR_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {XDMA_PS_DDR_wrapper}\
-hw {/home/murano/sw_dev/projects/ZC706-Vivado/XDMA_PS_DDR_wrapper.xsa}\
-out {/home/murano/ZC706-Vitis-Workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {XDMA_PS_DDR_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
bsp reload
domain active {zynq_fsbl}
bsp reload
platform generate -domains 
