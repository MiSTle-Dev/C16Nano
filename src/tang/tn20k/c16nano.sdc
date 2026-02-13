create_clock -name clk -period 37.037 -waveform {0 18} [get_ports {clk}] -add
create_clock -name spi_io_clk -period 50 -waveform {0 25} [get_nets {spi_io_clk}]
create_clock -name spi_sclk -period 40 -waveform {0 5} [get_ports {spi_sclk}] -add
create_clock -name clk_pad -period 20833.332 -waveform {0 10000} [get_nets {gamepad_p1/clk_spi}]
create_clock -name clk_audio -period 20833.332 -waveform {0 10000} [get_nets {video_inst/clk_audio}]
create_generated_clock -name clk_pixel_x5 -source [get_ports {clk}] -master_clock clk -divide_by 4 -multiply_by 21 [get_pins {mainclock_pal/rpll_inst/CLKOUT}]
create_generated_clock -name clk_sys -source [get_pins {mainclock_pal/rpll_inst/CLKOUT}] -master_clock clk_pixel_x5 -divide_by 5 -multiply_by 1 [get_pins {div_inst/CLKOUT}]
create_generated_clock -name flash_clk -source [get_ports {clk}] -master_clock clk -divide_by 8 -multiply_by 19 [get_pins {flash_pll_inst/rpll_inst/CLKOUT}]
create_generated_clock -name clk32 -source [get_pins {flash_pll_inst/rpll_inst/CLKOUT}] -master_clock flash_clk -divide_by 2 -multiply_by 1 [get_pins {flash_pll_inst/rpll_inst/CLKOUTD}]
//set_clock_groups -asynchronous -group [get_clocks {flash_clk}] -group [get_clocks {clk_sys}] -group [get_clocks {clk32}] -group [get_clocks {clk_pad}] -group [get_clocks {clk_audio}] -group [get_clocks {clk_pixel_x5}] -group [get_clocks {spi_io_clk}]
//set_clock_groups -asynchronous -group [get_clocks {clk_sys}] -group [get_clocks {clk32}]
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
