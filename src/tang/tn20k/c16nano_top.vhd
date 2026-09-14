-------------------------------------------------------------------------
--  C16 Plus/4 Top level for Tang Nano 20k
--  2025...2026 Stefan Voss
--  based on the work of many others
--
--  FPGATED v1.0 Copyright 2013-2016 Istvan Hegedus
--
-------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity c16nano_top is
  port
  (
    clk         : in std_logic;
    key_reset   : in std_logic; -- S2 button
    key_user    : in std_logic; -- S1 button
    leds_n      : out std_logic_vector(5 downto 0);
    io          : inout std_logic_vector(5 downto 0);
    spare       : inout std_logic_vector(5 downto 0);
    ext_drive_interface : out std_logic;
    -- USB-C BL616 UART
    uart_rx     : in std_logic;
    --uart_tx     : out std_logic;
    -- monitor port
    bl616_mon_tx : out std_logic;
    -- external hw pin UART
    --uart_ext_rx : in std_logic;
    --uart_ext_tx : out std_logic;
    -- SPI interface external uC
    pmod_companion_din : in std_logic;
    pmod_companion_dout : out std_logic;
    pmod_companion_ss : in std_logic;
    pmod_companion_clk : in std_logic;
    pmod_companion_intn : out std_logic;
    -- SPI connection to onboard BL616
    spi_sclk    : in std_logic;
    spi_csn     : in std_logic;
    spi_dir     : out std_logic;
    spi_dat     : in std_logic;
    spi_irqn    : out std_logic;
    --
    tmds_clk_n  : out std_logic;
    tmds_clk_p  : out std_logic;
    tmds_d_n    : out std_logic_vector( 2 downto 0);
    tmds_d_p    : out std_logic_vector( 2 downto 0);
    -- sd interface
    sd_clk      : out std_logic;
    sd_cmd      : inout std_logic;
    sd_dat      : inout std_logic_vector(3 downto 0);
    ws2812      : out std_logic;
    -- "Magic" port names that the gowin compiler connects to the on-chip SDRAM
    O_sdram_clk  : out std_logic;
    O_sdram_cke  : out std_logic;
    O_sdram_cs_n : out std_logic; -- chip select
    O_sdram_cas_n: out std_logic; -- columns address select
    O_sdram_ras_n: out std_logic; -- row address select
    O_sdram_wen_n: out std_logic; -- write enable
    IO_sdram_dq  : inout std_logic_vector(31 downto 0); -- 32 bit bidirectional data bus
    O_sdram_addr : out std_logic_vector(10 downto 0); -- 11 bit multiplexed address bus
    O_sdram_ba   : out std_logic_vector(1 downto 0); -- two banks
    O_sdram_dqm  : out std_logic_vector(3 downto 0); -- 32/4
    -- spi flash interface
    mspi_cs       : out std_logic;
    mspi_clk      : out std_logic;
    mspi_di       : inout std_logic;
    mspi_hold     : inout std_logic;
    mspi_wp       : inout std_logic;
    mspi_do       : inout std_logic
    );
end;

architecture Behavioral_top of c16nano_top is

signal clk_sys        : std_logic;
signal pll_locked     : std_logic;
signal clk_pixel_x5   : std_logic;
signal clk_pixel_x5_pal   : std_logic;
attribute syn_keep : integer;
attribute syn_keep of clk_sys           : signal is 1;
attribute syn_keep of clk_pixel_x5      : signal is 1;

signal audio_data_l  : std_logic_vector(15 downto 0);
signal audio_data_r  : std_logic_vector(15 downto 0);
signal audio_l       : std_logic_vector(17 downto 0);
signal audio_r       : std_logic_vector(17 downto 0);
signal addr         : std_logic_vector(15 downto 0);

-- IEC
signal iec_data_o  : std_logic;
signal drive_iec_data_o : std_logic;
signal iec_clk_o   : std_logic;
signal drive_iec_clk_o  : std_logic;
signal iec_atn_o   : std_logic;
signal iec_atn_i   : std_logic;
signal ext_iec_clk : std_logic;
signal ext_iec_data : std_logic;
signal drive_iec_clk : std_logic;
signal drive_iec_data : std_logic;
  -- keyboard
signal joyUsb1      : std_logic_vector(4 downto 0);
signal joyUsb2      : std_logic_vector(4 downto 0);
signal joyDigital   : std_logic_vector(4 downto 0);
signal joyDigital1  : std_logic_vector(4 downto 0);
signal joyNumpad    : std_logic_vector(4 downto 0);
signal numpad       : std_logic_vector(7 downto 0);
-- joystick interface
signal joyA        : std_logic_vector(4 downto 0);
signal joyB        : std_logic_vector(4 downto 0);
signal port_1_sel  : std_logic_vector(3 downto 0);
signal port_2_sel  : std_logic_vector(3 downto 0);

signal ntscMode    :  std_logic;
signal hsync       :  std_logic;
signal vsync       :  std_logic;
signal r           :  std_logic_vector(3 downto 0);
signal g           :  std_logic_vector(3 downto 0);
signal b           :  std_logic_vector(3 downto 0);

