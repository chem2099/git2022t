interface mem_if(
    input clk,
    input rst
);
    logic  wr_en;
    logic[7:0]  addr;
    logic[7:0]  data;
    
    clocking drv_cb @(posedge clk);
        default input #1 output #1;
        output wr_en;
        output addr;
        output data;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1 output #1;
        input wr_en;
        input addr;
        input  data;
    endclocking

    
endinterface //mem_if