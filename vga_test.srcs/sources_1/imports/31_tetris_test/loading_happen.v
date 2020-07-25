module loading_happen
 (clk, rst_n, move_right, move_left, row_addr_sig, blue,
  start_sig, enable_moving, h, v, enable_little, loading_square, little_square_num, over_out
 );  
 input clk;
 input rst_n;
 input move_right;
 input move_left;
 input[10:0] row_addr_sig;
 input blue;
 input start_sig;
 input[15:0] enable_moving;
 output[10:0] h;
 output[10:0] v;
 output[359:0] enable_little;
 output loading_square;
 output[8:0] little_square_num;
 output over_out;
 
 /**************************************************/
 
 parameter T1S = 26'd39_999_999;     //PLL输出为40MHz
 
 /**************************************************/
 
 //控制积木的降落速度，每1s向下移动一个单位
 reg[25:0] count_down;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        count_down <= 26'd0;
     else if( count_down == T1S )
        count_down <= 26'd0;
     else if( start_sig )
        count_down <= count_down + 1'b1;
   end
   
 /**************************************************/
 
 reg[8:0] little_square_num_r;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        little_square_num_r <= 9'd5;
     else if( loading_square_r )
        little_square_num_r <= 9'd5;
     else if( move_right == 1'b1 )
        begin
          if( !inc10_n )
             little_square_num_r <= little_square_num_r + 1'b1;
        end
     else if( move_left == 1'b1 )  
        begin
          if( !dec10_n )
             little_square_num_r <= little_square_num_r - 1'b1;
        end
     else if( v10_enable )
        little_square_num_r <= little_square_num_r + 9'd20;
     else
        little_square_num_r <= little_square_num_r;
   end                      
     
 /**************************************************/          
 
 reg[10:0] ish;  
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        ish <= 11'd353;
     else if( loading_square_r )
        ish <= 11'd353;
     else if( move_right == 1'b1 )
        begin
          if( !inc10_n )
             ish <= ish + 11'd10;
          else 
             ish <= ish;
        end
     else if( move_left == 1'b1 )
        begin
          if( !dec10_n )
             ish <= ish - 11'd10;
          else 
             ish <= ish;
        end
     else 
        ish <= ish;   
   end
                
 /**************************************************/  
 
 reg[10:0] isv; 
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        isv <= 11'd231;
     else if( loading_square_r )
        isv <= 11'd231;
     else if( v10_enable )
        isv <= isv + 11'd10;
     else 
        isv <= isv;
   end
  
 /**************************************************/ 
 
 reg inc10_n;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        inc10_n <= 1'b1;
     else 
        inc10_n <= ( (enable_moving[0] && enable_little_r[little_square_num_r + 9'd1]) ||
                     (enable_moving[1] && enable_little_r[little_square_num_r + 9'd2]) ||         
                     (enable_moving[2] && enable_little_r[little_square_num_r + 9'd3]) ||
                     (enable_moving[3] && enable_little_r[little_square_num_r + 9'd4]) ||
                     (enable_moving[4] && enable_little_r[little_square_num_r + 9'd21]) ||
                     (enable_moving[5] && enable_little_r[little_square_num_r + 9'd22]) ||
                     (enable_moving[6] && enable_little_r[little_square_num_r + 9'd23]) ||
                     (enable_moving[7] && enable_little_r[little_square_num_r + 9'd24]) ||
                     (enable_moving[8] && enable_little_r[little_square_num_r + 9'd41]) ||
                     (enable_moving[9] && enable_little_r[little_square_num_r + 9'd42]) ||
                     (enable_moving[10] && enable_little_r[little_square_num_r + 9'd43]) ||
                     (enable_moving[11] && enable_little_r[little_square_num_r + 9'd44]) ||
                     (enable_moving[12] && enable_little_r[little_square_num_r + 9'd61]) ||
                     (enable_moving[13] && enable_little_r[little_square_num_r + 9'd62]) ||
                     (enable_moving[14] && enable_little_r[little_square_num_r + 9'd63]) ||
                     (enable_moving[15] && enable_little_r[little_square_num_r + 9'd64]) );
   end
   
 /**************************************************/
 
 reg dec10_n;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        dec10_n <= 1'b1;
     else 
        dec10_n <= ( (enable_moving[0] && enable_little_r[little_square_num_r - 9'd1]) ||
                     (enable_moving[1] && enable_little_r[little_square_num_r]) ||         
                     (enable_moving[2] && enable_little_r[little_square_num_r + 9'd1]) ||
                     (enable_moving[3] && enable_little_r[little_square_num_r + 9'd2]) ||
                     (enable_moving[4] && enable_little_r[little_square_num_r + 9'd19]) ||
                     (enable_moving[5] && enable_little_r[little_square_num_r + 9'd20]) ||
                     (enable_moving[6] && enable_little_r[little_square_num_r + 9'd21]) ||
                     (enable_moving[7] && enable_little_r[little_square_num_r + 9'd22]) ||
                     (enable_moving[8] && enable_little_r[little_square_num_r + 9'd39]) ||
                     (enable_moving[9] && enable_little_r[little_square_num_r + 9'd40]) ||
                     (enable_moving[10] && enable_little_r[little_square_num_r + 9'd41]) ||
                     (enable_moving[11] && enable_little_r[little_square_num_r + 9'd42]) ||
                     (enable_moving[12] && enable_little_r[little_square_num_r + 9'd59]) ||
                     (enable_moving[13] && enable_little_r[little_square_num_r + 9'd60]) ||
                     (enable_moving[14] && enable_little_r[little_square_num_r + 9'd61]) ||
                     (enable_moving[15] && enable_little_r[little_square_num_r + 9'd62]) );
   end                           
                           
 /**************************************************/
 
 //用于行满之后的消除
 wire[13:0] sub_line;
 wire sub_line_total;
 
 assign sub_line[0] = & enable_little_r[14:5];
 assign sub_line[1] = & enable_little_r[34:25];
 assign sub_line[2] = & enable_little_r[54:45];
 assign sub_line[3] = & enable_little_r[74:65];
 assign sub_line[4] = & enable_little_r[94:85];
 assign sub_line[5] = & enable_little_r[114:105];
 assign sub_line[6] = & enable_little_r[134:125];
 assign sub_line[7] = & enable_little_r[154:145];
 assign sub_line[8] = & enable_little_r[174:165];
 assign sub_line[9] = & enable_little_r[194:185];
 assign sub_line[10] = & enable_little_r[214:205];
 assign sub_line[11] = & enable_little_r[234:225];
 assign sub_line[12] = & enable_little_r[254:245];
 assign sub_line[13] = & enable_little_r[274:265];
 assign sub_line_total = | sub_line[13:0];
 
 /**************************************************/ 
 
 wire temp;
 wire v10_enable;     //1表示积木能自由降落，0表示不能，亦即发生了成功碰撞
 assign temp = ( (enable_moving[0] && enable_little_r[little_square_num_r + 9'd20]) ||
                 (enable_moving[1] && enable_little_r[little_square_num_r + 9'd21]) ||         
                 (enable_moving[2] && enable_little_r[little_square_num_r + 9'd22]) ||
                 (enable_moving[3] && enable_little_r[little_square_num_r + 9'd23]) ||
                 (enable_moving[4] && enable_little_r[little_square_num_r + 9'd40]) ||
                 (enable_moving[5] && enable_little_r[little_square_num_r + 9'd41]) ||
                 (enable_moving[6] && enable_little_r[little_square_num_r + 9'd42]) ||
                 (enable_moving[7] && enable_little_r[little_square_num_r + 9'd43]) ||
                 (enable_moving[8] && enable_little_r[little_square_num_r + 9'd60]) ||
                 (enable_moving[9] && enable_little_r[little_square_num_r + 9'd61]) ||
                 (enable_moving[10] && enable_little_r[little_square_num_r + 9'd62]) ||
                 (enable_moving[11] && enable_little_r[little_square_num_r + 9'd63]) ||
                 (enable_moving[12] && enable_little_r[little_square_num_r + 9'd80]) ||
                 (enable_moving[13] && enable_little_r[little_square_num_r + 9'd81]) ||
                 (enable_moving[14] && enable_little_r[little_square_num_r + 9'd82]) ||
                 (enable_moving[15] && enable_little_r[little_square_num_r + 9'd83]) );
 assign v10_enable = ( count_down == T1S ) && ( ~temp );                
                               
 /**************************************************/
 
 reg v10_enable_dly;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        v10_enable_dly <= 1'b0;
     else 
        v10_enable_dly <= v10_enable;
   end
   
 /**************************************************/
 
 //加载下一个积木
 reg loading_square_r;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        loading_square_r <= 1'b0;
     else 
        loading_square_r <= v10_enable_dly && temp;  
   end
   
 /**************************************************/
 
 reg[359:0] enable_little_r;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n ) 
        begin
          enable_little_r[4:0] <= 5'b11111;
          enable_little_r[24:20] <= 5'b11111;
          enable_little_r[44:40] <= 5'b11111;
          enable_little_r[64:60] <= 5'b11111;
          enable_little_r[84:80] <= 5'b11111;
          enable_little_r[104:100] <= 5'b11111;
          enable_little_r[124:120] <= 5'b11111;
          enable_little_r[144:140] <= 5'b11111;
          enable_little_r[164:160] <= 5'b11111;
          enable_little_r[184:180] <= 5'b11111;
          enable_little_r[204:200] <= 5'b11111;
          enable_little_r[224:220] <= 5'b11111;
          enable_little_r[244:240] <= 5'b11111;
          enable_little_r[264:260] <= 5'b11111;
          
          enable_little_r[19:15] <= 5'b11111;
          enable_little_r[39:35] <= 5'b11111;
          enable_little_r[59:55] <= 5'b11111;
          enable_little_r[79:75] <= 5'b11111;
          enable_little_r[99:95] <= 5'b11111;
          enable_little_r[119:115] <= 5'b11111;
          enable_little_r[139:135] <= 5'b11111;
          enable_little_r[159:155] <= 5'b11111;
          enable_little_r[179:175] <= 5'b11111;
          enable_little_r[199:195] <= 5'b11111;
          enable_little_r[219:215] <= 5'b11111;
          enable_little_r[239:235] <= 5'b11111;
          enable_little_r[259:255] <= 5'b11111;
          enable_little_r[279:275] <= 5'b11111;
          
          enable_little_r[299:280] <= 20'b1111_1111_1111_1111_1111;
          enable_little_r[319:300] <= 20'b1111_1111_1111_1111_1111;
          enable_little_r[339:320] <= 20'b1111_1111_1111_1111_1111;
          enable_little_r[359:340] <= 20'b1111_1111_1111_1111_1111;

          enable_little_r[14:5] <= 10'b0;
          enable_little_r[34:25] <= 10'b0;
          enable_little_r[54:45] <= 10'b0;
          enable_little_r[74:65] <= 10'b0;
          enable_little_r[94:85] <= 10'b0;
          enable_little_r[114:105] <= 10'b0;
          enable_little_r[134:125] <= 10'b0;
          enable_little_r[154:145] <= 10'b0;
          enable_little_r[174:165] <= 10'b0;
          enable_little_r[194:185] <= 10'b0;
          enable_little_r[214:205] <= 10'b0;
          enable_little_r[234:225] <= 10'b0;
          enable_little_r[254:245] <= 10'b0;
          enable_little_r[274:265] <= 10'b0;
        end 
     else if( sub_line_total )
        begin 
          if( sub_line[0] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[34:25];
               enable_little_r[54:45] <= enable_little_r[54:45];
               enable_little_r[74:65] <= enable_little_r[74:65];
               enable_little_r[94:85] <= enable_little_r[94:85];
               enable_little_r[114:105] <= enable_little_r[114:105];
               enable_little_r[134:125] <= enable_little_r[134:125];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end
          if( sub_line[1] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[54:45];
               enable_little_r[74:65] <= enable_little_r[74:65];
               enable_little_r[94:85] <= enable_little_r[94:85];
               enable_little_r[114:105] <= enable_little_r[114:105];
               enable_little_r[134:125] <= enable_little_r[134:125];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end 
          if( sub_line[2] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[74:65];
               enable_little_r[94:85] <= enable_little_r[94:85];
               enable_little_r[114:105] <= enable_little_r[114:105];
               enable_little_r[134:125] <= enable_little_r[134:125];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end      
          if( sub_line[3] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[94:85];
               enable_little_r[114:105] <= enable_little_r[114:105];
               enable_little_r[134:125] <= enable_little_r[134:125];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end
          if( sub_line[4] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[114:105];
               enable_little_r[134:125] <= enable_little_r[134:125];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end
          if( sub_line[5] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[134:125];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end 
          if( sub_line[6] )
             begin
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[154:145];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end   
          if( sub_line[7] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[174:165];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end    
          if( sub_line[8] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[154:145];
               enable_little_r[194:185] <= enable_little_r[194:185];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end    
          if( sub_line[9] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[154:145];
               enable_little_r[194:185] <= enable_little_r[174:165];
               enable_little_r[214:205] <= enable_little_r[214:205];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end     
          if( sub_line[10] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[154:145];
               enable_little_r[194:185] <= enable_little_r[174:165];
               enable_little_r[214:205] <= enable_little_r[194:185];
               enable_little_r[234:225] <= enable_little_r[234:225];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end  
          if( sub_line[11] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[154:145];
               enable_little_r[194:185] <= enable_little_r[174:165];
               enable_little_r[214:205] <= enable_little_r[194:185];
               enable_little_r[234:225] <= enable_little_r[214:205];
               enable_little_r[254:245] <= enable_little_r[254:245];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end 
          if( sub_line[12] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[154:145];
               enable_little_r[194:185] <= enable_little_r[174:165];
               enable_little_r[214:205] <= enable_little_r[194:185];
               enable_little_r[234:225] <= enable_little_r[214:205];
               enable_little_r[254:245] <= enable_little_r[234:225];
               enable_little_r[274:265] <= enable_little_r[274:265];
             end 
          if( sub_line[13] )
             begin 
               enable_little_r[14:5] <= 10'b0;
               enable_little_r[34:25] <= enable_little_r[14:5];
               enable_little_r[54:45] <= enable_little_r[34:25];
               enable_little_r[74:65] <= enable_little_r[54:45];
               enable_little_r[94:85] <= enable_little_r[74:65];
               enable_little_r[114:105] <= enable_little_r[94:85];
               enable_little_r[134:125] <= enable_little_r[114:105];
               enable_little_r[154:145] <= enable_little_r[134:125];
               enable_little_r[174:165] <= enable_little_r[154:145];
               enable_little_r[194:185] <= enable_little_r[174:165];
               enable_little_r[214:205] <= enable_little_r[194:185];
               enable_little_r[234:225] <= enable_little_r[214:205];
               enable_little_r[254:245] <= enable_little_r[234:225];
               enable_little_r[274:265] <= enable_little_r[254:245];
             end                                                
        end
     else if( loading_square_r )
        begin
          enable_little_r[little_square_num_r] <= enable_moving[0] || enable_little_r[little_square_num_r];
          enable_little_r[little_square_num_r + 8'd1] <= enable_moving[1] || enable_little_r[little_square_num_r + 8'd1];
          enable_little_r[little_square_num_r + 8'd2] <= enable_moving[2] || enable_little_r[little_square_num_r + 8'd2];
          enable_little_r[little_square_num_r + 8'd3] <= enable_moving[3] || enable_little_r[little_square_num_r + 8'd3];
          
          enable_little_r[little_square_num_r + 8'd20] <= enable_moving[4] || enable_little_r[little_square_num_r + 8'd20];
          enable_little_r[little_square_num_r + 8'd21] <= enable_moving[5] || enable_little_r[little_square_num_r + 8'd21];
          enable_little_r[little_square_num_r + 8'd22] <= enable_moving[6] || enable_little_r[little_square_num_r + 8'd22];
          enable_little_r[little_square_num_r + 8'd23] <= enable_moving[7] || enable_little_r[little_square_num_r + 8'd23];
          
          enable_little_r[little_square_num_r + 8'd40] <= enable_moving[8] || enable_little_r[little_square_num_r + 8'd40];
          enable_little_r[little_square_num_r + 8'd41] <= enable_moving[9] || enable_little_r[little_square_num_r + 8'd41];
          enable_little_r[little_square_num_r + 8'd42] <= enable_moving[10] || enable_little_r[little_square_num_r + 8'd42];
          enable_little_r[little_square_num_r + 8'd43] <= enable_moving[11] || enable_little_r[little_square_num_r + 8'd43];
          
          enable_little_r[little_square_num_r + 8'd60] <= enable_moving[12] || enable_little_r[little_square_num_r + 8'd60];
          enable_little_r[little_square_num_r + 8'd61] <= enable_moving[13] || enable_little_r[little_square_num_r + 8'd61];
          enable_little_r[little_square_num_r + 8'd62] <= enable_moving[14] || enable_little_r[little_square_num_r + 8'd62];
          enable_little_r[little_square_num_r + 8'd63] <= enable_moving[15] || enable_little_r[little_square_num_r + 8'd63];
        end
     else 
        enable_little_r <= enable_little_r;
   end 
   
 /**************************************************/
 
 //判断游戏结束
 parameter T1_frame = 20'd663_168;     //1056X628
 
 reg over_out_r;
 reg[19:0] cnt;
 reg line1;
 reg line2;
 reg line3;
 reg line4;
 reg line5;
 reg line14;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        cnt <= 20'd0;
     else if( cnt == T1_frame )
        cnt <= 20'd0;
     else if( start_sig )
        cnt <= cnt + 1'b1;
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        line1 <= 1'b0;
     else if ( blue && ( row_addr_sig >= 11'd231 && row_addr_sig <= 11'd239 ) )
        line1 <= 1'b1;     
     else if( cnt == T1_frame )
        line1 <= 1'b0;                  
   end  
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        line2 <= 1'b0;
     else if ( blue && ( row_addr_sig >= 11'd241 && row_addr_sig <= 11'd249 ) )
        line2 <= 1'b1;     
     else if( cnt == T1_frame )
        line2 <= 1'b0;                  
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        line3 <= 1'b0;
     else if ( blue && ( row_addr_sig >= 11'd251 && row_addr_sig <= 11'd259 ) )
        line3 <= 1'b1;     
     else if( cnt == T1_frame )
        line3 <= 1'b0;                  
   end
     
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        line4 <= 1'b0;
     else if ( blue && ( row_addr_sig >= 11'd261 && row_addr_sig <= 11'd269 ) )
        line4 <= 1'b1;     
     else if( cnt == T1_frame )
        line4 <= 1'b0;                  
   end
       
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        line5 <= 1'b0;
     else if ( blue && ( row_addr_sig >= 11'd271 && row_addr_sig <= 11'd279 ) )
        line5 <= 1'b1;     
     else if( cnt == T1_frame )
        line5 <= 1'b0;                  
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        line14 <= 1'b0;
     else if ( blue && ( row_addr_sig >= 11'd361 && row_addr_sig <= 11'd369 ) )
        line14 <= 1'b1;     
     else if( cnt == T1_frame )
        line14 <= 1'b0;                  
   end                 
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        over_out_r <= 1'b0;
     else if( line1 && line2 && line3 && line4 && line5 && line14 && temp )
        over_out_r <= 1'b1; 
   end
   
 /**************************************************/  
 
 assign h = ish;
 assign v = isv;
 assign enable_little = enable_little_r;
 assign loading_square = loading_square_r;
 assign little_square_num = little_square_num_r;
 assign over_out = over_out_r;
  
 /**************************************************/
 
 endmodule
 
              
