##history###
# vcs		:
# 		vcs 	\
# 		-f dut.f 	\
# 		-full64 -R +vc +v2k -sverilog -debug_all -LDFLAGS -Wl,--no-as-needed \
# 		| tee vcs.log
# clean	:
# 		rm -rf *.log simv *.daidir csrc *.key DVEfiles *.vpd 

#############################
# User variables
#############################
#TB       = tb
#SEED     = 1
#TESTNAME ?= mcdf_data_consistence_basic_test
ENVFILE := $(shell pwd)
PARENTDIR := ../
DFILES  = $(PARENTDIR)/design/memory.v      #{memory.v,test.v}
VFILES  = $(PARENTDIR)/tb/{top.sv,mem_if.sv}            #$(TB).sv


#############################
# Environment variables
#############################
#VCOMP                = vlogan -full64 -sverilog -timescale=1ps/1ps -nc -l comp.log +incdir+../mcdf/v0
#ELAB                 = vcs -full64 -debug_all -l elab.log -sim_res=1ps -cm line+tgl+branch -cm_hier cm.cfg
#RUN                  = $(TB).simv -l run.log -sml -cm line+tgl+branch -cm_name $(TB)_$(SEED) +ntb_random_seed=$(SEED) +TESTNAME=$(TESTNAME)

#comp:
#	$(VCOMP) $(DFILES) $(VFILES)


cmp:
	vcs 	\
	-full64 -LDFLAGS -Wl,--no-as-needed \
	+v2k    \
	-sverilog 	\
	-kdb     \
	-debug_acc+all \
	-timescale=1ns/1ps \
	$(DFILES) \
	$(VFILES) \
	-top top \
	-l top.cmp \
	| tee vcs.log


sim:
	./simv \
	-l top.log

run: cmp sim

clean	:
	rm -rf AN.DB DVEfiles csrc *.simv *.simv.daidir *.simv.vdb ucli.key
	rm -rf *.log* *.vpd urgReport a.ou
