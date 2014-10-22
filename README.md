# stm32F429

This project is targeted at the development of various code examples for STM's
STM32F429 Discovery Board while automating the setup process of a development
environment with VirtualBox and Vagrant.

![stm32F429](doc/img/stm32f429iDISC.png)

## Requirements

* [VirtualBox 4.2](https://www.virtualbox.org)
* [VirtualBox Extension Pack](http://download.virtualbox.org/virtualbox/)
* [Vagrant 1.2](http://vagrantup.com)

## Toolchain on the Virtual Development Machine

* gcc-arm-none-eabi
* git
* libftdi-dev
* libusb-1.0-0-dev
* openocd 0.8.0
* vim

## Bootstrapping the Virtual Development Machine

```
git clone https://github.com/h5b/stm32F429.git
cd stm32F429
git submodule init
git submodule update
vagrant up
```

This sets up a virtual development machine host __stm32-dev__ based on Ubuntu
12.04. with the latest GCC ARM Embedded Toolchain and OpenOCD already being
installed. The setup takes a couple of minutes. After the installation has
finished you can login to the machine by running: `vagrant ssh`
