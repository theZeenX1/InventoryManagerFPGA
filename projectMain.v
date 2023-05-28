`timescale 1ns / 1ps

module projectMain(clk, passInput, masterInput, productId, Enter, Enter2, Enter3, DomItems, SubItems, rst, Alarm, Total, shelfTot, Enabled, cathode, anode);
input clk;
input [31:0] passInput,masterInput;
input [5:0] productId;
input Enter, Enter2, Enter3, rst;
input [3:0] DomItems,SubItems;
output reg Alarm; 
output wire [3:0] anode;
output wire [7:0] cathode;
output reg [6:0] shelfTot;
output reg [12:0] Total;
output reg Enabled ;
///////////////////////////////Password-Registers////////////////////////////////////////////
reg Enable;
reg chk1,chk2;
reg reset;
reg[1:0] count;
///////////////////////////////ProductId-Registers///////////////////////////////////////////
reg [3:0] section , subSection , shelf;
///////////////////////////////Add/Sub-Registers/////////////////////////////////////////////
reg [3:0] addItems, subItems;  // 15-> max items to add or sub at a time  
reg [6:0] totalItems;  // 
///////////////////////////////Data-Registers////////////////////////////////////////////////
integer data[2:0][2:0][2:0][2:0];
integer i,j,k,l;
///////////////////////////////Main-Registers////////////////////////////////////////////////
//reg [3:0] selected [4:0];
reg overflow, underflow;
integer cnt;
///////////////////////////////BCD-Registers////////////////////////////////////////////////
reg [12:0] t;
reg [3:0] d1, d2, d3, d4;
///////////////////////////////Initialization////////////////////////////////////////////////
initial begin
$display("Init\n");
Enable <= 1'b0; count <= 2'd00; Alarm <= 1'b0; t <= 0;
totalItems = 7'd0;
Total = 13'd0;
shelfTot = 7'd0;
for(l=0;l<3;l=l+1) begin
    for(k=0;k<3;k=k+1) begin
        for(j=0;j<3;j=j+1) begin
            for(i=0;i<3;i=i+1) data[l][k][j][i] = 0;
        end
    end
end
end
/////////////////////////////////Enter-Password//////////////////////////////////////////////
always @ (posedge Enter) begin
$display("Enable %d Enter2 %d Enter3 %d",Enable ,Enter2,Enter3);
if(rst == 0) begin
//    $display("Enable %d Enter %d",Enable ,Enter);
    if (Enable == 1'b0 & Enter == 1'b1) begin
    //Password = 32'h60306779;//masterPass = 32'h30805262;
    chk1 = (32'h60306779 == passInput);
    chk2 = (32'h30805262 == masterInput);
    $display("chk1 %d | chk2 %d | count %d \n", &chk1, &chk2,&count);
    if(count==2'b11)
        begin 
            if(chk2==1'b1)
                begin
                    Alarm = 1'b0;
                    count=2'b00;
                end
        end
    else
        begin
            if(chk1==1'b1)
                Enable = 1'b1;
             else 
             begin
                if(count==2'b10)
                    Alarm = 1'b1;
                count = count+1;
             end
        end
    end
end
end

always @(posedge Enter2) begin
    if(Enable == 1'b1 & Enter2 == 1'b1) begin
        $display("productId obtained %d\n", &productId);
        section = productId[5:4]; 
        subSection = productId[3:2];
        shelf = productId[1:0];
        $display("%b %b %b sec subsec shelf pre", &section, &subSection, &shelf);
    end
end

always @(posedge Enter3) begin
//    $display("%d %d",&Enable, &Enter3);
    if(Enable == 1'b1 & Enter3 ==1'b1) begin
        $display("%d %d %d sec subsec shelf", &section, &subSection, &shelf);
        $display("inside main\n");
        addItems = DomItems;
        subItems = SubItems;
        underflow = 0;
        overflow = 0;
        cnt = 0;
        ///////////////////////////////////MAIN//////////////////////////////////////////////////////
    //    for(i = 0; i < 5; i = i+1) selected[i] = data[section][subSection][shelf][i];
        //////////Add///////////
        if(addItems > 0) begin
            for(i = 0; i < 3; i = i+1) begin
                if(data[section][subSection][shelf][i] < 10) begin
                    if(data[section][subSection][shelf][i] + addItems > 10) begin
                        addItems = addItems - (10 - data[section][subSection][shelf][i]);
                        data[section][subSection][shelf][i] = 10;
                    end
                    else begin
                        data[section][subSection][shelf][i]= data[section][subSection][shelf][i] + addItems;
                        addItems = 0;
                    end
                end
                $display("selected add: %d | ", &data[section][subSection][shelf][i]);
            end
            if(addItems > 0) begin
                $display("No more space left in the shelf!\n");
                overflow = 1;
            end
        end
        ////////Sub///////////
        if(subItems > 0) begin
            for(i = 0; i < 3; i = i+1) begin
                if(data[section][subSection][shelf][i] > 0) begin
                    if(data[section][subSection][shelf][i] - subItems < 0) begin
                        subItems = subItems - data[section][subSection][shelf][i];
                        data[section][subSection][shelf][i] = 0;
                    end
                    else begin
                        data[section][subSection][shelf][i] = data[section][subSection][shelf][i] - subItems;
                        subItems = 0;
                    end
                end
                $display("selected sub: %d | ", &data[section][subSection][shelf][i]);
            end
            if(subItems > 0) begin
                $display("No more Items left to remove!\n");
                underflow = 1;
            end
        end
        /////////final?/////////
        Total = 0; t = 0;
        for(l=0;l<3;l=l+1) begin
            for(k=0;k<3;k=k+1) begin
                for(j=0;j<3;j=j+1) begin
                    for(i=0;i<3;i=i+1) begin 
                        Total = Total + data[l][k][j][i];
                        t = t + data[l][k][j][i];
                    end
                end
            end
        end
        totalItems = 0;
        for(i = 0; i < 3; i = i+1) totalItems = totalItems + data[section][subSection][shelf][i];
        shelfTot = totalItems;
    //    for(i = 0; i < 5; i = i+1) data[section][subSection][shelf][i] = selected[i];
    end

    else begin
    shelfTot = 0; Total = 0; t = 0;
    for(l=0;l<3;l=l+1) begin
        for(k=0;k<3;k=k+1) begin
            for(j=0;j<3;j=j+1) begin
                for(i=0;i<3;i=i+1) data[l][k][j][i] = 0;
            end
        end
    end
    end
    Enabled = Enable;
    //$display("%d", &t);
    d1 = t % 10;
    d2 = (t/10)%10;
    d3 = (t/100)%10;
    d4 = (t/1000)%10;
end
////////////////////////////////////////////////////////////////////////////
converter conv(d1, d2, d3, d4, clk, anode, cathode);
endmodule
////////////////////////////////////////////////////////////////////////////




module converter(input[3:0] d1, d2, d3, d4, input clk, output wire [3:0] anode, output wire [7:0] cathode);
wire div;
wire [1:0] ref_counter;
clock_divider cd(clk, div);
refreshcounter rc(div, ref_counter);
anode_control ac(ref_counter, anode);
wire [3:0] ONE_Dig;
BCD_control bc(d1, d2, d3, d4, ref_counter, ONE_Dig);
BCD_to_Cathodes btc(ONE_Dig,cathode);
endmodule

////////////////////////////////////////////////////////////////////////////
module refreshcounter(input refresh_clock, output reg [1:0] refreshcounter = 0);
always @ (posedge refresh_clock) refreshcounter <= refreshcounter + 1;
endmodule
///////////////////////////////////////////////////////////////////////////
module anode_control (input [1:0] refreshcounter, output reg [3:0] anode = 0);

always@ (refreshcounter)

begin

case (refreshcounter)

2'b00: anode = 4'b1110;

2'b01: anode = 4'b1101;

2'b10: anode = 4'b1011;

2'b11: anode = 4'b0111;

endcase

end

endmodule
///////////////////////////////////////////////////////////////////////////
module BCD_control(

input [3:0] digitl, //right digit // ones

input [3:0] digit2, // tens

input [3:0] digit3, // hundreds 

input [3:0] digit4, // thousands

input [1:0] refreshcounter,

output reg [3:0] ONE_DIGIT = 0

);

always@ (refreshcounter)

begin

case (refreshcounter)

2'd0: ONE_DIGIT = digitl; // digit 1 ON

2'd1: ONE_DIGIT = digit2; // digit 2 ON

2'd2: ONE_DIGIT = digit3; // digit 3 ON

2'd3: ONE_DIGIT = digit4; // digit 4 ON

endcase

end

endmodule
///////////////////////////////////////////////////////////////////////////
module BCD_to_Cathodes ( input [3:0] digit, output reg [7:0] a_to_g =0);

always@ (digit)

begin

case (digit)
    0: a_to_g = 8'b10000001;
    1: a_to_g = 8'b11001111;
    2: a_to_g = 8'b10010010;
    3: a_to_g = 8'b10000110;
    4: a_to_g = 8'b11001100;
    5: a_to_g = 8'b10100100;
    6: a_to_g = 8'b10100000;
    7: a_to_g = 8'b10001111;
    8: a_to_g = 8'b10000000;
    9: a_to_g = 8'b10000100;
    default: a_to_g = 8'b11111111;
endcase
end
endmodule
//////////////////////////////////////////////////////////////
module clock_divider(input clk, output reg div);
integer cnt = 0;
initial div = 0;
always @ (posedge clk) begin
    if(cnt == 9999) begin
        div = 1 ^ div;
        cnt = 0;
    end
    else cnt = cnt + 1;
end
endmodule