
 module debouncer(
	input  clk,          //时钟信号
	input  rst_n,        //低电平有效复位信号
	input  key_in,       //按键
	output key_out       //按键输出
   );

 /**************************************************/
 /*                 按键状态两级锁存                  */
 /**************************************************/

 reg key_in_dly1;
 reg key_in_dly2;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        begin
          key_in_dly1 <= 1'b0;
          key_in_dly2 <= 1'b0;
        end
     else    
        begin
          key_in_dly1 <= key_in;
          key_in_dly2 <= key_in_dly1;
        end
   end
 
 /**************************************************/
 /*                     按键消抖                    */
 /**************************************************/
 
 reg[17:0] count_debouncer;        //消抖计数器
 reg key_out_tmp;
 
 always @ ( posedge clk or negedge rst_n )
   begin
	if( !rst_n )        //复位期间消抖状态清零
        begin
	      count_debouncer <= 18'd260_000;
		   key_out_tmp <= 1'b0;
	    end
     else if( key_in_dly2 )
        begin
	      count_debouncer <= 18'd0;
		   key_out_tmp <= 1'b0;
	    end
     else if( count_debouncer == 18'd250_000 )   //输出一个脉冲
	    begin
	      key_out_tmp <= 1'b1;
	    end
     else if( count_debouncer == 18'd260_000 )
        begin
	      key_out_tmp <= 1'b0;
	    end
     else
	    count_debouncer <= count_debouncer + 1'b1;
   end
 
 /**************************************************/
 /*               按键状态信号一级锁存                */
 /**************************************************/
 
 reg key_out_tmp_dly1;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        key_out_tmp_dly1 <= 1'b0;
     else
        key_out_tmp_dly1 <= key_out_tmp;
   end
   
 /**************************************************/  

 assign key_out = key_out_tmp & ( ~key_out_tmp_dly1 );   //按键有效输出
 
 /**************************************************/
 
 endmodule
 
 