signal mcu_start      : std_logic;
signal mcu_sys_strobe : std_logic;
signal mcu_hid_strobe : std_logic;
signal mcu_osd_strobe : std_logic;
signal mcu_sdc_strobe : std_logic;
signal data_in_start  : std_logic;
signal mcu_data_out   : std_logic_vector(7 downto 0);
signal hid_data_out   : std_logic_vector(7 downto 0);
signal osd_data_out   : std_logic_vector(7 downto 0) :=  X"55";
signal sys_data_out   : std_logic_vector(7 downto 0);
signal sdc_data_out   : std_logic_vector(7 downto 0);
signal hid_int        : std_logic;
signal system_scanlines : std_logic_vector(1 downto 0);
signal system_volume  : std_logic_vector(1 downto 0);
signal joystick1       : std_logic_vector(7 downto 0);
signal joystick2       : std_logic_vector(7 downto 0);
signal ws2812_color   : std_logic_vector(23 downto 0);
signal system_reset   : std_logic_vector(1 downto 0);
signal disk_reset     : std_logic;
signal disk_chg_trg   : std_logic;
signal disk_chg_trg_d : std_logic;
signal sd_img_size    : std_logic_vector(63 downto 0);
signal sd_img_size_d  : std_logic_vector(63 downto 0);
signal sd_img_mounted : std_logic_vector(7 downto 0);
signal sd_img_mounted_d : std_logic;
signal sd_rd          : std_logic_vector(7 downto 0);
signal sd_wr          : std_logic_vector(7 downto 0);
signal disk_lba       : std_logic_vector(31 downto 0);
signal sd_lba         : std_logic_vector(31 downto 0);
signal loader_lba     : std_logic_vector(31 downto 0);
signal sd_busy        : std_logic;
signal sd_done        : std_logic;
signal sd_rd_byte_strobe : std_logic;
signal sd_byte_index  : std_logic_vector(8 downto 0);
signal sd_rd_data     : std_logic_vector(7 downto 0);
signal sd_wr_data     : std_logic_vector(7 downto 0);
signal sd_change      : std_logic;
signal sdc_int        : std_logic;
signal sdc_iack       : std_logic;
signal int_ack        : std_logic_vector(7 downto 0);
signal spi_io_din     : std_logic;
signal spi_io_ss      : std_logic;
signal spi_io_clk     : std_logic;
attribute syn_keep of spi_io_clk : signal is 1;
signal spi_io_dout    : std_logic;
signal disk_g64       : std_logic;
signal disk_g64_d     : std_logic;
signal c1541_reset    : std_logic;
signal c1541_osd_reset : std_logic;
signal system_screen  : std_logic_vector(1 downto 0);
signal system_floppy_wprot : std_logic_vector(1 downto 0);
signal leds           : std_logic_vector(5 downto 0);
signal led1541        : std_logic;
signal db9_joy        : std_logic_vector(5 downto 0);
signal joy0_sel       : std_logic_vector(4 downto 0);
signal joy1_sel       : std_logic_vector(4 downto 0);
signal kernal_cea     : std_logic;
signal dos_sel        : std_logic_vector(1 downto 0);
signal c1541rom_cs    : std_logic;
signal c1541rom_addr  : std_logic_vector(14 downto 0);
signal c1541rom_data  : std_logic_vector(7 downto 0);
signal ext_en         : std_logic;
signal disk_access    : std_logic;
signal drive_iec_clk_old : std_logic;
signal drive_stb_i_old : std_logic;
signal drive_stb_o_old : std_logic;
signal hsync_out       : std_logic;
signal vsync_out       : std_logic;
signal hblank          : std_logic;
signal vblank          : std_logic;
signal key_r1          : std_logic;
signal key_r2          : std_logic;
signal key_l1          : std_logic;
signal key_l2          : std_logic;
signal key_triangle    : std_logic;
signal key_square      : std_logic;
signal key_circle      : std_logic;
signal key_cross       : std_logic;
signal key_up          : std_logic;
signal key_down        : std_logic;
signal key_left        : std_logic;
signal key_right       : std_logic;
signal key_r12         : std_logic;
signal key_r22         : std_logic;
signal key_l12         : std_logic;
signal key_l22         : std_logic;
signal key_triangle2   : std_logic;
signal key_square2     : std_logic;
signal key_circle2     : std_logic;
signal key_cross2      : std_logic;
signal key_up2         : std_logic;
signal key_down2       : std_logic;
signal key_left2       : std_logic;
signal key_right2      : std_logic;
signal audio_div       : unsigned(8 downto 0);
signal flash_clk       : std_logic;
attribute syn_keep of flash_clk : signal is 1;
signal flash_lock      : std_logic;
signal dcsclksel       : std_logic_vector(3 downto 0);
signal ioctl_download  : std_logic := '0';
signal ioctl_load_addr : std_logic_vector(22 downto 0);
signal ioctl_req_wr    : std_logic := '0';
signal load_crt        : std_logic := '0';
signal old_download    : std_logic := '0';
signal io_cycleD       : std_logic;
signal ioctl_wr        : std_logic := '0';
signal ioctl_addr      : std_logic_vector(22 downto 0);
signal load_prg        : std_logic := '0';
signal load_rom        : std_logic := '0';
signal load_tap        : std_logic := '0';
signal img_select      : std_logic_vector(2 downto 0);
signal loader_busy     : std_logic;
signal img_present     : std_logic := '0';
signal c1541_sd_rd     : std_logic;
signal c1541_sd_wr     : std_logic;
signal system_uart     : std_logic_vector(1 downto 0);
signal system_joyswap  : std_logic;
signal detach_reset    : std_logic;
signal detach          : std_logic;
signal disk_pause      : std_logic;
signal flash_ready      : std_logic;
signal usb_key          : std_logic_vector(7 downto 0);
signal c16_rnw          : std_logic;
signal c16_addr         : std_logic_vector(15 downto 0);
signal c16_dout         : std_logic_vector(7 downto 0);
signal c16_din          : std_logic_vector(7 downto 0);
signal cs_ram           : std_logic;
signal cs0              : std_logic;
signal cs1              : std_logic;
signal cs_io            : std_logic;
signal ram_dout         : std_logic_vector(7 downto 0);
signal ram_dout_i       : std_logic_vector(7 downto 0);
signal ram_we           : std_logic;
signal old_cs           : std_logic;
signal kernal0_dout     : std_logic_vector(7 downto 0);
signal kernal0_dout_i   : std_logic_vector(7 downto 0);
signal basic_dout       : std_logic_vector(7 downto 0);
signal basic_dout_i     : std_logic_vector(7 downto 0);
signal fh_dout          : std_logic_vector(7 downto 0);
signal fh_dout_i        : std_logic_vector(7 downto 0);
signal fl_dout          : std_logic_vector(7 downto 0);
signal fl_dout_i        : std_logic_vector(7 downto 0);
signal cartl_dout       : std_logic_vector(7 downto 0);
signal cartl_dout_i     : std_logic_vector(7 downto 0);
signal carth_dout       : std_logic_vector(7 downto 0);
signal carth_dout_i     : std_logic_vector(7 downto 0);
signal cass_dout        : std_logic_vector(7 downto 0);
signal openbus_data     : std_logic_vector(7 downto 0);
signal c16_datalatch    : std_logic_vector(7 downto 0);
signal openbus_sel      : std_logic;
signal dl_addr          : std_logic_vector(15 downto 0);
signal dl_data          : std_logic_vector(7 downto 0);
signal kern             : std_logic;
signal model            : std_logic;
signal roml             : std_logic_vector(1 downto 0);
signal romh             : std_logic_vector(1 downto 0);
signal cart_reset       : std_logic;
signal cartl            : std_logic;
signal carth            : std_logic;
signal old_io_cs        : std_logic;
signal resetc16         : std_logic;
signal int_out_n        : std_logic;
signal uart_tx_i        : std_logic;
signal spi_ext          : std_logic := '0';
signal ioctl_dout       : std_logic_vector(7 downto 0);
signal tvmode           : std_logic_vector(1 downto 0);
signal c16_iec_reset_o  : std_logic;
signal dl_wr            : std_logic;
signal state            : std_logic_vector(3 downto 0) := "0000";
signal xreset, xrst     : std_logic;
signal palmode          : std_logic;
signal clk32            : std_logic;
attribute syn_keep of clk32 : signal is 1;
signal serial_status    : std_logic_vector(31 downto 0);
signal serial_tx_available : std_logic_vector(7 downto 0);
signal serial_tx_strobe : std_logic;
signal serial_tx_data   : std_logic_vector(7 downto 0);
signal serial_rx_available : std_logic_vector(7 downto 0);
signal serial_rx_strobe : std_logic;
signal serial_rx_data   : std_logic_vector(7 downto 0);
signal tap_play_addr   : unsigned(22 downto 0);
signal tap_last_addr   : unsigned(22 downto 0);
signal tap_version     : std_logic_vector(1 downto 0);
signal tap_data        : std_logic_vector(7 downto 0);
signal tap_data_in     : std_logic_vector(7 downto 0);
signal tap_dl_addr     : unsigned(22 downto 0);
signal cass_write      : std_logic;
signal cass_motor      : std_logic;
signal cass_sense      : std_logic;
signal cass_read       : std_logic;
signal cass_run        : std_logic;
signal cass_snd        : std_logic;
signal tap_download    : std_logic;
signal tap_reset       : std_logic;
signal tap_loaded      : std_logic;
signal tap_play_btn    : std_logic;
signal tap_wrreq       : std_logic;
signal tap_wrfull      : std_logic;
signal tap_autoplay    : std_logic;
signal tap_sdram_oe    : std_logic := '0';
signal tap_wr          : std_logic := '0';
signal tap_start       : std_logic;
signal tap_finish      : std_logic;
signal cass_aud        : std_logic;
signal ioctl_wr_d      : std_logic;
signal ioctl_wait      : std_logic := '0';
signal tap_rd          : std_logic; 
signal tap_data_ready  : std_logic;
signal tap_cycle       : std_logic := '0';
signal tap_download_d  : std_logic := '0';
signal tape_adc_act    : std_logic;
signal casmatch        : std_logic;
signal sdram_cs        : std_logic;
signal sdram_oe        : std_logic;
signal sdram_wr        : std_logic;
signal crt_download_access : std_logic;
signal function_download_access : std_logic;
signal sdram_addr      : std_logic_vector(22 downto 0);
signal sdram_din       : std_logic_vector(7 downto 0);
signal sdram_rom_access : std_logic;
signal c16_refresh     : std_logic;
signal core_wait       : std_logic;
signal refresh         : std_logic;
signal spi_intn        : std_logic;
signal pll_locked_comb : std_logic;
signal load_function   : std_logic := '0';
signal disk_sd_wr_data : unsigned(7 downto 0);
signal ext_iec_en      : std_logic_vector(1 downto 0);
signal int_iec_drv     : std_logic_vector(1 downto 0);

