default['openocd']['mirror'] = 'http://downloads.sourceforge.net/project/openocd/openocd/'
default['openocd']['version'] = '0.8.0'

default['openocd']['configure_flags'] = [
  "--prefix=/usr/local",
  "--enable-ftdi",
  "--enable-stlink"
]
