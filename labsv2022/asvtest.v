module testa(
input	   wire	            sclk,
input	   wire 							rst,
output	reg   odata
	);
always @(posedge sclk) begin
	if(rst == 1'b1) begin
		odata <= 1'b0;
	end
	else begin
		odata <= 1'b1;
	end
end

testb u_testb(
	.sclk  (sclk  ),
	.rst   (rst   ),
	.odata (odata )
);

endmodule