constant RAM_ADDR      : unsigned(22 downto 0) := 23x"0000000";-- System RAM: 64k
constant CRT_ADDR      : unsigned(22 downto 0) := 23x"0200000";-- Cartridge ROM
constant FUNC_ADDR     : unsigned(22 downto 0) := 23x"0300000";-- Function ROM
constant TAP_ADDR      : unsigned(22 downto 0) := 23x"0400000";-- Tape buffer

component rPLL
    generic (
        FCLKIN: in string := "100.0";
        DEVICE: in string := "GW2A-18";
        DYN_IDIV_SEL: in string := "false";
        IDIV_SEL: in integer := 0;
        DYN_FBDIV_SEL: in string := "false";
        FBDIV_SEL: in integer := 0;
        DYN_ODIV_SEL: in string := "false";
        ODIV_SEL: in integer := 8;
        PSDA_SEL: in string := "0000";
        DYN_DA_EN: in string := "false";
        DUTYDA_SEL: in string := "1000";
        CLKOUT_FT_DIR: in bit := '1';
        CLKOUTP_FT_DIR: in bit := '1';
        CLKOUT_DLY_STEP: in integer := 0;
        CLKOUTP_DLY_STEP: in integer := 0;
        CLKOUTD3_SRC: in string := "CLKOUT";
        CLKFB_SEL: in string := "internal";
        CLKOUT_BYPASS: in string := "false";
        CLKOUTP_BYPASS: in string := "false";
        CLKOUTD_BYPASS: in string := "false";
        CLKOUTD_SRC: in string := "CLKOUT";
        DYN_SDIV_SEL: in integer := 2
    );
    port (
        CLKOUT: out std_logic;
        LOCK: out std_logic;
        CLKOUTP: out std_logic;
        CLKOUTD: out std_logic;
        CLKOUTD3: out std_logic;
        RESET: in std_logic;
        RESET_P: in std_logic;
        CLKIN: in std_logic;
        CLKFB: in std_logic;
        FBDSEL: in std_logic_vector(5 downto 0);
        IDSEL: in std_logic_vector(5 downto 0);
        ODSEL: in std_logic_vector(5 downto 0);
        PSDA: in std_logic_vector(3 downto 0);
        DUTYDA: in std_logic_vector(3 downto 0);
        FDLY: in std_logic_vector(3 downto 0)
    );
end component;

component CLKDIV
    generic (
        DIV_MODE : STRING := "2";
        GSREN: in string := "false"
    );
    port (
        CLKOUT: out std_logic;
        HCLKIN: in std_logic;
        RESETN: in std_logic;
        CALIB: in std_logic
    );
end component;

component DL
  generic ( 
    INIT : bit := '0' 
  );	
  port (
	 Q : OUT std_logic;	
	 D : IN std_logic;	
	 G : IN std_logic
    );
end component;

begin

  -- BL616 console to hw pins for external USB-UART adapter
  bl616_mon_tx <= uart_rx;

  process (clk)
  begin
    if rising_edge(clk) then
      if pll_locked = '0' then
        spi_ext <= '0';
      elsif pmod_companion_ss = '0' then
        spi_ext <= '1';
      end if;
    end if;
  end process;

  spi_io_din <= pmod_companion_din when spi_ext = '1' else spi_dat;
  spi_io_ss <= pmod_companion_ss when spi_ext = '1' else spi_csn;
  spi_io_clk <= pmod_companion_clk when spi_ext = '1' else spi_sclk;
  spi_dir <= spi_io_dout;
  spi_irqn <= spi_intn;
  pmod_companion_dout <= spi_io_dout;
  pmod_companion_intn <= spi_intn;

  ext_iec_clk <= '1' when ext_iec_en = "00" else
                 io(0) when ext_iec_en = "01" else
                 spare(0) when ext_iec_en = "10" else '0';

  ext_iec_data <= '1' when ext_iec_en = "00" else
                  io(1) when ext_iec_en = "01" else
                  spare(1) when ext_iec_en = "10" else '0';

  io(0) <= 'Z' when ext_iec_en /= "01" or (iec_clk_o = '1' and drive_iec_clk_o = '1') else '0';
  io(1) <= 'Z' when ext_iec_en /= "01" or (iec_data_o = '1' and drive_iec_data_o = '1') else '0';
  io(2) <= 'Z' when ext_iec_en /= "01" or (xreset = '0' and c1541_osd_reset = '0') else '0';
  io(3) <= 'Z' when ext_iec_en /= "01" or iec_atn_o = '1' else '0';
  io(5 downto 4) <= (others => 'Z');

  spare(0) <= 'Z' when ext_iec_en /= "10" or (iec_clk_o = '1' and drive_iec_clk_o = '1') else '0';
  spare(1) <= 'Z' when ext_iec_en /= "10" or (iec_data_o = '1' and drive_iec_data_o = '1') else '0';
  spare(2) <= 'Z' when ext_iec_en /= "10" or (xreset = '0' and c1541_osd_reset = '0') else '0';
  spare(3) <= 'Z' when ext_iec_en /= "10" or iec_atn_o = '1' else '0';
  spare(5 downto 4) <= (others => 'Z');

  drive_iec_clk <= drive_iec_clk_o and ext_iec_clk;
  drive_iec_data <= drive_iec_data_o and ext_iec_data;

    led_ws2812: entity work.ws2812
    port map
    (
     clk    => clk_sys,
     color  => ws2812_color,
     data   => ws2812
    );

