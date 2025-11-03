create_clock -name clk -period 37.037 -waveform {0 18} [get_ports {clk}]
create_clock -name clk_sys -period 35.273 -waveform {0 17} [get_nets {clk_sys}]
create_clock -name spi_io_clk -period 50 -waveform {0 25} [get_nets {spi_io_clk}]
create_clock -name clk_pixel_x5 -period 7.055 -waveform {0 3.5} [get_nets {clk_pixel_x5}]
create_clock -name m0s[3] -period 50.000 -waveform {0 25} [get_ports {m0s[3]}]
create_generated_clock -name flash_clk -source [get_ports {clk}] -master_clock clk -divide_by 8 -multiply_by 19 [get_nets {flash_clk}]
create_generated_clock -name clk32 -source [get_ports {clk}] -master_clock clk -divide_by 16 -multiply_by 19 [get_nets {clk32}]
set_clock_groups -asynchronous -group [get_clocks {clk_sys}] -group [get_clocks {spi_io_clk}]
set_clock_groups -asynchronous -group [get_clocks {flash_clk}] -group [get_clocks {clk_sys}]
set_clock_groups -asynchronous -group [get_clocks {clk32}] -group [get_clocks {clk_sys}]
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
