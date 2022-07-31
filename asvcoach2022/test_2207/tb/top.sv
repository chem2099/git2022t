module top();
logic clk;
logic rst;
logic wr_en;
logic [7:0]  addr;
logic [7:0]  data;

//clk and rst
initial begin
    rst = 0;
    clk = 0;
    repeat(20) #5 clk=~clk;
end

//interface
mem_if mif(clk,rst);

//test
initial begin
    logic[7:0] addr;
    $display("------ --------------------- -------------- ---------");
    mif.drv_cb.wr_en <= 1'b0;
    mif.drv_cb.addr <= 8'h0;
    mif.drv_cb.data <= 8'h0;
    
    repeat(4) @mif.drv_cb;
    mif.drv_cb.wr_en <= 1'b1;
    mif.drv_cb.addr <= 8'h2;
    mif.drv_cb.data <= 8'ha5;

    @mif.drv_cb;
    mif.drv_cb.wr_en <= 1'b0;

    @mif.mon_cb;
    addr = mif.mon_cb.addr;
    $display("addr = %0h", addr);
   
    $display("------ --------------------- -------------- ---------");
end



//dut
memory dut(.clk(clk),
           .wr_en(mif.wr_en),
           .addr(mif.addr),
           .data(mif.data));

initial begin
    $fsdbDumpfile("top");
    $fsdbDumpvars(0,top,"+all");
    $fsdbDumpSVA;
end

endmodule