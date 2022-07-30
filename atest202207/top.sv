module hw_struct_enum();

typedef struct  { 
    bit [7:0] r;
    bit [7:0] g;
    bit [7:0] b;
} pixel_s;

initial begin
    pixel_s my_pixel;
    my_pixel = '{8'h12,8'h34,8'h56};
end

typedef struct packed { 
    bit [7:0] r;
    bit [7:0] g;
    bit [7:0] b;
 } pixel_p;

 initial begin
    pixel_p my_pixel;
    my_pixel = {8'h10,8'h10,8'h10};
    $display("my_pixel.r = %0h",my_pixel.r);
    $display("my_pixel.g = %0h",my_pixel.g);
    $display("my_pixel.b = %0h",my_pixel.b);
 end

endmodule