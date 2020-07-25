module over_sync_module
 (clk, rst_n, over_col_addr_sig, over_row_addr_sig, over_hsync, over_vsync, over_out_sig
 );
 input clk;
 input rst_n;
 output[10:0] over_col_addr_sig;
 output[10:0] over_row_addr_sig;
 output over_hsync;
 output over_vsync;
 output over_out_sig;
 
 /**************************************************/
 
 reg[10:0] cnt_h;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        cnt_h <= 11'd0;
     else if( cnt_h == 11'd1056 )
        cnt_h <= 11'd0;
     else cnt_h <= cnt_h + 1'b1;
   end
   
 /**************************************************/   
         
 reg[10:0] cnt_v;
 
 always @ ( posedge clk or negedge rst_n )
   begin  
     if( !rst_n )
       cnt_v <= 11'd0;
     else if( cnt_v == 11'd628 )
       cnt_v <= 11'd0;
     else if( cnt_h == 11'd1056 )
       cnt_v <= cnt_v + 1'b1;
   end 
   
 /**************************************************/
 
 reg isready;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        isready <= 1'b0;
     else if( cnt_h >= 11'd216 && cnt_h < 11'd1017 && cnt_v >= 11'd27 && cnt_v < 11'd627 )
        isready <= 1'b1;
     else isready <= 1'b0;
   end
   
 /**************************************************/
 
 assign over_hsync = ( cnt_h <= 11'd128 ) ? 1'b0 : 1'b1;
 assign over_vsync = ( cnt_v <= 11'd4 ) ? 1'b0 : 1'b1;
 assign over_col_addr_sig = isready ? ( cnt_h - 11'd584 ) : 11'd0;
 assign over_row_addr_sig = isready ? ( cnt_v - 11'd167 ) : 11'd0;
 assign over_out_sig = isready;
 
 /**************************************************/
 
 endmodule
         
