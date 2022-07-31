## 
## -------------------------------------------------------------
##    Copyright 2010-2011 Synopsys, Inc.
##    All Rights Reserved Worldwide
## 
##    Licensed under the Apache License, Version 2.0 (the
##    "License"); you may not use this file except in
##    compliance with the License.  You may obtain a copy of
##    the License at
## 
##        http://www.apache.org/licenses/LICENSE-2.0
## 
##    Unless required by applicable law or agreed to in
##    writing, software distributed under the License is
##    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
##    CONDITIONS OF ANY KIND, either express or implied.  See
##    the License for the specific language governing
##    permissions and limitations under the License.
## -------------------------------------------------------------
## 

UVM_HOME=/home/software/synopsys/vcs/etc/uvm-1.1
UVM_VERBOSITY=UVM_MEDIUM
DEBUG=NODUMP
TC=0
SEED=`date +%N`
UVM_TRACE=
IS_COV=0

#############COV enable###############
ifeq ($(IS_COV),1)
	vcs_cov_opt = -cm line+cond+fsm+tgl+branch+assert -cm_dir vcs_cov
else
	vcs_cov_opt = 
endif
#######################################
ifeq ($(SIM_DEFINE),1)
	TCC=ahb_bus_1bit
else
	TCC=ahb_bus
endif
################main###################
all: clean comp run

clean:
	rm -rf *.log *.fsdb

comp:
	$(VCS) +incdir+. \
	-f rtl/filelist.f \
    +incdir+ $(TC).sv 

run:
	$(SIMV)
#######################################

VCS =	vcs -full64 -sverilog -debug_all -timescale=1ns/10ps +notimingcheck +nospecify \
		+acc +vpi \
		+lint=TFIPC-L \
		+define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    	+define+$(DEBUG)+UVM_REG_DATA_WIDTH=1024 \
		+incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
		$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS \
    	+libext+.sv+.v+.vp+.vhd+.vh \
    	-lca \
		-assert svaext \
		-assert dve \
		-assert enable_diag \
		-assert vpiSeqBeginTime \
		-assert vpiSeqFail \
		$(vcs_cov_opt) \
		-l vcs_cmp.log \
		-P /home/software/synopsys/verdi2020/Q-2020.03/share/PLI/VCS/LINUX64/verdi.tab /home/software/synopsys/verdi2020/Q-2020.03/share/PLI/VCS/LINUX64/pli.a 
		
SIMV = 	./simv +$(UVM_TRACE) +UVM_TESTNAME=$(TC) +UVM_VERBOSITY=$(UVM_VERBOSITY) \
		+ntb_random_seed=$(SEED) \
		$(vcs_cov_opt) \
   		-l vcs_run.log

###################cov_report#########
urg:
	urg -full64 -dir vcs_cov.vdb -report both

###################verdi#########
verdi:
	verdi -f ../tb/filelist/ahb_bus.f -ssf *.fsdb