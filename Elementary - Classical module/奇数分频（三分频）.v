// 奇数分频：写两个计数器和分频器（分别是上升沿计数、下降沿计数，上升沿分频、下降沿分频）
// 分频器在（N-1）/2和 N-1 的时候翻转，最后再将两个分频器或
// https://blog.csdn.net/AD7533/article/details/109776437?utm_medium=distribute.pc_relevant.none-task-blog-baidujs_baidulandingword-1&spm=1001.2101.3001.4242

module divtest(
  input clk,
  input rst_n,
  output clk_divider
)
reg [2:0] count_p;          //上升沿计数
reg [2:0] count_n;          //下降沿计数
reg clk_p;                  //上升沿分频
reg clk_n;                  //下降沿分频

parameter N = 3;            //N为奇数

// 上升沿计数
always@(posedge clk or negedge rst_n)
    begin
      if(!rst_n)
        count_p <= 3'b0;
      else if(count_p == N-1)
        count_p <= 3'b0;
      else
        count_p <= count_p + 1'b1;
    end

// 上升沿分频
always@(posedge clk or negedge rst_n)
  begin

  end






