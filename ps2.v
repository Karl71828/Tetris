///////////////////////////////////////////////////////////////
// PS2键盘扫描�?测模块，W、A、S、D分别控制小蛇的上、左、下、右
/////////////////////////////////////////////////////////////// 

module PS2(
    input clk     ,    //50MHz
    input rst_n   ,    //Low Active
    input ps2_clk ,    //PS2时钟信号
    input ps2_data,    //PS2数据信号
    
    output reg left,   //左键按下的信�?
    output reg right,  //右键按下的信�?
    output reg up,     //上键按下的信�?
    output reg down    //下键按下的信�?
    );

    reg ps2_state;
//-----------------ps2_clk下降沿捕�?--------------------
    
    //clk相当于中间采样点的作用，第一个下降沿到来说明起始位开�?
    
    reg ps2_clk0, ps2_clk1, ps2_clk2;//缓冲寄存�?
    wire ps2_clk_neg;  //1表示�?测到下降�?
    
    always @ (posedge clk or negedge rst_n)
        if (!rst_n) 
            {ps2_clk0, ps2_clk1, ps2_clk2} <= 3'd0;
        else 
            begin
                ps2_clk0 <= ps2_clk;
                ps2_clk1 <= ps2_clk0;
                ps2_clk2 <= ps2_clk1;
            end
    
    assign ps2_clk_neg = ~ps2_clk1 & ps2_clk2;

    
//----------------------数据接收----------------------------

    reg [3:0]num;      //移位控制
    reg [7:0]data_temp;//当前接收的数�?

    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            begin
                num <= 4'd0;
                data_temp <= 8'd0;
            end

        else if (ps2_clk_neg)
            begin
                if (num == 0) num <= num + 1'b1;//跳过起始�?
                else if (num <= 8)              //数据位赋�?
                    begin
                        num <= num + 1'b1;
                        data_temp[num-1] <= ps2_data;
                    end
                else if (num == 9) num <= num + 1'b1;//跳过校验�?
                else  num <= 4'd0;              //�?0  
            end


//--------------------按键按下/松开�?�?-------------------------
    
    reg ps2_loosen;//1表示按键松开
    reg [7:0]ps2_byte;//ps2�?个字节数�?

    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            begin 
                ps2_state <= 1'b0;
                ps2_loosen<= 1'b0;
            end
        //每接收完�?个数据就进行按键�?�?
        else if (num == 4'd10)
            if (data_temp == 8'hf0) ps2_loosen <= 1'b1;//断码标识�?
            else
                begin
                    if (ps2_loosen) //1表示按键松开，下�?次接收数据后�?0
                        begin 
                            ps2_state <= 1'b0;
                            ps2_loosen<= 1'b0;
                        end
                    else            //loosen�?0后的下一个数据表示按键被按下
                        begin
                            ps2_state <= 1'b1;
                            ps2_byte <= data_temp; //把读取到的�?�赋给ps2_out
                        end
                end

reg ps2state_reg;
wire flag;
always @ (posedge clk)
    ps2state_reg <= ps2_state;
assign flag = (ps2state_reg) & (~ps2_state);    
    
//---------------------根据键盘扫描码输出按键有效信�?--------------------------         

    always @ (posedge clk or negedge rst_n) 
    if (!rst_n)
        begin left <= 0; right <= 0; up <= 0; down <= 0; end
    else if (flag)    //每当松开按键时才进行输出
        case (ps2_byte)       
            8'h1C: begin left  <= 1;  end //a
            8'h23: begin right <= 1;  end //d
            8'h1D: begin up    <= 1;  end //w
            8'h1B: begin down  <= 1;  end //s
          default: begin left <= 0; right <= 0; up <= 0; down <= 0; end  
        endcase
    else if (left) left <= 0;       //�?有按键有效信号输出一个脉冲后马上清零
    else if (right) right <= 0;
    else if (up) up <= 0;
    else if (down) down <= 0;
   
endmodule
