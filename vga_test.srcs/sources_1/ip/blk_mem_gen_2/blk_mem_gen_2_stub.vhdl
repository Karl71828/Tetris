-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Tue Jul 11 17:35:31 2017
-- Host        : DESKTOP-FBVJ4AU running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top blk_mem_gen_2 -prefix
--               blk_mem_gen_2_ blk_mem_gen_2_stub.vhdl
-- Design      : blk_mem_gen_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_gen_2 is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end blk_mem_gen_2;

architecture stub of blk_mem_gen_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[8:0],douta[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_6,Vivado 2017.1";
begin
end;
