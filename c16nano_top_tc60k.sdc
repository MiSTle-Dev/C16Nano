create_clock -name clk -period 20 -waveform {0 5} [get_ports {clk}]
create_clock -name ds_clk -period 500.000 -waveform {0 250} [get_nets {gamepad_p1/clk_spi}] -add
create_clock -name ds2_clk -period 500.000 -waveform {0 250} [get_nets {gamepad_p2/clk_spi}] -add
create_clock -name clk_sys -period 31.746 -waveform {0 5} [get_nets {clk_sys}]
create_clock -name spi_io_clk -period 50 -waveform {0 25} [get_nets {spi_io_clk}]
create_clock -name clk_audio -period 20833 -waveform {0 5} [get_nets {video_inst/clk_audio}]
create_clock -name clk_pixel_x5 -period 6.349 -waveform {0 1} [get_nets {clk_pixel_x5}] -add
create_clock -name i2sclk -period 500 -waveform {0 250} [get_nets {video_inst/i2s_clk}]
//set_clock_groups -asynchronous -group [get_clocks {flash_clk}] -group [get_clocks {ds_clk}] -group [get_clocks {ds2_clk}]  -group [get_clocks {m0s[3]}] -group [get_clocks {mspi_clk}] -group [get_clocks {clk_audio}] -group [get_clocks {clk32}] -group [get_clocks {clk_pixel_x5}]
set_clock_groups -asynchronous -group [get_clocks {clk_sys}] -group [get_clocks {clk_audio}]
set_clock_groups -asynchronous -group [get_clocks {clk_sys}] -group [get_clocks {i2sclk}]
set_clock_groups -asynchronous -group [get_clocks {clk_sys}] -group [get_clocks {spi_io_clk}]
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
