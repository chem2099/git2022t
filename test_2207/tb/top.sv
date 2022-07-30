module top();
logic clk;
logic wr_en;
logic [7:0]  addr;
logic [7:0]  data;

initial begin
    clk = 0;
    repeat(20) #5 clk=~clk;
end

initial begin
    $display("------ --------------------- -------------- ---------");
    wr_en = 0;
    addr = 8'h0;
    data = 8'h0;
    
    repeat(4) @(posedge clk);
    addr = 8'h2;
    data = 8'ha5;
   
    $display("------ --------------------- -------------- ---------");
end

memory dut(clk,wr_en,addr,data);

initial begin
    $fsdbDumpfile("top");
    $fsdbDumpvars(0,top,"+all");
    $fsdbDumpSVA;
end

endmodule