process(clk_sys)
variable reset_cnt : integer range 0 to 2147483647;
  begin
  if rising_edge(clk_sys) then
    if disk_reset = '1' then
      disk_chg_trg <= '0';
      reset_cnt := 64000000;
    elsif reset_cnt /= 0 then
      reset_cnt := reset_cnt - 1;
    elsif reset_cnt = 0 then
      disk_chg_trg <= '1';
    end if;
  end if;
end process;

-- delay disk start to keep loader at power-up intact
process(clk_sys)
  variable pause_cnt : integer range 0 to 2147483647;
  begin
  if rising_edge(clk_sys) then
    if resetc16 = '1' then
      disk_pause <= '1';
      pause_cnt := 34000000;
    elsif pause_cnt /= 0 then
      pause_cnt := pause_cnt - 1;
    elsif pause_cnt = 0 then 
      disk_pause <= '0';
    end if;
  end if;
end process;

disk_reset <= '1' when not flash_ready or resetc16 or c16_iec_reset_o or c1541_osd_reset else '0';

-- rising edge sd_change triggers detection of new disk
process(clk_sys, pll_locked)
  begin
  if pll_locked = '0' then
    sd_change <= '0';
    sd_img_size_d <= (others => '0');
    disk_chg_trg_d <= '0';
    img_present <= '0';
  elsif rising_edge(clk_sys) then
      sd_img_mounted_d <= sd_img_mounted(0);
      disk_chg_trg_d <= disk_chg_trg;

      if sd_img_mounted(0) = '1' then
        img_present <= '0' when unsigned(sd_img_size) = 0 else '1';
      end if;

      if sd_img_mounted_d = '0' and sd_img_mounted(0) = '1' then
        sd_img_size_d <= sd_img_size;
      end if;

      if (sd_img_mounted(0) /= sd_img_mounted_d) or
         (disk_chg_trg_d = '0' and disk_chg_trg = '1') then
          sd_change  <= '1';
          else
          sd_change  <= '0';
      end if;
  end if;
end process;

c1541_sd_inst : entity work.c1541_sd
port map
 (
    clk32         => clk32,
    clk2          => clk_sys,
    reset         => disk_reset,
    pause         => loader_busy,
    ce            => '0',
    ds            => int_iec_drv,

    disk_num      => (others =>'0'),
    disk_change   => sd_change, 
    disk_mount    => img_present,
    disk_readonly => system_floppy_wprot(0),
    disk_g64      => '0',

    iec_atn_i     => iec_atn_o,
    iec_data_i    => iec_data_o and ext_iec_data,
    iec_clk_i     => iec_clk_o and ext_iec_clk,

    iec_data_o    => drive_iec_data_o,
    iec_clk_o     => drive_iec_clk_o,

    par_data_i    => "11111111",
    par_stb_i     => '1',
    par_data_o    => open,
    par_stb_o     => open,

    sd_lba        => disk_lba,
    sd_rd         => c1541_sd_rd,
    sd_wr         => c1541_sd_wr,
    sd_ack        => sd_busy,
    sd_done       => sd_done,

    sd_buff_addr  => sd_byte_index,
    sd_buff_dout  => sd_rd_data,
    unsigned(sd_buff_din) => disk_sd_wr_data,
    sd_buff_wr    => sd_rd_byte_strobe,

    led           => led1541,
    ext_en        => '0',
    c1541rom_cs   => c1541rom_cs,
    c1541rom_addr => c1541rom_addr,
    c1541rom_data => c1541rom_data
);

sdc_iack <= int_ack(3);

sd_card_inst: entity work.sd_card
   generic map (
    CLK_DIV  => 0,
    SIMULATE => 0,
    IMAGE_FIFO_BITS => 9
   )
    port map (
    rstn            => pll_locked, 
    clk             => clk_sys,
  
    -- SD card signals
    sdclk           => sd_clk,
    sdcmd           => sd_cmd,
    sddat           => sd_dat,

    -- mcu interface
    data_strobe     => mcu_sdc_strobe,
    data_start      => mcu_start,
    data_in         => mcu_data_out,
    data_out        => sdc_data_out,

    -- interrupt to signal communication request
    irq             => sdc_int,
    iack            => sdc_iack,

    -- output file/image information. Image size is e.g. used by fdc to 
    -- translate between sector/track/side and lba sector
    image_size => sd_img_size, -- length of image file
    image_mounted   => sd_img_mounted,

    rom_image_selection_strobe => open,
    rom_image_selected => open,
    rom_image_accepted => '0',
    rom_image_data_available => open,
    rom_image_data => open,
    rom_image_data_strobe => '0',

    -- user read sector command interface (sync with clk)
    rstart          => sd_rd,
    wstart          => sd_wr, 
    rsector         => sd_lba,
    rsrc            => open, -- source currently being process and for which 

    rbusy           => sd_busy,
    rdone           => sd_done,           --  done from sd reader acknowledges/clears start

    -- sector data output interface (sync with clk)
    inbyte          => sd_wr_data,        -- sector data output interface (sync with clk)
    outen           => sd_rd_byte_strobe, -- when outen=1, a byte of sector content is read out from outbyte
    outaddr         => sd_byte_index,     -- outaddr from 0 to 511, because the sector size is 512
    outbyte         => sd_rd_data         -- a byte of sector content
);

audio_div  <= to_unsigned(342,9) when ntscMode = '1' else to_unsigned(327,9);

cass_aud <= cass_read and not cass_sense and not cass_motor;
audio_l <= (audio_data_l & "00") or (4x"00" & cass_aud & 13x"00000");
audio_r <= audio_l;
tape_adc_act <= '0';

video_inst: entity work.video
generic map
(
  STEREO  => false
)
port map(
      user         => '0',
      pll_lock     => pll_locked, 
      clk          => clk_sys,
      clk_pixel_x5 => clk_pixel_x5,
      audio_div    => audio_div,
      
      ntscmode  => palmode,
      vb_in     => vblank,
      hb_in     => hblank,
      hs_in_n   => hsync,
      vs_in_n   => vsync,

      r_in      => r,
      g_in      => g,
      b_in      => b,

      audio_l => audio_l,
      audio_r => audio_r,
      osd_status => open,

      mcu_start => mcu_start,
      mcu_osd_strobe => mcu_osd_strobe,
      mcu_data  => mcu_data_out,

      -- values that can be configure by the user via osd
      system_screen => system_screen,
      system_scanlines => system_scanlines,
      system_volume => system_volume,

      tmds_clk_n => tmds_clk_n,
      tmds_clk_p => tmds_clk_p,
      tmds_d_n   => tmds_d_n,
      tmds_d_p   => tmds_d_p
      );

