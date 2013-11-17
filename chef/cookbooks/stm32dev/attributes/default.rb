default['openocd']['mirror'] = 'http://downloads.sourceforge.net/project/openocd/openocd/'
default['openocd']['version'] = '0.7.0'

default['openocd']['configure_flags'] = [
  "--prefix=/usr/local",
  "--enable-ft2232_libftdi",
  "--enable-ftdi",
  "--enable-stlink"
]
