`timescale 1ns / 1ps

module vga_test(
    input clk,                //全局时钟，100MHz
    input rst_n,              //低电平有效复位信号
    
    input KB_DATA,
    input KB_CLK,
    //input right,              //控制向右按键
   // input left,               //控制向左按键
   // input up,            //控制右转按键
   // input down,            //控制左转按键
                 //确认按键

    output hsync_out,            //行扫描
    output vsync_out,            //列扫描
    output [4:0] red_o,          //VGA R
    output [5:0] green_o,        //VGA G
    output [4:0] blue_o          //VGA B
    );
 
  wire red_out;
  wire green_out;
  wire blue_out;  
  wire over_out;
  wire over_sig;
  wire start_sig;
  wire gameready_sig;
  wire red;
  wire green;
  wire blue;    
     
  wire clk_40MHz;                 
  wire vga_clk;                  //40MHz VGA时钟
 
 assign vga_clk = ~clk_40MHz;
 assign red_o = {5{red_out}};
 assign green_o = {6{green_out}};
 assign blue_o = {5{blue_out}};
    
//实例化时钟管理模块，产生VGA所需时钟信号   
clk_wiz_0 u1
  (
   // Clock out ports
   .clk_out1(clk_40MHz),
  // Clock in ports
   .clk_in1(clk)
  );
 
 
   wire move_right;
   wire move_left;
   wire rotate_r;
   wire rotate_l;
   wire start;
   
   /*debouncer U6
   (
    .clk(clk_40MHz),
    .rst_n(rst_n),
    .key_in(enter),
    .key_out(start)
   );
   
   
   /**************************************************/
    PS2 U2(
    .clk(clk_40MHz),
    .rst_n(rst_n),
    .ps2_clk(KB_CLK),
    .ps2_data(KB_DATA),
    
     .right( move_right),
     .left(move_left),
     .down(rotate_r),
     .up(start)
    );
    wire[10:0] ready_col_addr_sig;
    wire[10:0] ready_row_addr_sig;
    wire ready_out_sig;
    wire ready_hsync;
    wire ready_vsync;
    
    ready_sync_module U7
    (
     .clk(clk_40MHz),
     .rst_n(rst_n),
     .ready_col_addr_sig(ready_col_addr_sig),
     .ready_row_addr_sig(ready_row_addr_sig),
     .ready_out_sig(ready_out_sig),
     .ready_hsync(ready_hsync),
     .ready_vsync(ready_vsync)
    );

 wire[63:0] tetris_rom_data;
wire[8:0] tetris_rom_addr;

blk_mem_gen_2 U8(
    .clka(clk_40MHz),
    .addra(tetris_rom_addr),
    .douta(tetris_rom_data)
  );
   
   wire ready_red_sig;
   wire ready_green_sig;
   wire ready_blue_sig;
   
   ready_vga_control_module U9
   (
    .clk(clk_40MHz),
    .rst_n(rst_n),
    .ready_col_addr_sig(ready_col_addr_sig),
    .ready_row_addr_sig(ready_row_addr_sig),
    .ready_sig(ready_out_sig),
    .gameready_sig(gameready_sig),
    .tetris_rom_data(tetris_rom_data),
    .tetris_rom_addr(tetris_rom_addr),
    .ready_red_sig(ready_red_sig),
    .ready_green_sig(ready_green_sig),
    .ready_blue_sig(ready_blue_sig)
   );
   
  wire[10:0] over_col_addr_sig;
    wire[10:0] over_row_addr_sig;
    wire over_out_sig;
    wire over_hsync;
    wire over_vsync;
    
    over_sync_module U10
    (
     .clk(clk_40MHz),
     .rst_n(rst_n),
     .over_col_addr_sig(over_col_addr_sig),
     .over_row_addr_sig(over_row_addr_sig),
     .over_out_sig(over_out_sig),
     .over_hsync(over_hsync),
     .over_vsync(over_vsync)
    );
    
    wire[63:0] over_rom_data;
     wire[8:0] over_rom_addr;

    blk_mem_gen_0 U11(
        .clka(clk_40MHz),
        .addra(over_rom_addr),
        .douta(over_rom_data)
      );
  
  wire over_red_sig;
       wire over_green_sig;
       wire over_blue_sig;
       
       over_vga_control_module U12
       (
        .clk(clk_40MHz),
        .rst_n(rst_n),
        .over_col_addr_sig(over_col_addr_sig),
        .over_row_addr_sig(over_row_addr_sig),
        .ready_sig(over_out_sig),
        .over_sig(over_sig),
        .over_rom_data(over_rom_data),
        .over_rom_addr(over_rom_addr),
        .over_red_sig(over_red_sig),
        .over_green_sig(over_green_sig),
        .over_blue_sig(over_blue_sig)
       );
       
       /**************************************************/
       
       wire[10:0] col_addr_sig;
       wire[10:0] row_addr_sig;
       wire hsync;
       wire vsync;
       wire ready_sig;        
       
       game_sync_module U13
       (
        .clk(clk_40MHz),
        .rst_n(rst_n),
        .col_addr_sig(col_addr_sig),
        .row_addr_sig(row_addr_sig),
        .hsync(hsync),
        .vsync(vsync),
        .ready_sig(ready_sig)
       );
       
        wire[103:0] next_rom_data;
       wire[7:0] next_rom_addr;
       
        blk_mem_gen_1 U14(
              .clka(clk_40MHz),
              .addra(next_rom_addr),
              .douta(next_rom_data)
            );
  
  wire[10:0] h;
             wire[10:0] v;
             wire[359:0] enable_little;
             wire[15:0] enable_moving;
             wire loading_square;
             wire[8:0] little_square_num;
             
             loading_happen U15 
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .move_right(move_right),
              .move_left(move_left),
              .start_sig(start_sig),
              .row_addr_sig(row_addr_sig),
              .blue(blue),
              .h(h),
              .v(v),
              .enable_little(enable_little),
              .enable_moving(enable_moving),
              .loading_square(loading_square),
              .little_square_num(little_square_num),
              .over_out(over_out)
             );
             
             /**************************************************/
             
             wire enable_red_border;
                
             display_border U16 
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .col_addr_sig(col_addr_sig),
              .row_addr_sig(row_addr_sig),
              .enable_red_border(enable_red_border)
             );
             
             /**************************************************/
             
             wire enable_blue_moving;
                                                
             display_moving_square U17 
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .col_addr_sig(col_addr_sig),
              .row_addr_sig(row_addr_sig),
              .h(h),
              .v(v),
              .enable_blue_moving(enable_blue_moving),
              .enable_moving(enable_moving)
             );
             
             /**************************************************/
             
             wire enable_blue_little_flag;
             
             display_little_square U18 
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .col_addr_sig(col_addr_sig),
              .row_addr_sig(row_addr_sig),
              .enable_little(enable_little),
              .enable_blue_little_flag(enable_blue_little_flag)
             );
             
             /**************************************************/
                 
             square_gen U19
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .enable_moving(enable_moving),
              .rotate_r(rotate_r),
              .rotate_l(rotate_l),
              .loading_square(loading_square),
              .little_square_num(little_square_num),
              .enable_little(enable_little)                                    
             );
             
             /**************************************************/
             
             wire next_yellow_display;
             
             display_next_square U20
             (
              .clk(clk_40MHz), 
              .rst_n(rst_n), 
              .col_addr_sig(col_addr_sig), 
              .row_addr_sig(row_addr_sig), 
              .loading_square(loading_square), 
              .next_yellow_display(next_yellow_display)
             );   
             
             /**************************************************/
             

             
             game_display U21
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .ready_sig(ready_sig),
              .enable_red_border(enable_red_border),
              .enable_blue_moving(enable_blue_moving),
              .enable_blue_little_flag(enable_blue_little_flag),
              .next_rom_data(next_rom_data),
              .row_addr_sig(row_addr_sig),
              .col_addr_sig(col_addr_sig),
              .next_yellow_display(next_yellow_display),
              .next_rom_addr(next_rom_addr),
              .red(red),
              .green(green),
              .blue(blue)
             );
             
             /**************************************************/
             

             
             game_process U22
            (
             .clk(clk_40MHz),
             .rst_n(rst_n),
             .start(start),
             .over(over_out),
             .start_sig(start_sig),
             .gameready_sig(gameready_sig),
             .over_sig(over_sig)
             );
             
             /**************************************************/
             
             vga_select_module U23
             (
              .clk(clk_40MHz),
              .rst_n(rst_n),
              .start_sig(start_sig),
              .hsync(hsync),
              .vsync(vsync),
              .red(red),
              .green(green),
              .blue(blue),
              .gameready_sig(gameready_sig),
              .ready_hsync(ready_hsync),
              .ready_vsync(ready_vsync),
              .ready_red_sig(ready_red_sig),
              .ready_green_sig(ready_green_sig),
              .ready_blue_sig(ready_blue_sig),
              .over_sig(over_sig),
              .over_hsync(over_hsync),
              .over_vsync(over_vsync),
              .over_red_sig(over_red_sig),
              .over_green_sig(over_green_sig),
              .over_blue_sig(over_blue_sig),
              .hsync_out(hsync_out),
              .vsync_out(vsync_out),
              .red_out(red_out),
              .green_out(green_out),
              .blue_out(blue_out)
             );
                   
  
endmodule