-- Clock tree and all frequencies in Hz
--
-- NTSC 28.636299 143,181495, PAL 28.384615 141,923075

mainclock_pal: rPLL
        generic map (
            FCLKIN => "27",
            DEVICE => "GW2AR-18C",
            DYN_IDIV_SEL => "false",
            IDIV_SEL => 3,
            DYN_FBDIV_SEL => "false",
            FBDIV_SEL => 20,
            DYN_ODIV_SEL => "false",
            ODIV_SEL => 4,
            PSDA_SEL => "0000",
            DYN_DA_EN => "true",
            DUTYDA_SEL => "1000",
            CLKOUT_FT_DIR => '1',
            CLKOUTP_FT_DIR => '1',
            CLKOUT_DLY_STEP => 0,
            CLKOUTP_DLY_STEP => 0,
            CLKFB_SEL => "internal",
            CLKOUT_BYPASS => "false",
            CLKOUTP_BYPASS => "false",
            CLKOUTD_BYPASS => "false",
            DYN_SDIV_SEL => 2,
            CLKOUTD_SRC => "CLKOUT",
            CLKOUTD3_SRC => "CLKOUT"
        )
        port map (
            CLKOUT   => clk_pixel_x5,
            LOCK     => pll_locked,
            CLKOUTP  => open,
            CLKOUTD  => open,
            CLKOUTD3 => open,
            RESET    => '0',
            RESET_P  => '0',
            CLKIN    => clk,
            CLKFB    => '0',
            FBDSEL   => (others => '0'),
            IDSEL    => (others => '0'),
            ODSEL    => (others => '0'),
            PSDA     => (others => '0'),
            DUTYDA   => (others => '0'),
            FDLY     => (others => '0')
        );

div_inst: CLKDIV
generic map(
    DIV_MODE => "5",
    GSREN    => "false"
)
port map(
    CLKOUT => clk_sys,
    HCLKIN => clk_pixel_x5,
    RESETN => pll_locked,
    CALIB  => '0'
);

flash_pll_inst:  rPLL
        generic map (
            FCLKIN => "27",
            DEVICE => "GW2AR-18C",
            DYN_IDIV_SEL => "false",
            IDIV_SEL => 7,
            DYN_FBDIV_SEL => "false",
            FBDIV_SEL => 18,
            DYN_ODIV_SEL => "false",
            ODIV_SEL => 8,
            PSDA_SEL => "1000",
            DYN_DA_EN => "false",
            DUTYDA_SEL => "1000",
            CLKOUT_FT_DIR => '1',
            CLKOUTP_FT_DIR => '1',
            CLKOUT_DLY_STEP => 0,
            CLKOUTP_DLY_STEP => 0,
            CLKFB_SEL => "internal",
            CLKOUT_BYPASS => "false",
            CLKOUTP_BYPASS => "false",
            CLKOUTD_BYPASS => "false",
            DYN_SDIV_SEL => 2,
            CLKOUTD_SRC => "CLKOUT",
            CLKOUTD3_SRC => "CLKOUT"
        )
        port map (
            CLKOUT   => flash_clk, -- clock Flash controller
            LOCK     => flash_lock,
            CLKOUTP  => mspi_clk, -- phase shifted clock SPI Flash
            CLKOUTD  => clk32,
            CLKOUTD3 => open,
            RESET    => '0',
            RESET_P  => '0',
            CLKIN    => clk,
            CLKFB    => '0',
            FBDSEL   => (others => '0'),
            IDSEL    => (others => '0'),
            ODSEL    => (others => '0'),
            PSDA     => (others => '0'),
            DUTYDA   => (others => '0'),
            FDLY     => (others => '1')
        );

leds_n(5 downto 0) <= not leds(5 downto 0);
leds(5 downto 1) <= (others => '0');
leds(0) <= led1541; -- green

joyDigital  <= (others => '0') when ext_iec_en = "01" else
               not(io(0) & io(2) & io(1) & io(4) & io(3));
joyDigital1 <= (others => '0') when ext_iec_en = "10" else
               not(spare(0) & spare(2) & spare(1) & spare(4) & spare(3));
joyUsb1    <= joystick1(4) & joystick1(3) & joystick1(2) & joystick1(1) & joystick1(0);
joyUsb2    <= joystick2(4) & joystick2(3) & joystick2(2) & joystick2(1) & joystick2(0);
joyNumpad  <= numpad(4) & numpad(0) & numpad(1) & numpad(2) & numpad(3);

-- send external DB9 joystick port to uC
db9_joy <= (others => '0') when ext_iec_en = "01" else
           not('1' & io(0) & io(2) & io(1) & io(4) & io(3));

process(clk_sys)
begin
	if rising_edge(clk_sys) then
    case port_1_sel is
      when "0000"  => joyA <= joyDigital;
      when "0001"  => joyA <= joyDigital1;
      when "0010"  => joyA <= joyUsb1;
      when "0011"  => joyA <= joyUsb2;
      when "0100"  => joyA <= joyNumpad;
      when others  => joyA <= (others => '0');
      end case;

    case port_2_sel is
      when "0000"  => joyB <= joyDigital;
      when "0001"  => joyB <= joyDigital1;
      when "0010"  => joyB <= joyUsb1;
      when "0011"  => joyB <= joyUsb2;
      when "0100"  => joyB <= joyNumpad;
      when others  => joyB <= (others => '0');
      end case;
  end if;
end process;

mcu_spi_inst: entity work.mcu_spi 
port map (
  clk            => clk_sys,
  reset          => not pll_locked,
  -- SPI interface to BL616 MCU
  spi_io_ss      => spi_io_ss,      -- SPI CSn
  spi_io_clk     => spi_io_clk,     -- SPI SCLK
  spi_io_din     => spi_io_din,     -- SPI MOSI
  spi_io_dout    => spi_io_dout,    -- SPI MISO
  -- byte interface to the various core components
  mcu_sys_strobe => mcu_sys_strobe, -- byte strobe for system control target
  mcu_hid_strobe => mcu_hid_strobe, -- byte strobe for HID target  
  mcu_osd_strobe => mcu_osd_strobe, -- byte strobe for OSD target
  mcu_sdc_strobe => mcu_sdc_strobe, -- byte strobe for SD card target
  mcu_start      => mcu_start,
  mcu_sys_din    => sys_data_out,
  mcu_hid_din    => hid_data_out,
  mcu_osd_din    => osd_data_out,
  mcu_sdc_din    => sdc_data_out,
  mcu_dout       => mcu_data_out
);

