module game_display
 (clk, rst_n, ready_sig, enable_red_border, enable_blue_moving, enable_blue_little_flag, row_addr_sig, col_addr_sig, 
  next_rom_data, next_yellow_display, red, green, blue, next_rom_addr
 );
 input clk;
 input rst_n;
 input ready_sig;
 input enable_red_border;
 input enable_blue_moving;
 input enable_blue_little_flag;
 input[103:0] next_rom_data;
 input[10:0] row_addr_sig;
 input[10:0] col_addr_sig;
 input next_yellow_display;
 output[7:0] next_rom_addr;
 output red;
 output green;
 output blue;
 
 
 /**************************************************/
 
 reg [7:0]m;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        m <= 8'd0;
     else if( ready_sig && row_addr_sig < 256 )
        m <= row_addr_sig[7:0];
   end     
           
 /**************************************************/
 
 reg[6:0] n;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        n <= 7'd0;
     else if( ready_sig && col_addr_sig < 128 ) 
        n <= col_addr_sig[6:0];
   end       
 	 
 /**************************************************/		  
				
 reg isred;
 reg isgreen;
 reg isblue;

 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        begin 
          isred <= 1'b0;
          isgreen <= 1'b0;
          isblue <= 1'b0;
        end
     else if( ready_sig )
        begin
          isred <= enable_red_border | next_yellow_display;
          isgreen <= next_rom_data[7'd103 - n] | next_yellow_display;
          isblue <= enable_blue_moving | enable_blue_little_flag;
        end
   end
          
 /**************************************************/
 
 assign next_rom_addr = m;
 assign red = isred;
 assign green = isgreen;
 assign blue = isblue;
 
 /**************************************************/
 
 endmodule
 
  
