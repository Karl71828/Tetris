 module display_border
 (clk, rst_n, col_addr_sig, row_addr_sig, enable_red_border
 );
 input clk;
 input rst_n;
 input[10:0] col_addr_sig;
 input[10:0] row_addr_sig;
 output enable_red_border;
 
 /**************************************************/
 
 parameter h_start = 11'd341;
 parameter v_start = 11'd221;
 parameter border_width = 11'd10;
 
 /**************************************************/
 
 reg enable_red_out_h;
 reg enable_red_out_v;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_red_out_h <= 1'b0;
     else if( col_addr_sig == h_start ) 
        enable_red_out_h <= 1'b1;
     else if( col_addr_sig == h_start + 11'd120 )
        enable_red_out_h <= 1'b0;
     else 
        enable_red_out_h <= enable_red_out_h;
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        enable_red_out_v <= 1'b0;
     else if( row_addr_sig == v_start )
        enable_red_out_v <= 1'b1;
     else if( row_addr_sig == v_start + 11'd160 ) 
        enable_red_out_v <= 1'b0;
     else 
        enable_red_out_v <= enable_red_out_v;
   end
   
 /**************************************************/
 
 reg enable_red_in_h;
 reg enable_red_in_v;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_red_in_h <= 1'b0;
     else if( col_addr_sig == h_start + border_width ) 
        enable_red_in_h <= 1'b1;
     else if( col_addr_sig == h_start + 11'd110 )
        enable_red_in_h <= 1'b0;
     else 
        enable_red_in_h <= enable_red_in_h;
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        enable_red_in_v <= 1'b0;
     else if( row_addr_sig == v_start + border_width )
        enable_red_in_v <= 1'b1;
     else if( row_addr_sig == v_start + 11'd150 ) 
        enable_red_in_v <= 1'b0;
     else 
        enable_red_in_v <= enable_red_in_v;
   end
   
 /**************************************************/
 
 reg rred_border;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        rred_border <= 1'b0;
     else 
        rred_border <= ( enable_red_out_h && enable_red_out_v ) && ( !( enable_red_in_h && enable_red_in_v ) );
   end
   
 /**************************************************/
 
 assign enable_red_border = rred_border;
 
 /**************************************************/
 
 endmodule
 
