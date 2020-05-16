SYS_READ equ 0
SYS_WRITE equ 1
SYS_OPEN equ 2
SYS_EXIT equ 60
AMOUNT_TO_READ equ 16

global _start

section .text

_start:

  jmp get_file_path

  continue:



  ; syscall to open the file

  mov eax, SYS_OPEN

  pop rdi ; pop address of string to rdi

  mov rsi, 0 ; set O_RDONLY flag

  syscall



  ; syscall to read file

  sub sp, 0xff

  lea rsi, [rsp]



  ; syscall to write file contents to stdout

  mov rdi, rax ; use the returned fd

  mov rdx, AMOUNT_TO_READ; amount to read

  mov rax, SYS_READ

  syscall



  ; syscall write to stdout

  mov rdi,1 ; set stdout fd = 1

  mov rdx, rax ; write to stdout the amount of bytes read

  mov rax, SYS_WRITE

  syscall

  mov rax, SYS_EXIT
  
  xor rdi, rdi ; set return arg to 0

  syscall ; finish execution

; jump here in order to get the address of the string

get_file_path:

call continue

file_path: db "/my_file", 0
