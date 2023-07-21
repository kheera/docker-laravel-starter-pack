# A Docker Laravel starter pack

This makes it super easy to get started on a new project.

Requirements:
* Everything needed to run docker. Tested with docker toolbox and virtualbox. https://docs.docker.com/toolbox/


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

Installation steps: 
1. Clone repo
1. cp .env.example .env
1. Set project name in .env
1. docker-compose up
1. For development, run npm run watch from the host machine.

Sets up:
* Ubuntu 22.04,
* Apache 2 and
* Laravel 8.
* Also includes
* vue w/ Laravel
