// 一个LED开发板，板上有8个依次排开的LED灯。
// 需要设计一段verilog程序，来实现驱动LED灯。
// 时钟clk频率为10Mhz.
// 当mode模式信号为0时，以0->1->2->3->4->5->6->7->0->1…的顺序，循环点亮LED灯。每次只有一个灯亮，亮灯时间为1秒。
// 当mode模式信号为1时，以0->2->4->6->1->3->5->7-><0->2.的顺序，循环点亮LED灯。每次只有一个灯亮，亮灯时间为1秒。
// 给出的module接口说明如下，请补充内部代码实现细节。

module led_driver(
    input clk,
    input rstn,
    input mode,
    output [7:0] led
);

reg mode_reg0;
reg mode_reg1;

always @(posedge clk or negedge rstn)begin
    if(rstn == 0)
    cnt_reg <= 24'b0;
    else if(cnt_reg == 16777216-1)
    cnt_reg <= 24'b0;
    else
    cnt_reg <=  cnt_reg + 1'b1;
end

always @(posedge clk)begin
    mode_reg0 <= mode;
    mode_reg1 <= mode_reg0;
end

reg [3:0] state;
always @(posedge clk or negedge rstn)begin
    if(rstn == 0)
    state <= 4'd0;
    else begin
        if((cnt_reg == 16777216-1) && (state < 4'd9 ))
        state <= state + 1'd1;
        else if(state == 9)
        state <= 1'd0;
        else
        state <= state;
    end
end

always @(posedge clk or negedge rstn)begin
    if(rstn == 0)
    led_reg <= 8'b0;
    else 
        begin
            case(state)
                4'd0:begin
                    led_reg <= 8'b0;
                end
                4'd1:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0000_0001;
                    else
                    led_reg <= 8'b0000_0001;
                end
                4'd2:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0000_0010;
                    else
                    led_reg <= 8'b0000_0100;
                end
                4'd3:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0000_0100;
                    else
                    led_reg <= 8'b0001_0000;
                end
                4'd4:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0000_1000;
                    else
                    led_reg <= 8'b0100_0000;
                end
                4'd5:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0001_0000;
                    else
                    led_reg <= 8'b0000_0010;
                end
                4'd6:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0010_0000;
                    else
                    led_reg <= 8'b0000_1000;
                end
                4'd7:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b0100_0000;
                    else
                    led_reg <= 8'b0010_0000;
                end
                4'd8:begin
                    if(mode_reg1 == 0)
                    led_reg <= 8'b1000_0000;
                    else
                    led_reg <= 8'b1000_0000;
                end
                default:
                    led_reg <= 8'b0000_0000;
            endcase
        end 
end
assign led = led_reg;
endmodule