-- decode SPI/MCU data received for human input devices (HID) 
hid_inst: entity work.hid
 port map 
 (
  clk             => clk_sys,
  reset           => not pll_locked,
  -- interface to receive user data from MCU (mouse, kbd, ...)
  data_in_strobe  => mcu_hid_strobe,
  data_in_start   => mcu_start,
  data_in         => mcu_data_out,
  data_out        => hid_data_out,

  -- input local db9 port events to be sent to MCU
  db9_port        => db9_joy,
  irq             => hid_int,
  iack            => int_ack(1),

  -- output HID data received from USB
  usb_kbd         => usb_key,
  joystick0       => joystick1,
  joystick1       => joystick2,
  numpad          => numpad,
  mouse_btns      => open,
  mouse_x         => open,
  mouse_y         => open,
  mouse_strobe    => open,
  joystick0ax     => open,
  joystick0ay     => open,
  joystick1ax     => open,
  joystick1ay     => open,
  joystick_strobe => open,
  extra_button0   => open,
  extra_button1   => open
);

 module_inst: entity work.sysctrl 
 port map 
 (
  clk                 => clk_sys,
  reset               => not pll_locked,
--
  data_in_strobe      => mcu_sys_strobe,
  data_in_start       => mcu_start,
  data_in             => mcu_data_out,
  data_out            => sys_data_out,

  -- values that can be configured by the user
  system_reset        => system_reset,
  system_scanlines    => system_scanlines,
  system_volume       => system_volume,
  system_screen       => system_screen,
  system_floppy_wprot => system_floppy_wprot,
  system_port_1       => port_1_sel,
  system_port_2       => port_2_sel,
  system_dos_sel      => dos_sel,
  system_1541_reset   => c1541_osd_reset,
  system_model        => model,
  system_tape_sound   => open,
  system_tv           => tvmode,
  system_uart         => system_uart,
  system_joyswap      => system_joyswap,
  system_detach_reset => detach_reset,
  system_ext_iec_en   => ext_iec_en,
  system_int_iec_drv  => int_iec_drv,

  port_status         => serial_status, -- in
  port_out_available  => serial_tx_available, --in
  port_out_strobe     => serial_tx_strobe, -- out
  port_out_data       => serial_tx_data, --in
  port_in_available   => serial_rx_available, -- in
  port_in_strobe      => serial_rx_strobe, -- out
  port_in_data        => serial_rx_data, -- out

  int_out_n           => spi_intn,
  int_in              => unsigned'(x"0" & sdc_int & '0' & hid_int & '0'),
  int_ack             => int_ack,

  buttons             => unsigned'(key_user & key_reset), -- S2 and S1 buttons
  leds                => open,
  color               => ws2812_color
);

ext_drive_interface <= '1' when ext_iec_en /= "00" else '0';

pll_locked_comb <= pll_locked and flash_lock;

-- c1541 ROM's SPI Flash
-- TN20k  Winbond 25Q64JVIQ
-- TP25k  XTX XT25F64FWOIG
-- TM138k Winbond 25Q128BVEA
-- TM60k  Winbond 25Q64JVIQ
-- phase shift 135° TN, TP and 270° TM
-- offset in spi flash TN20K, TP25K $200000, TM138K $A00000, TM60k $700000
flash_inst: entity work.flash 
port map(
    clk       => flash_clk,
    resetn    => pll_locked_comb,
    ready     => flash_ready,
    busy      => open,
    address   => (X"2" & "000" & dos_sel & c1541rom_addr),
    cs        => c1541rom_cs,
    dout      => c1541rom_data,
    mspi_cs   => mspi_cs,
    mspi_di   => mspi_di,
    mspi_hold => mspi_hold,
    mspi_wp   => mspi_wp,
    mspi_do   => mspi_do
);

--/////////////////   ROM   /////////////////////////

kernal_cea <= '1' when ioctl_wr = '1' and unsigned(ioctl_addr(22 downto 14)) = 0 and load_rom = '1' else '0';

kernal_inst: entity work.Gowin_SDPB_kernal_rom_16k
    port map (
        dout => kernal0_dout_i,
        clka => clk_sys,
        cea => kernal_cea,
        clkb => clk_sys,
        ceb => '1',
        reseta => '0',
        resetb => '0',
        oce => '1',
        ada => ioctl_addr(13 downto 0),
        din => ioctl_dout,
        adb => c16_addr(13 downto 0)
);

basic_inst: entity work.Gowin_pROM_basic
    port map (
        dout => basic_dout_i,
        clk => clk_sys,
        oce => '1',
        ce => '1',
        reset => '0',
        ad => c16_addr(13 downto 0)
    );

process(clk_sys, xrst)
begin
  if xrst = '1' then
   cartl <= '0';
   carth <= '0';
  elsif rising_edge(clk_sys) then
   cartl <= '1' when ioctl_wr = '1' and load_crt = '1' and unsigned(ioctl_addr(22 downto 14)) = 0 else '0';
   carth <= '1' when ioctl_wr = '1' and load_crt = '1' and unsigned(ioctl_addr(22 downto 14)) = 1 else '0';
  end if;
end process;

kern <= '1' when c16_addr(15 downto 8) = x"FC" else '0';

process(clk_sys, resetc16)
begin
	if resetc16 = '1' then
    romh <= "00";
    roml <= "00";
  elsif rising_edge(clk_sys) then
	  old_io_cs <= cs_io;
    if model = '1' and old_io_cs = '1' and cs_io = '0' and c16_rnw = '0' and c16_addr(15 downto 4) = 12x"FDD" then 
      romh <= c16_addr(3 downto 2);
      roml <= c16_addr(1 downto 0);
    end if;
  end if;
end process;

ram_dout <= ram_dout_i when cs_ram = '0' else x"FF";
kernal0_dout <= kernal0_dout_i when cs1 = '0' and (unsigned(romh) = 0 or kern = '1') else x"FF";
basic_dout <= basic_dout_i when cs0 = '0' and unsigned(roml) = 0 else x"FF";
casmatch <= '1' when c16_addr(8 downto 4) /= 5x"11" else '0';
cass_dout <= "11111" & (cs_io or casmatch or (not tape_adc_act and cass_sense)) & "11";

fl_dout <= ram_dout_i when cs0 = '0' and unsigned(roml) = 2 else x"FF";
fh_dout <= ram_dout_i when cs1 = '0' and unsigned(romh) = 2 and kern = '0' else x"FF";
cartl_dout <= ram_dout_i when cs0 = '0' and cartl = '1' and unsigned(roml) = 1 else x"FF";
carth_dout <= ram_dout_i when cs1 = '0' and carth = '1' and unsigned(romh) = 1 and kern = '0' else x"FF";

c16_din <= ram_dout and kernal0_dout and basic_dout and cartl_dout and carth_dout
           and fl_dout and fh_dout and cass_dout and openbus_data;

process(all)
begin
  if rising_edge(clk_sys) then
    c16_datalatch <= c16_din;
  end if;
end process;

openbus_sel <= '1' when c16_addr(15 downto 5) = x"FD" & "111" else '0';
openbus_data <= c16_datalatch when openbus_sel = '1' else x"ff";

