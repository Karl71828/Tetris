module over_vga_control_module
 (clk, rst_n, over_col_addr_sig, over_row_addr_sig, ready_sig, over_sig,
  over_rom_data, over_rom_addr, over_red_sig, over_green_sig, over_blue_sig  
 );
 input clk;
 input rst_n;
 input[10:0] over_col_addr_sig;
 input[10:0] over_row_addr_sig;
 input ready_sig;
 input over_sig;
 input[63:0] over_rom_data;
 output[8:0] over_rom_addr;
 output over_red_sig;
 output over_green_sig;
 output over_blue_sig;
 
 /**************************************************/
 
 reg[8:0] m;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        m <= 9'd0;
     else if( ready_sig && over_row_addr_sig < 512 ) 
        m <= over_row_addr_sig[8:0];
   end
   
 /**************************************************/
 
 reg[5:0] n;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        n <= 6'd0;
     else if( ready_sig && over_col_addr_sig < 64 ) 
        n <= over_col_addr_sig[5:0];
   end
   
 /**************************************************/
 
 assign over_rom_addr = m;
 assign over_red_sig = 1'b0;
 assign over_green_sig = ( ready_sig && over_sig ) ? over_rom_data[ 6'd63 - n ] : 1'b0;
 assign over_blue_sig = 1'b0;
 
 /**************************************************/
 
 endmodule
                       
 
 
 
 