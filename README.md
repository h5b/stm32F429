# stm32F429

This project is targeted at the development of various examples for STM's
STM32F429 Discovery Board while automating the setup process of a development
environment with VirtualBox and Vagrant.

## The Board

* Cortmex-M4
* 3-Axis Sensor
* 2.4" QVGA TFT

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [VirtualBox Extension Pack](http://download.virtualbox.org/virtualbox/)
* [Vagrant](http://vagrantup.com)

## Toolchain installed on the Virtual Development Machine

* git
* vim
* gcc-arm-none-eabi
* libftdi-dev
* libusb-1.0-0-dev
* openocd 0.7.0

## Bootstrapping the Virtual Development Machine

```
git clone git@github.com:h5b/stm32F429.git
cd stm32F429
git submodule init
git submodule update
vagrant up
```

The setup takes a couple of minutes. After the installation has finished you
can login to the machine by running:

`vagrant ssh`
