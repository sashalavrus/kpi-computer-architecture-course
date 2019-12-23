`timescale 1ns/1ps

`define REG_WIDTH 32
`define INSTR_ADDR_WIDTH 32
`define NUM_OF_INSTRUCTIONS 128

//code part take from Aleksandr Shlihta

module instruction_memory(addr, instruction);

input [`INSTR_ADDR_WIDTH-1:0] addr;

output [`REG_WIDTH-1:0] instruction;

reg [`REG_WIDTH-1:0] instruction_mem [`NUM_OF_INSTRUCTIONS-1:0];

assign instruction = instruction_mem[addr];

initial $readmemb("/home/drcah4ec/lab7_gpio/mips_core/instruction.instr", instruction_mem);

endmodule
