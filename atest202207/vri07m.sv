class Transaction; 
	rand bit [31:0] src; 
	function void display(input string prefix="");
		$display("%s Transaction: src=%0d", prefix, src); 
	endfunction 
endclass 
class BadTr extends Transaction; 
		bit bad_crc; 
	function void display(input string prefix="");
		$display ("%s BadTr: bad.crc=%b", prefix, bad_crc); 
		super.display(prefix); 
	endfunction 
endclass 