resetc16 <= system_reset(0) or not pll_locked or not flash_lock;
xrst <= resetc16 or detach_reset;
xreset <= resetc16 or cart_reset or detach_reset;
joy0_sel <= joyB when system_joyswap = '1' else joyA;
joy1_sel <= joyA when system_joyswap = '1' else joyB;

 c16_inst: entity work.c16 
 port map 
 (
	CLK28    => clk_sys,
	RESET    => xreset,
	INWAIT   => core_wait,
	PAL      => palmode,
	HSYNC    => hsync,
	VSYNC    => vsync,
	HBLANK   => hblank,
	VBLANK   => vblank,
	RED      => r,
	GREEN    => g,
	BLUE     => b,

	RAS      => open,
	CAS      => open,
  refresh  => c16_refresh,
	RnW      => c16_rnw,
	ADDR     => c16_addr,
	DOUT     => c16_dout,
	DIN      => c16_din,
	CS_RAM   => cs_ram,
	CS0      => cs0,
	CS1      => cs1,
	CS_IO    => cs_io,

	cass_mtr => cass_motor,
	cass_in  => cass_read,
  cass_aud => cass_aud,
	cass_out => cass_write,

	JOY0     => joy0_sel,
	JOY1     => joy1_sel,

	ps2_key  => "000" & usb_key,
	key_play => open,

	sid_type => "00",
	sound    => audio_data_l,

  IEC_DATAIN   => drive_iec_data,
  IEC_CLKIN    => drive_iec_clk,
	IEC_ATNOUT   => iec_atn_o,
	IEC_DATAOUT  => iec_data_o,
	IEC_CLKOUT   => iec_clk_o,
	IEC_RESET    => c16_iec_reset_o,

  serial_status_out   => serial_status,
  serial_data_out_available => serial_tx_available,
  serial_strobe_out   => serial_tx_strobe,
  serial_data_out     => serial_tx_data,

  serial_data_in_free => serial_rx_available,
  serial_strobe_in    => serial_rx_strobe,
  serial_data_in      => serial_rx_data,

  RS232_RX     => uart_rx, -- future 
  RS232_TX     => open  -- future
  );

process(clk_sys)
  variable wait_cnt : integer;
