module memory ( 
    input wire  clk,
    input wire  wr_en,
    input wire [7:0] addr,
    input wire [7:0] data
    );

reg  [7:0]  mem[256];

always @(posedge clk) begin
        if(wr_en) begin
            mem[addr] <= data;    
        end
end

endmodule