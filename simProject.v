module simProject(); 
reg [31:0] password,masterInput; 
reg [5:0] productId ; 
reg clk; 
reg Enter, Enter2, Enter3, rst; 
reg [3:0] DomItems, SubItems; 
wire Alarm; 
wire [3:0] anode; 
wire [7:0] cathode; 
wire [6:0] shelfTot; 
wire [12:0] Total; 
wire Enabled; 

projectMain UUT(clk, password, masterInput, productId, Enter, Enter2, Enter3, DomItems, SubItems, rst, Alarm, Total, shelfTot, Enabled, cathode, anode); 

always #2 clk = ~clk; 
initial begin 
rst = 0; clk = 1; 

    password = 32'b01101000001100000110011101111011; Enter = 1'b1; #2 Enter = 1'b0; 
#10 password = 32'b011001000011000001100111011110101; Enter = 1'b1; #2 Enter = 1'b0; 
#10 password = 32'b01100000001100000110011101111011; Enter = 1'b1; #2 Enter = 1'b0; 
#10 password = 32'b01100000000100000110011101111011; Enter = 1'b1; #2 Enter = 1'b0; 
#10 password = 32'h60306779; Enter = 1'b1; #2 Enter = 1'b0; 
#10 masterInput = 32'h30805262; Enter = 1'b1; #2 Enter = 1'b0; 
#2 password = 32'h60306779; productId = 9'd0; masterInput = 32'd0; Enter = 1'b1; #2 Enter = 1'b0;
#10 productId = 6'b010000; #2 Enter2 = 1'b1; #2 Enter2 = 1'b0;
#10 DomItems = 4'd6; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd10; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd1; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd0; SubItems = 4'd11; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 rst = 1'b1; #2 rst = 1'b0;
#10 productId = 6'b010001; #2 Enter2 = 1'b1; #2 Enter2 = 1'b0; 
#10 DomItems = 4'd6; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd15; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd0; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd0; SubItems = 4'd15; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 productId = 6'b000000; #2 Enter2 = 1'b1; #2 Enter2 = 1'b0; 
#10 DomItems = 4'd15; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd7; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd1; SubItems = 4'd0; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 DomItems = 4'd0; SubItems = 4'd9; #1 Enter3 = 1'b1; #2 Enter3 = 1'b0; 
#10 $finish; 
end
endmodule