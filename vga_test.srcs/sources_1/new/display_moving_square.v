module display_moving_square
 (clk, rst_n, col_addr_sig, row_addr_sig, h, v, enable_moving, enable_blue_moving 
 );
 input clk;
 input rst_n;
 input[10:0] col_addr_sig;
 input[10:0] row_addr_sig;
 input[10:0] h;
 input[10:0] v;
 input[15:0] enable_moving;
 output enable_blue_moving;
 
 /**************************************************/
 
 reg[15:0] enable_blue_moving_h;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[0] <= 1'b0;
     else if( enable_moving[0] == 1'b1 )
        begin
          if( col_addr_sig == h - 11'd2 )
             enable_blue_moving_h[0] <= 1'b1;
          else if( col_addr_sig == h + 11'd7 )
             enable_blue_moving_h[0] <= 1'b0;
          else 
             enable_blue_moving_h[0] <= enable_blue_moving_h[0]; 
        end
     else
        enable_blue_moving_h[0] <= enable_blue_moving_h[0];
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[1] <= 1'b0;
     else if( enable_moving[1] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd8 )
             enable_blue_moving_h[1] <= 1'b1;
          else if( col_addr_sig == h + 11'd17 )
             enable_blue_moving_h[1] <= 1'b0;
          else 
             enable_blue_moving_h[1] <= enable_blue_moving_h[1]; 
        end
     else
        enable_blue_moving_h[1] <= enable_blue_moving_h[1];
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[2] <= 1'b0;
     else if( enable_moving[2] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd18 )
             enable_blue_moving_h[2] <= 1'b1;
          else if( col_addr_sig == h + 11'd27 )
             enable_blue_moving_h[2] <= 1'b0;
          else 
             enable_blue_moving_h[2] <= enable_blue_moving_h[2]; 
        end
     else
        enable_blue_moving_h[2] <= enable_blue_moving_h[2];
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[3] <= 1'b0;
     else if( enable_moving[3] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd28 )
             enable_blue_moving_h[3] <= 1'b1;
          else if( col_addr_sig == h + 11'd37 )
             enable_blue_moving_h[3] <= 1'b0;
          else 
             enable_blue_moving_h[3] <= enable_blue_moving_h[3]; 
        end
     else
        enable_blue_moving_h[3] <= enable_blue_moving_h[3];
   end                   
                        
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[4] <= 1'b0;
     else if( enable_moving[4] == 1'b1 )
        begin
          if( col_addr_sig == h - 11'd2 )
             enable_blue_moving_h[4] <= 1'b1;
          else if( col_addr_sig == h + 11'd7 )
             enable_blue_moving_h[4] <= 1'b0;
          else 
             enable_blue_moving_h[4] <= enable_blue_moving_h[4]; 
        end
     else
        enable_blue_moving_h[4] <= enable_blue_moving_h[4];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[5] <= 1'b0;
     else if( enable_moving[5] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd8 )
             enable_blue_moving_h[5] <= 1'b1;
          else if( col_addr_sig == h + 11'd17 )
             enable_blue_moving_h[5] <= 1'b0;
          else 
             enable_blue_moving_h[5] <= enable_blue_moving_h[5]; 
        end
     else
        enable_blue_moving_h[5] <= enable_blue_moving_h[5];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[6] <= 1'b0;
     else if( enable_moving[6] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd18 )
             enable_blue_moving_h[6] <= 1'b1;
          else if( col_addr_sig == h + 11'd27 )
             enable_blue_moving_h[6] <= 1'b0;
          else 
             enable_blue_moving_h[6] <= enable_blue_moving_h[6]; 
        end
     else
        enable_blue_moving_h[6] <= enable_blue_moving_h[6];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[7] <= 1'b0;
     else if( enable_moving[7] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd28 )
             enable_blue_moving_h[7] <= 1'b1;
          else if( col_addr_sig == h + 11'd37 )
             enable_blue_moving_h[7] <= 1'b0;
          else 
             enable_blue_moving_h[7] <= enable_blue_moving_h[7]; 
        end
     else
        enable_blue_moving_h[7] <= enable_blue_moving_h[7];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[8] <= 1'b0;
     else if( enable_moving[8] == 1'b1 )
        begin
          if( col_addr_sig == h - 11'd2 )
             enable_blue_moving_h[8] <= 1'b1;
          else if( col_addr_sig == h + 11'd7 )
             enable_blue_moving_h[8] <= 1'b0;
          else 
             enable_blue_moving_h[8] <= enable_blue_moving_h[8]; 
        end
     else
        enable_blue_moving_h[8] <= enable_blue_moving_h[8];
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[9] <= 1'b0;
     else if( enable_moving[9] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd8 )
             enable_blue_moving_h[9] <= 1'b1;
          else if( col_addr_sig == h + 11'd17 )
             enable_blue_moving_h[9] <= 1'b0;
          else 
             enable_blue_moving_h[9] <= enable_blue_moving_h[9]; 
        end
     else
        enable_blue_moving_h[9] <= enable_blue_moving_h[9];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[10] <= 1'b0;
     else if( enable_moving[10] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd18 )
             enable_blue_moving_h[10] <= 1'b1;
          else if( col_addr_sig == h + 11'd27 )
             enable_blue_moving_h[10] <= 1'b0;
          else 
             enable_blue_moving_h[10] <= enable_blue_moving_h[10]; 
        end
     else
        enable_blue_moving_h[10] <= enable_blue_moving_h[10];
   end                            

 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[11] <= 1'b0;
     else if( enable_moving[11] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd28 )
             enable_blue_moving_h[11] <= 1'b1;
          else if( col_addr_sig == h + 11'd37 )
             enable_blue_moving_h[11] <= 1'b0;
          else 
             enable_blue_moving_h[11] <= enable_blue_moving_h[11]; 
        end
     else
        enable_blue_moving_h[11] <= enable_blue_moving_h[11];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[12] <= 1'b0;
     else if( enable_moving[12] == 1'b1 )
        begin
          if( col_addr_sig == h - 11'd2 )
             enable_blue_moving_h[12] <= 1'b1;
          else if( col_addr_sig == h + 11'd7 )
             enable_blue_moving_h[12] <= 1'b0;
          else 
             enable_blue_moving_h[12] <= enable_blue_moving_h[12]; 
        end
     else
        enable_blue_moving_h[12] <= enable_blue_moving_h[12];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[13] <= 1'b0;
     else if( enable_moving[13] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd8 )
             enable_blue_moving_h[13] <= 1'b1;
          else if( col_addr_sig == h + 11'd17 )
             enable_blue_moving_h[13] <= 1'b0;
          else 
             enable_blue_moving_h[13] <= enable_blue_moving_h[13]; 
        end
     else
        enable_blue_moving_h[13] <= enable_blue_moving_h[13];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[14] <= 1'b0;
     else if( enable_moving[14] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd18 )
             enable_blue_moving_h[14] <= 1'b1;
          else if( col_addr_sig == h + 11'd27 )
             enable_blue_moving_h[14] <= 1'b0;
          else 
             enable_blue_moving_h[14] <= enable_blue_moving_h[14]; 
        end
     else
        enable_blue_moving_h[14] <= enable_blue_moving_h[14];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_h[15] <= 1'b0;
     else if( enable_moving[15] == 1'b1 )
        begin
          if( col_addr_sig == h + 11'd28 )
             enable_blue_moving_h[15] <= 1'b1;
          else if( col_addr_sig == h + 11'd37 )
             enable_blue_moving_h[15] <= 1'b0;
          else 
             enable_blue_moving_h[15] <= enable_blue_moving_h[15]; 
        end
     else
        enable_blue_moving_h[15] <= enable_blue_moving_h[15];
   end 
   
 /**************************************************/
 
 reg[15:0] enable_blue_moving_v;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[0] <= 1'b0;
     else if( enable_moving[0] == 1'b1 )
        begin
          if( row_addr_sig == v )
             enable_blue_moving_v[0] <= 1'b1;
          else if( row_addr_sig == v + 11'd9 )
             enable_blue_moving_v[0] <= 1'b0; 
          else 
             enable_blue_moving_v[0] <= enable_blue_moving_v[0];
        end
     else 
        enable_blue_moving_v[0] <= enable_blue_moving_v[0];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[4] <= 1'b0;
     else if( enable_moving[4] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd10 )
             enable_blue_moving_v[4] <= 1'b1;
          else if( row_addr_sig == v + 11'd19 )
             enable_blue_moving_v[4] <= 1'b0; 
          else 
             enable_blue_moving_v[4] <= enable_blue_moving_v[4];
        end
     else 
        enable_blue_moving_v[4] <= enable_blue_moving_v[4];
   end                             
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[8] <= 1'b0;
     else if( enable_moving[8] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd20 )
             enable_blue_moving_v[8] <= 1'b1;
          else if( row_addr_sig == v + 11'd29 )
             enable_blue_moving_v[8] <= 1'b0; 
          else 
             enable_blue_moving_v[8] <= enable_blue_moving_v[8];
        end
     else 
        enable_blue_moving_v[8] <= enable_blue_moving_v[8];
   end  
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[12] <= 1'b0;
     else if( enable_moving[12] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd30 )
             enable_blue_moving_v[12] <= 1'b1;
          else if( row_addr_sig == v + 11'd39 )
             enable_blue_moving_v[12] <= 1'b0; 
          else 
             enable_blue_moving_v[12] <= enable_blue_moving_v[12];
        end
     else 
        enable_blue_moving_v[12] <= enable_blue_moving_v[12];
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[1] <= 1'b0;
     else if( enable_moving[1] == 1'b1 )
        begin
          if( row_addr_sig == v )
             enable_blue_moving_v[1] <= 1'b1;
          else if( row_addr_sig == v + 11'd9 )
             enable_blue_moving_v[1] <= 1'b0; 
          else 
             enable_blue_moving_v[1] <= enable_blue_moving_v[1];
        end
     else 
        enable_blue_moving_v[1] <= enable_blue_moving_v[1];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[5] <= 1'b0;
     else if( enable_moving[5] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd10 )
             enable_blue_moving_v[5] <= 1'b1;
          else if( row_addr_sig == v + 11'd19 )
             enable_blue_moving_v[5] <= 1'b0; 
          else 
             enable_blue_moving_v[5] <= enable_blue_moving_v[5];
        end
     else 
        enable_blue_moving_v[5] <= enable_blue_moving_v[5];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[9] <= 1'b0;
     else if( enable_moving[9] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd20 )
             enable_blue_moving_v[9] <= 1'b1;
          else if( row_addr_sig == v + 11'd29 )
             enable_blue_moving_v[9] <= 1'b0; 
          else 
             enable_blue_moving_v[9] <= enable_blue_moving_v[9];
        end
     else 
        enable_blue_moving_v[9] <= enable_blue_moving_v[9];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[13] <= 1'b0;
     else if( enable_moving[13] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd30 )
             enable_blue_moving_v[13] <= 1'b1;
          else if( row_addr_sig == v + 11'd39 )
             enable_blue_moving_v[13] <= 1'b0; 
          else 
             enable_blue_moving_v[13] <= enable_blue_moving_v[13];
        end
     else 
        enable_blue_moving_v[13] <= enable_blue_moving_v[13];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[2] <= 1'b0;
     else if( enable_moving[2] == 1'b1 )
        begin
          if( row_addr_sig == v )
             enable_blue_moving_v[2] <= 1'b1;
          else if( row_addr_sig == v + 11'd9 )
             enable_blue_moving_v[2] <= 1'b0; 
          else 
             enable_blue_moving_v[2] <= enable_blue_moving_v[2];
        end
     else 
        enable_blue_moving_v[2] <= enable_blue_moving_v[2];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[6] <= 1'b0;
     else if( enable_moving[6] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd10 )
             enable_blue_moving_v[6] <= 1'b1;
          else if( row_addr_sig == v + 11'd19 )
             enable_blue_moving_v[6] <= 1'b0; 
          else 
             enable_blue_moving_v[6] <= enable_blue_moving_v[6];
        end
     else 
        enable_blue_moving_v[6] <= enable_blue_moving_v[6];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[10] <= 1'b0;
     else if( enable_moving[10] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd20 )
             enable_blue_moving_v[10] <= 1'b1;
          else if( row_addr_sig == v + 11'd29 )
             enable_blue_moving_v[10] <= 1'b0; 
          else 
             enable_blue_moving_v[10] <= enable_blue_moving_v[10];
        end
     else 
        enable_blue_moving_v[10] <= enable_blue_moving_v[10];
   end  
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[14] <= 1'b0;
     else if( enable_moving[14] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd30 )
             enable_blue_moving_v[14] <= 1'b1;
          else if( row_addr_sig == v + 11'd39 )
             enable_blue_moving_v[14] <= 1'b0; 
          else 
             enable_blue_moving_v[14] <= enable_blue_moving_v[14];
        end
     else 
        enable_blue_moving_v[14] <= enable_blue_moving_v[14];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[3] <= 1'b0;
     else if( enable_moving[3] == 1'b1 )
        begin
          if( row_addr_sig == v )
             enable_blue_moving_v[3] <= 1'b1;
          else if( row_addr_sig == v + 11'd9 )
             enable_blue_moving_v[3] <= 1'b0; 
          else 
             enable_blue_moving_v[3] <= enable_blue_moving_v[3];
        end
     else 
        enable_blue_moving_v[3] <= enable_blue_moving_v[3];
   end  
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[7] <= 1'b0;
     else if( enable_moving[7] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd10 )
             enable_blue_moving_v[7] <= 1'b1;
          else if( row_addr_sig == v + 11'd19 )
             enable_blue_moving_v[7] <= 1'b0; 
          else 
             enable_blue_moving_v[7] <= enable_blue_moving_v[7];
        end
     else 
        enable_blue_moving_v[7] <= enable_blue_moving_v[7];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[11] <= 1'b0;
     else if( enable_moving[11] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd20 )
             enable_blue_moving_v[11] <= 1'b1;
          else if( row_addr_sig == v + 11'd29 )
             enable_blue_moving_v[11] <= 1'b0; 
          else 
             enable_blue_moving_v[11] <= enable_blue_moving_v[11];
        end
     else 
        enable_blue_moving_v[11] <= enable_blue_moving_v[11];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_blue_moving_v[15] <= 1'b0;
     else if( enable_moving[15] == 1'b1 )
        begin
          if( row_addr_sig == v + 11'd30 )
             enable_blue_moving_v[15] <= 1'b1;
          else if( row_addr_sig == v + 11'd39 )
             enable_blue_moving_v[15] <= 1'b0; 
          else 
             enable_blue_moving_v[15] <= enable_blue_moving_v[15];
        end
     else 
        enable_blue_moving_v[15] <= enable_blue_moving_v[15];
   end 
   
 /**************************************************/
 
 reg[15:0] enable_blue_moving_r;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        enable_blue_moving_r <= 16'b0000_0000_0000_0000;
     else 
        enable_blue_moving_r <= enable_blue_moving_h & enable_blue_moving_v;
   end
   
 /**************************************************/
 
 assign enable_blue_moving = | enable_blue_moving_r;
 
 /**************************************************/
 
 endmodule
 
 
 