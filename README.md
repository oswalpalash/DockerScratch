# DockerScratch
An attempt to write a Docker Container without a parent image (i.e FROM scratch)

A Binary is created using the `file.asm` assembly construct for x86_64.
The binary is instructed to read the file `/my_file` on the host and print the contents to STDOUT.

A Docker container is created FROM scratch and the binary is added to the host.
A file is seeded as `/my_file` on the container image. 

When the container is run, the binary is used as command based entry point. Expected output is the content in `/my_file` file.


## Local Development
Dependencies - nasm, docker

To build the assembly, run `nasm -f elf64 file.asm`

Once built, you can create an executable with `ld -o file file.o`

The binary `file` requires a file `/my_file` in the environment to run.
You can copy the file from the repo `cp -v my_file /my_file`.
