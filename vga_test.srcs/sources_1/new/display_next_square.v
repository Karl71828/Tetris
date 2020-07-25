module display_next_square
 (clk, rst_n, col_addr_sig, row_addr_sig, loading_square, next_yellow_display
 );
 input clk;
 input rst_n;
 input[10:0] col_addr_sig;
 input[10:0] row_addr_sig;
 input loading_square;
 output next_yellow_display;
 
 /**************************************************/
 
 reg[2:0] square_type;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        square_type <= 3'd0;
     else if( loading_square )
        square_type <= square_type + 1'b1;
     else 
        square_type <= square_type;
   end
   
 /**************************************************/
   
 reg[15:0] enable_display_r;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_display_r <= 16'b0000_0000_0111_0010;
     else  
        begin
          case(square_type)
            3'b000: enable_display_r <= 16'b0000_0000_0111_0010;
            3'b001: enable_display_r <= 16'b0000_0000_0011_0011;
            3'b010: enable_display_r <= 16'b0001_0001_0001_0001; 
            3'b011: enable_display_r <= 16'b0000_0000_0011_0110;
            3'b100: enable_display_r <= 16'b0000_0000_0110_0011;
            3'b101: enable_display_r <= 16'b0000_0011_0010_0010;
            3'b110: enable_display_r <= 16'b0000_0011_0001_0001;
            default: enable_display_r <= 16'b0000_0000_0011_0011;
          endcase 
        end
   end
   
 /**************************************************/
 
 reg[15:0] enable_next_display_h;
 
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[0] <= 1'b0;
     else if( enable_display_r[0] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd131 )  
             enable_next_display_h[0] <= 1'b1; 
          else if( col_addr_sig == 11'd140 )
             enable_next_display_h[0] <= 1'b0; 
          else 
             enable_next_display_h[0] <= enable_next_display_h[0];
        end
     else 
        enable_next_display_h[0] <= enable_next_display_h[0]; 
   end                       
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[1] <= 1'b0;
     else if( enable_display_r[1] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd141 )  
             enable_next_display_h[1] <= 1'b1; 
          else if( col_addr_sig == 11'd150 )
             enable_next_display_h[1] <= 1'b0; 
          else 
             enable_next_display_h[1] <= enable_next_display_h[1];
        end
     else 
        enable_next_display_h[1] <= enable_next_display_h[1]; 
   end       
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[2] <= 1'b0;
     else if( enable_display_r[2] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd151 )  
             enable_next_display_h[2] <= 1'b1; 
          else if( col_addr_sig == 11'd160 )
             enable_next_display_h[2] <= 1'b0; 
          else 
             enable_next_display_h[2] <= enable_next_display_h[2];
        end
     else 
        enable_next_display_h[2] <= enable_next_display_h[2]; 
   end      
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[3] <= 1'b0;
     else if( enable_display_r[3] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd161 )  
             enable_next_display_h[3] <= 1'b1; 
          else if( col_addr_sig == 11'd170 )
             enable_next_display_h[3] <= 1'b0; 
          else 
             enable_next_display_h[3] <= enable_next_display_h[3];
        end
     else 
        enable_next_display_h[3] <= enable_next_display_h[3]; 
   end                 
            
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[4] <= 1'b0;
     else if( enable_display_r[4] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd131 )  
             enable_next_display_h[4] <= 1'b1; 
          else if( col_addr_sig == 11'd140 )
             enable_next_display_h[4] <= 1'b0; 
          else 
             enable_next_display_h[4] <= enable_next_display_h[4];
        end
     else 
        enable_next_display_h[4] <= enable_next_display_h[4]; 
   end                 
      
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[5] <= 1'b0;
     else if( enable_display_r[5] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd141 )  
             enable_next_display_h[5] <= 1'b1; 
          else if( col_addr_sig == 11'd150 )
             enable_next_display_h[5] <= 1'b0; 
          else 
             enable_next_display_h[5] <= enable_next_display_h[5];
        end
     else 
        enable_next_display_h[5] <= enable_next_display_h[5]; 
   end               
            
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[6] <= 1'b0;
     else if( enable_display_r[6] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd151 )  
             enable_next_display_h[6] <= 1'b1; 
          else if( col_addr_sig == 11'd160 )
             enable_next_display_h[6] <= 1'b0; 
          else 
             enable_next_display_h[6] <= enable_next_display_h[6];
        end
     else 
        enable_next_display_h[6] <= enable_next_display_h[6]; 
   end         
    
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[7] <= 1'b0;
     else if( enable_display_r[7] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd161 )  
             enable_next_display_h[7] <= 1'b1; 
          else if( col_addr_sig == 11'd170 )
             enable_next_display_h[7] <= 1'b0; 
          else 
             enable_next_display_h[7] <= enable_next_display_h[7];
        end
     else 
        enable_next_display_h[7] <= enable_next_display_h[7]; 
   end   
   
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[8] <= 1'b0;
     else if( enable_display_r[8] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd131 )  
             enable_next_display_h[8] <= 1'b1; 
          else if( col_addr_sig == 11'd140 )
             enable_next_display_h[8] <= 1'b0; 
          else 
             enable_next_display_h[8] <= enable_next_display_h[8];
        end
     else 
        enable_next_display_h[8] <= enable_next_display_h[8]; 
   end        
   
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[9] <= 1'b0;
     else if( enable_display_r[9] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd141 )  
             enable_next_display_h[9] <= 1'b1; 
          else if( col_addr_sig == 11'd150 )
             enable_next_display_h[9] <= 1'b0; 
          else 
             enable_next_display_h[9] <= enable_next_display_h[9];
        end
     else 
        enable_next_display_h[9] <= enable_next_display_h[9]; 
   end        
        
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[10] <= 1'b0;
     else if( enable_display_r[10] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd151 )  
             enable_next_display_h[10] <= 1'b1; 
          else if( col_addr_sig == 11'd160 )
             enable_next_display_h[10] <= 1'b0; 
          else 
             enable_next_display_h[10] <= enable_next_display_h[10];
        end
     else 
        enable_next_display_h[10] <= enable_next_display_h[10]; 
   end             
        
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[11] <= 1'b0;
     else if( enable_display_r[11] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd161 )  
             enable_next_display_h[11] <= 1'b1; 
          else if( col_addr_sig == 11'd170 )
             enable_next_display_h[11] <= 1'b0; 
          else 
             enable_next_display_h[11] <= enable_next_display_h[11];
        end
     else 
        enable_next_display_h[11] <= enable_next_display_h[11]; 
   end    
   
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[12] <= 1'b0;
     else if( enable_display_r[12] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd131 )  
             enable_next_display_h[12] <= 1'b1; 
          else if( col_addr_sig == 11'd140 )
             enable_next_display_h[12] <= 1'b0; 
          else 
             enable_next_display_h[12] <= enable_next_display_h[12];
        end
     else 
        enable_next_display_h[12] <= enable_next_display_h[12]; 
   end 
   
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[13] <= 1'b0;
     else if( enable_display_r[13] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd141 )  
             enable_next_display_h[13] <= 1'b1; 
          else if( col_addr_sig == 11'd150 )
             enable_next_display_h[13] <= 1'b0; 
          else 
             enable_next_display_h[13] <= enable_next_display_h[13];
        end
     else 
        enable_next_display_h[13] <= enable_next_display_h[13]; 
   end    
   
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[14] <= 1'b0;
     else if( enable_display_r[14] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd151 )  
             enable_next_display_h[14] <= 1'b1; 
          else if( col_addr_sig == 11'd160 )
             enable_next_display_h[14] <= 1'b0; 
          else 
             enable_next_display_h[14] <= enable_next_display_h[14];
        end
     else 
        enable_next_display_h[14] <= enable_next_display_h[14]; 
   end  
   
  always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_h[15] <= 1'b0;
     else if( enable_display_r[15] == 1'b1 )
        begin 
          if( col_addr_sig == 11'd161 )  
             enable_next_display_h[15] <= 1'b1; 
          else if( col_addr_sig == 11'd170 )
             enable_next_display_h[15] <= 1'b0; 
          else 
             enable_next_display_h[15] <= enable_next_display_h[15];
        end
     else 
        enable_next_display_h[15] <= enable_next_display_h[15]; 
   end                                  
        
 /**************************************************/
 
 reg[15:0] enable_next_display_v;
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[0] <= 1'b0;
     else if( enable_display_r[0] == 1'b1 )
        begin
          if( row_addr_sig == 11'd161 )
             enable_next_display_v[0] <= 1'b1;                    
          else if( row_addr_sig == 11'd170 )
             enable_next_display_v[0] <= 1'b0;
          else 
             enable_next_display_v[0] <= enable_next_display_v[0]; 
        end
     else 
        enable_next_display_v[0] <= enable_next_display_v[0];
   end
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[4] <= 1'b0;
     else if( enable_display_r[4] == 1'b1 )
        begin
          if( row_addr_sig == 11'd171 )
             enable_next_display_v[4] <= 1'b1;                    
          else if( row_addr_sig == 11'd180 )
             enable_next_display_v[4] <= 1'b0;
          else 
             enable_next_display_v[4] <= enable_next_display_v[4]; 
        end
     else 
        enable_next_display_v[4] <= enable_next_display_v[4];
   end   
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[8] <= 1'b0;
     else if( enable_display_r[8] == 1'b1 )
        begin
          if( row_addr_sig == 11'd181 )
             enable_next_display_v[8] <= 1'b1;                    
          else if( row_addr_sig == 11'd190 )
             enable_next_display_v[8] <= 1'b0;
          else 
             enable_next_display_v[8] <= enable_next_display_v[8]; 
        end
     else 
        enable_next_display_v[8] <= enable_next_display_v[8];
   end   
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[12] <= 1'b0;
     else if( enable_display_r[12] == 1'b1 )
        begin
          if( row_addr_sig == 11'd191 )
             enable_next_display_v[12] <= 1'b1;                    
          else if( row_addr_sig == 11'd200 )
             enable_next_display_v[12] <= 1'b0;
          else 
             enable_next_display_v[12] <= enable_next_display_v[12]; 
        end
     else 
        enable_next_display_v[12] <= enable_next_display_v[12];
   end      

 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[1] <= 1'b0;
     else if( enable_display_r[1] == 1'b1 )
        begin
          if( row_addr_sig == 11'd161 )
             enable_next_display_v[1] <= 1'b1;                    
          else if( row_addr_sig == 11'd170 )
             enable_next_display_v[1] <= 1'b0;
          else 
             enable_next_display_v[1] <= enable_next_display_v[1]; 
        end
     else 
        enable_next_display_v[1] <= enable_next_display_v[1];
   end 
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[5] <= 1'b0;
     else if( enable_display_r[5] == 1'b1 )
        begin
          if( row_addr_sig == 11'd171 )
             enable_next_display_v[5] <= 1'b1;                    
          else if( row_addr_sig == 11'd180 )
             enable_next_display_v[5] <= 1'b0;
          else 
             enable_next_display_v[5] <= enable_next_display_v[5]; 
        end
     else 
        enable_next_display_v[5] <= enable_next_display_v[5];
   end 
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[9] <= 1'b0;
     else if( enable_display_r[9] == 1'b1 )
        begin
          if( row_addr_sig == 11'd181 )
             enable_next_display_v[9] <= 1'b1;                    
          else if( row_addr_sig == 11'd190 )
             enable_next_display_v[9] <= 1'b0;
          else 
             enable_next_display_v[9] <= enable_next_display_v[9]; 
        end
     else 
        enable_next_display_v[9] <= enable_next_display_v[9];
   end 
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[13] <= 1'b0;
     else if( enable_display_r[13] == 1'b1 )
        begin
          if( row_addr_sig == 11'd191 )
             enable_next_display_v[13] <= 1'b1;                    
          else if( row_addr_sig == 11'd200 )
             enable_next_display_v[13] <= 1'b0;
          else 
             enable_next_display_v[13] <= enable_next_display_v[13]; 
        end
     else 
        enable_next_display_v[13] <= enable_next_display_v[13];
   end 
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[2] <= 1'b0;
     else if( enable_display_r[2] == 1'b1 )
        begin
          if( row_addr_sig == 11'd161 )
             enable_next_display_v[2] <= 1'b1;                    
          else if( row_addr_sig == 11'd170 )
             enable_next_display_v[2] <= 1'b0;
          else 
             enable_next_display_v[2] <= enable_next_display_v[2]; 
        end
     else 
        enable_next_display_v[2] <= enable_next_display_v[2];
   end     
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[6] <= 1'b0;
     else if( enable_display_r[6] == 1'b1 )
        begin
          if( row_addr_sig == 11'd171 )
             enable_next_display_v[6] <= 1'b1;                    
          else if( row_addr_sig == 11'd180 )
             enable_next_display_v[6] <= 1'b0;
          else 
             enable_next_display_v[6] <= enable_next_display_v[6]; 
        end
     else 
        enable_next_display_v[6] <= enable_next_display_v[6];
   end   
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[10] <= 1'b0;
     else if( enable_display_r[10] == 1'b1 )
        begin
          if( row_addr_sig == 11'd181 )
             enable_next_display_v[10] <= 1'b1;                    
          else if( row_addr_sig == 11'd190 )
             enable_next_display_v[10] <= 1'b0;
          else 
             enable_next_display_v[10] <= enable_next_display_v[10]; 
        end
     else 
        enable_next_display_v[10] <= enable_next_display_v[10];
   end   
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[14] <= 1'b0;
     else if( enable_display_r[14] == 1'b1 )
        begin
          if( row_addr_sig == 11'd191 )
             enable_next_display_v[14] <= 1'b1;                    
          else if( row_addr_sig == 11'd200 )
             enable_next_display_v[14] <= 1'b0;
          else 
             enable_next_display_v[14] <= enable_next_display_v[14]; 
        end
     else 
        enable_next_display_v[14] <= enable_next_display_v[14];
   end   
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[3] <= 1'b0;
     else if( enable_display_r[3] == 1'b1 )
        begin
          if( row_addr_sig == 11'd161 )
             enable_next_display_v[3] <= 1'b1;                    
          else if( row_addr_sig == 11'd170 )
             enable_next_display_v[3] <= 1'b0;
          else 
             enable_next_display_v[3] <= enable_next_display_v[3]; 
        end
     else 
        enable_next_display_v[3] <= enable_next_display_v[3];
   end   
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[7] <= 1'b0;
     else if( enable_display_r[7] == 1'b1 )
        begin
          if( row_addr_sig == 11'd171 )
             enable_next_display_v[7] <= 1'b1;                    
          else if( row_addr_sig == 11'd180 )
             enable_next_display_v[7] <= 1'b0;
          else 
             enable_next_display_v[7] <= enable_next_display_v[7]; 
        end
     else 
        enable_next_display_v[7] <= enable_next_display_v[7];
   end   
   
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[11] <= 1'b0;
     else if( enable_display_r[11] == 1'b1 )
        begin
          if( row_addr_sig == 11'd181 )
             enable_next_display_v[11] <= 1'b1;                    
          else if( row_addr_sig == 11'd190 )
             enable_next_display_v[11] <= 1'b0;
          else 
             enable_next_display_v[11] <= enable_next_display_v[11]; 
        end
     else 
        enable_next_display_v[11] <= enable_next_display_v[11];
   end 
 
 always @ ( posedge clk or negedge rst_n )
   begin
     if( !rst_n )
        enable_next_display_v[15] <= 1'b0;
     else if( enable_display_r[15] == 1'b1 )
        begin
          if( row_addr_sig == 11'd191 )
             enable_next_display_v[15] <= 1'b1;                    
          else if( row_addr_sig == 11'd200 )
             enable_next_display_v[15] <= 1'b0;
          else 
             enable_next_display_v[15] <= enable_next_display_v[15]; 
        end
     else 
        enable_next_display_v[15] <= enable_next_display_v[15];
   end 
 
 /**************************************************/
 
 reg[15:0] enable_next_display_r;
 
 always @ ( posedge clk or negedge rst_n )
   begin 
     if( !rst_n )
        enable_next_display_r <= 16'd0;
     else 
        enable_next_display_r <= enable_next_display_h & enable_next_display_v;
   end
   
 /**************************************************/
 
 assign next_yellow_display = | enable_next_display_r;   
 
 /**************************************************/    
                
 endmodule 
 
 
 