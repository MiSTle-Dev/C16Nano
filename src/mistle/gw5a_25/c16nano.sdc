create_clock -name clk -period 20 -waveform {0 5} [get_ports {clk}]
create_clock -name pmod_companion_clk -period 50 -waveform {0 25} [get_nets {spi_io_clk}]
//create_clock -name spi_sclk -period 40 -waveform {0 5} [get_ports {spi_sclk}] -add
create_clock -name clk_audio -period 20833.332 -waveform {0 10000} [get_nets {video_inst/clk_audio}]
report_timing -hold -from_clock [all_clocks] -to_clock [all_clocks] -max_paths 100 -max_common_paths 1
report_timing -setup -from_clock [all_clocks] -to_clock [all_clocks] -max_paths 100 -max_common_paths 1
