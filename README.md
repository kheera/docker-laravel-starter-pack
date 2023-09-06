<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel
## Hyper-V vs WSL
WSL (Windows Subsystem for Linux) is a lightweight compatibility layer for running Linux environments natively on Windows. It's integrated with Windows, sharing files and even running Windows executables from the Linux environment, ideal for developers who need to use Linux tools on a Windows machine.

Hyper-V is a powerful native hypervisor that creates full-featured virtual machines running a variety of operating systems. It's a more resource-intensive option, providing complete isolation between the host and virtual machines, suitable for testing new software or creating server environments.

In essence, WSL is ideal for running Linux tools on Windows with less overhead and more integration, while Hyper-V is a more versatile, full-fledged virtualization solution capable of running various operating systems.

## WSL IS SLOW

In the Windows Subsystem for Linux (WSL), file operations can be slower when working with files stored on the Windows file system. This is due to the overhead of translating file system operations between the Linux and Windows file systems.

Files stored and accessed in wsl will look like this: `\\wsl.localhost\Ubuntu-22.04\home\shane`.

If you can't use Hyper-V then you'll need to move all shared files into wsl locations are things will be very slow and annoying.

This includes installing nodejs from within the wsl world.

https://learn.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl

## Installation steps: 
1. Clone repo
1. cp .env.example .env
1. Set project name in .env
1. docker-compose up
1. For development, run npm run watch from the host machine.

## This repo configures the following:
* Ubuntu 22.04,
* Apache 2 and
* Laravel 8.
* Also includes
* vue w/ Laravel