begin
  if rising_edge(clk_sys) then
  ioctl_wr_d <= ioctl_wr;
  old_download <= ioctl_download;

  if (system_reset(1) or detach_reset) = '1' then
    cart_reset <= '0';
  elsif old_download /= ioctl_download and ((model and (load_crt or load_function)) or load_rom) = '1' then
    cart_reset <= ioctl_download;
  end if;

  if resetc16 = '1' then 
    dl_wr <= '0'; 
    wait_cnt := 0;
    ioctl_wait <= '0';
  end if;

  if wait_cnt /= 0 then
    wait_cnt := wait_cnt - 1;
  elsif wait_cnt = 0 then 
    dl_wr <= '0';
    ioctl_wait <= '0';
  end if;

  if ioctl_download ='1' and load_prg = '1' then
    state <= x"0";
    if ioctl_wr_d = '0' and ioctl_wr = '1' then
      if unsigned(ioctl_addr) = 0 then 
        addr(7 downto 0) <= ioctl_dout;
      elsif unsigned(ioctl_addr) = 1 then 
        addr(15 downto 8) <= ioctl_dout;
      else
        wait_cnt := 32;
        ioctl_wait <= '1';
        dl_addr <= addr;
				dl_data <= ioctl_dout;
				dl_wr   <= '1';
				addr    <= std_logic_vector(unsigned(addr) + 1);
			end if;
    end if;
    elsif ioctl_download = '1' and
      (load_crt = '1' or load_function = '1' or load_tap = '1') then
    if ioctl_wr_d = '0' and ioctl_wr = '1' then
      wait_cnt := 32;
      ioctl_wait <= '1';
      dl_addr <= ioctl_addr(15 downto 0);
      if load_tap = '1' then
        tap_dl_addr <= unsigned(ioctl_addr);
        if unsigned(ioctl_addr) = to_unsigned(16#0C#, ioctl_addr'length) then
            tap_version <= ioctl_dout(1 downto 0);
        end if;
      end if;
      dl_data <= ioctl_dout;
      dl_wr <= '1';
    end if;
  end if;

  if old_download = '1' and ioctl_download = '0' and load_prg = '1' then
      state <= x"1"; 
  end if;

  if state /= x"0" then 
       state <= std_logic_vector(unsigned(state) + 1);
  end if;

  case(state) is
      when x"1" => dl_addr <= x"002d"; dl_data <= addr(7 downto 0); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"3" => dl_addr <= x"002e"; dl_data <= addr(15 downto 8); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"5" => dl_addr <= x"002f"; dl_data <= addr(7 downto 0); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"7" => dl_addr <= x"0030"; dl_data <= addr(15 downto 8); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"9" => dl_addr <= x"0031"; dl_data <= addr(7 downto 0); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"B" => dl_addr <= x"0032"; dl_data <= addr(15 downto 8); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"D" => dl_addr <= x"009d"; dl_data <= addr(7 downto 0); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when x"F" => dl_addr <= x"009e"; dl_data <= addr(15 downto 8); dl_wr <= '1';ioctl_wait <= '1'; wait_cnt := 32;
      when others =>
  end case;

 end if;
end process;

crt_inst : entity work.loader_sd_card
  port map (
    clk               => clk_sys,
    reset             => resetc16,
  
    sd_lba            => sd_lba,
    sd_rd             => sd_rd,
    sd_wr             => sd_wr,
    sd_busy           => sd_busy,
    sd_done           => sd_done,
  
    sd_byte_index     => sd_byte_index,
    sd_rd_data        => sd_rd_data,
    sd_rd_byte_strobe => sd_rd_byte_strobe,
    sd_wr_data        => sd_wr_data,

    c1541_lba         => std_logic_vector(disk_lba),
    c1541_sd_rd       => c1541_sd_rd,
    c1541_sd_wr       => c1541_sd_wr,
    c1541_sd_wr_data  => std_logic_vector(disk_sd_wr_data),

    sd_img_mounted    => sd_img_mounted,
    loader_busy       => loader_busy,
    load_crt          => load_crt,
    load_prg          => load_prg,
    load_rom          => load_rom,
    load_tap          => load_tap,
    load_flt          => load_function,
    load_reu          => open,
    sd_img_size       => sd_img_size(31 downto 0),
  
    ioctl_download    => ioctl_download,
    ioctl_addr(22 downto 0) => ioctl_addr,
    ioctl_dout        => ioctl_dout,
    ioctl_wr          => ioctl_wr,
    ioctl_wait        => ioctl_wait
  );

dram_inst: entity work.sdram8
   port map(
    -- SDRAM side interface
    sd_clk  => O_sdram_clk,
    sd_cke  => O_sdram_cke,
    sd_data => IO_sdram_dq,   -- 32 bit bidirectional data bus
    sd_addr => O_sdram_addr,  -- 11 bit multiplexed address bus
    sd_dqm  => O_sdram_dqm,   -- two byte masks
    sd_ba   => O_sdram_ba,    -- two banks
    sd_cs   => O_sdram_cs_n,  -- a single chip select
    sd_we   => O_sdram_wen_n, -- write enable
    sd_ras  => O_sdram_ras_n, -- row address select
    sd_cas  => O_sdram_cas_n, -- columns address select
    -- cpu/chipset interface
    reset_n    => pll_locked,-- init signal after FPGA config to initialize RAM
    ready      => open,
    clk        => clk_sys,       -- sdram is accessed at 28MHz
    refresh    => refresh,
    din        => sdram_din,      -- data input from chipset/cpu
    dout       => ram_dout_i,    -- data output to chipset/cpu
    dout_valid => tap_data_ready,
    addr       => sdram_addr,
    ce         => sdram_cs,
    we         => sdram_wr
  );

  refresh <= '0' when (ioctl_download and (load_prg or load_crt or load_function or load_tap)) = '1' else c16_refresh;
  core_wait <= '1' when ioctl_download = '1' or tap_cycle = '1' else '0';

  sdram_rom_access <= '1' when (cs0 = '0' and ((unsigned(roml) = 1) or (unsigned(roml) = 2))) or
                               (cs1 = '0' and ((unsigned(romh) = 1) or (unsigned(romh) = 2)) and kern = '0') else '0';

  crt_download_access <= '1' when ioctl_download = '1' and load_crt = '1' and
                                  dl_addr(15 downto 14) /= "10" and
                                  dl_addr(15 downto 14) /= "11" else '0';

  function_download_access <= '1' when ioctl_download = '1' and load_function = '1' and
                                       dl_addr(15 downto 14) /= "10" and
                                       dl_addr(15 downto 14) /= "11" else '0';

  tap_wr <= dl_wr and ioctl_download and load_tap;

  sdram_cs <= dl_wr when ioctl_download = '1' and load_prg = '1' else
              dl_wr when crt_download_access = '1' else
              dl_wr when function_download_access = '1' else
              tap_wr when tap_wr = '1' else
              '0' when ioctl_download = '1' else
              tap_rd when tap_rd = '1' else
              sdram_rom_access when sdram_rom_access = '1' else
              not cs_ram;

  sdram_wr <= dl_wr when ioctl_download = '1' and load_prg = '1' else
              dl_wr when crt_download_access = '1' else
              dl_wr when function_download_access = '1' else
              tap_wr when tap_wr = '1' else
              '0' when ioctl_download = '1' else
              '0' when tap_rd = '1' else
              not c16_rnw when sdram_rom_access = '0' else
              '0';

  sdram_addr <= std_logic_vector(tap_play_addr)
                  when tap_rd = '1' else
                std_logic_vector(TAP_ADDR + tap_dl_addr)
                  when tap_wr = '1' else
                7x"00" & dl_addr
                  when ioctl_download = '1' and load_prg = '1' else
                std_logic_vector(CRT_ADDR + resize(unsigned(dl_addr(13 downto 0)), CRT_ADDR'length))
                  when ioctl_download = '1' and load_crt = '1' and
                       dl_addr(15 downto 14) = "00" else
                std_logic_vector(CRT_ADDR + 16#4000# +
                                 resize(unsigned(dl_addr(13 downto 0)), CRT_ADDR'length))
                  when ioctl_download = '1' and load_crt = '1' and
                       dl_addr(15 downto 14) = "01" else
                std_logic_vector(FUNC_ADDR + resize(unsigned(dl_addr(13 downto 0)), FUNC_ADDR'length))
                  when function_download_access = '1' and dl_addr(15 downto 14) = "00" else
                std_logic_vector(FUNC_ADDR + 16#4000# +
                                 resize(unsigned(dl_addr(13 downto 0)), FUNC_ADDR'length))
                  when function_download_access = '1' and dl_addr(15 downto 14) = "01" else

                std_logic_vector(FUNC_ADDR + 16#4000# + resize(unsigned(c16_addr(13 downto 0)), FUNC_ADDR'length))
                  when cs1 = '0' and unsigned(romh) = 2 and kern = '0' else
                std_logic_vector(FUNC_ADDR + resize(unsigned(c16_addr(13 downto 0)), FUNC_ADDR'length))
                  when cs0 = '0' and unsigned(roml) = 2 else

                std_logic_vector(CRT_ADDR + 16#4000# + resize(unsigned(c16_addr(13 downto 0)), CRT_ADDR'length))
                  when cs1 = '0' and unsigned(romh) = 1 and kern = '0' else
                std_logic_vector(CRT_ADDR + resize(unsigned(c16_addr(13 downto 0)), CRT_ADDR'length))
                  when cs0 = '0' and unsigned(roml) = 1 else
                7x"00" & c16_addr;

  sdram_din <= dl_data when ioctl_download = '1' and
                        (load_prg = '1' or load_crt = '1' or
                         load_function = '1' or load_tap = '1') else
               c16_dout;

--------------- TAP -------------------

tap_download <= ioctl_download and load_tap;
tap_reset <= '1' when resetc16 = '1' or
                      tap_download = '1' or
                      tap_finish = '1' or
                      (cass_run = '1'and ((tap_last_addr - tap_play_addr) < to_unsigned(80, tap_last_addr'length)))
                      else '0';
tap_loaded <= '1' when tap_play_addr < tap_last_addr else '0';

process(clk_sys)
begin
  if rising_edge(clk_sys) then
      tap_download_d <= tap_download;

      if tap_reset = '1' then
        if (ioctl_download = '1') and (load_tap = '1') then
            tap_last_addr <= TAP_ADDR + unsigned(ioctl_addr) + 2;
        else
            tap_last_addr <= (others => '0');
        end if;
        tap_play_addr <= TAP_ADDR;
        tap_rd <= '0';
        tap_wrreq <= '0';
        tap_cycle <= '0';
        tap_start <= '0';
      else
        -- C1530 requires one additional byte because its FIFO checks early.
        tap_rd <= '0';
        tap_wrreq <= '0';
        tap_start <= tap_download_d and not tap_download;

        if tap_rd = '0' and tap_wrreq = '0' then
          if tap_cycle = '1' then
            if tap_data_ready = '1' then
              tap_play_addr <= tap_play_addr + 1;
              tap_cycle <= '0';
              tap_wrreq <= '1';
            end if;
          else 
            if tap_wrfull = '0' and tap_loaded = '1' then
              tap_rd <= '1';
              tap_cycle <= '1';
            end if;
          end if;
        end if;
      end if;
  end if;
end process;

c1530_inst: entity work.c1530
port map (
  clk32           => clk_sys,
  restart_tape    => tap_reset,

  wav_mode        => '0',
  tap_version     => tap_version,

  host_tap_in     => ram_dout_i,
  host_tap_wrreq  => tap_wrreq,
  tap_fifo_wrfull => tap_wrfull,
  tap_fifo_error  => tap_finish,

  cass_read       => cass_read,
  cass_write      => cass_write,
  cass_motor      => cass_motor,
  cass_sense      => cass_sense,
  cass_run        => cass_run,
  osd_play_stop_toggle => tap_start,
  ear_input       => '0'
);

end Behavioral_top;
