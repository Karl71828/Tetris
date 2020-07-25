module ready_vga_control_module
 (clk, rst_n, ready_col_addr_sig, ready_row_addr_sig, ready_sig, gameready_sig,
  tetris_rom_data, tetris_rom_addr, ready_red_sig, ready_green_sig, ready_blue_sig  
 );
 input clk;
 input rst_n;
 input[10:0] ready_col_addr_sig;
 input[10:0] ready_row_addr_sig;
 input ready_sig;
 input gameready_sig;
 input[63:0] tetris_rom_data;
 output[8:0] tetris_rom_addr;
 output ready_red_sig;
 output ready_green_sig;
 output ready_blue_sig;
 
 /**************************************************/
 
 reg[8:0] m;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        m <= 9'd0;
     else if( ready_sig && ready_row_addr_sig < 512 ) 
        m <= ready_row_addr_sig[8:0];
   end
   
 /**************************************************/
 
 reg[5:0] n;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        n <= 6'd0;
     else if( ready_sig && ready_col_addr_sig < 64 ) 
        n <= ready_col_addr_sig[5:0];
   end
   
 /**************************************************/
 
 assign tetris_rom_addr = m;
 assign ready_red_sig = 1'b0;
 assign ready_green_sig = ( ready_sig && gameready_sig ) ? tetris_rom_data[ 6'd63 - n ] : 1'b0;
 assign ready_blue_sig = 1'b0;
 
 /**************************************************/
 
 endmodule
                       
 
 
 
 