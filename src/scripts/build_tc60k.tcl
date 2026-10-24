set board "tang_console60k"
set config "c16"
source scripts/update_xml.tcl

set_device GW5AT-LV60PG484AC1/I0 -device_version B

add_file c1541/mist_sd_card.sv
add_file c16.v
add_file c16_keymatrix.v
add_file colors_to_rgb.v
add_file dualshock2.v
add_file gen_uart.v
add_file gowin_dpb/gowin_dpb_track_buffer_b.v
add_file gowin_dpb/gowin_dpb_trkbuf.v
add_file gowin_dpb/sector_dpram.v
add_file hdmi/audio_clock_regeneration_packet.sv
add_file hdmi/audio_info_frame.sv
add_file hdmi/audio_sample_packet.sv
add_file hdmi/auxiliary_video_information_info_frame.sv
add_file hdmi/hdmi.sv
add_file hdmi/packet_assembler.sv
add_file hdmi/packet_picker.sv
add_file hdmi/serializer.sv
add_file hdmi/source_product_description_info_frame.sv
add_file hdmi/tmds_channel.sv
add_file iec_drive/iecdrv_misc.sv
add_file loader_sd_card.sv
add_file misc/flash_dspi_gw5a.v
add_file misc/hid.v
add_file misc/mcu_spi.v
add_file misc/osd_u8g2.v
add_file misc/scandoubler.v
add_file misc/sd_card.v
add_file misc/sd_rw.v
add_file misc/sdcmd_ctrl.v
add_file misc/sysctrl.v
add_file misc/video.v
add_file misc/video_analyzer.v
add_file mos6529.v
add_file mos8501.v
add_file pll_init.v
add_file sdram.v
add_file sid/sid_dac.sv
add_file sid/sid_envelope.sv
add_file sid/sid_filter.sv
add_file sid/sid_tables.sv
add_file sid/sid_top.sv
add_file sid/sid_voice.sv
add_file sid_card.v
add_file ted.v
add_file uart6551/io_fifo.v
add_file uart6551/uart_6551.v
add_file c1530.vhd
add_file c1541/c1541_logic.vhd
add_file c1541/c1541_sd.vhd
add_file c1541/gcr_floppy.vhd
add_file c1541/via6522.vhd
add_file fifo_sc_top/fifo_sc_top.vhd
add_file gowin_dpb/gowin_dpb_64kram.vhd
add_file gowin_pll/gowin_pll_60k_flash.vhd
add_file gowin_pll/gowin_pll_60k_flash_mod.vhd
add_file gowin_pll/gowin_pll_60k_ntsc.vhd
add_file gowin_pll/gowin_pll_60k_ntsc_mod.vhd
add_file gowin_pll/gowin_pll_60k_pal.vhd
add_file gowin_pll/gowin_pll_60k_pal_mod.vhd
add_file gowin_prom/gowin_prom_basic.vhd
add_file gowin_sdpb/gowin_sdpb_kernal_rom_16k_gw5a.vhd
add_file gowin_sp/gowin_sp_2k.vhd
add_file gowin_sp/gowin_sp_8k.vhd
add_file t65/T65.vhd
add_file t65/T65_ALU.vhd
add_file t65/T65_MCode.vhd
add_file t65/T65_Pack.vhd
add_file tang/console60k/c16nano_top.vhd
add_file tang/console60k/c16nano_top.cst
add_file tang/console60k/c16nano_top.sdc

set_option -synthesis_tool gowinsynthesis
set_option -output_base_name C16Nano_tc60k
set_option -verilog_std sysv2017
set_option -vhdl_std vhd2008
set_option -top_module c16nano_top
set_option -use_mspi_as_gpio 1
set_option -use_sspi_as_gpio 1
set_option -use_done_as_gpio 1
set_option -use_cpu_as_gpio 1
set_option -use_ready_as_gpio 1
set_option -use_i2c_as_gpio 1
set_option -use_jtag_as_gpio 1
set_option -use_mode_as_gpio 0
set_option -rw_check_on_ram 0
set_option -user_code 00000001
set_option -bit_compress 1
set_option -multi_boot 0
set_option -mspi_jump 0
#set_option -place_option 2
#set_option -route_option 1
set_option -ireg_in_iob 1
set_option -oreg_in_iob 1
set_option -ioreg_in_iob 1
#set_option -mspi_jump 1
#set_option -mspijump_address_width 24
#set_option -mspijump_mode quad
#set_option -merge_jumpbit 1

#run syn
run all
