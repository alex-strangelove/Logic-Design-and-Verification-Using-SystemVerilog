# Logic Design and Verification Using SystemVerilog

This repository contains my solutions and practical implementations while studying "Logic Design and Verification Using SystemVerilog". I'm documenting my learning journey and implementations of the concepts from the book.

## Structure

Each directory corresponds to specific chapters or topics, containing:
- Source code (`.sv` files)
- Testbenches
- Documentation
- Simulation outputs

## SystemVerilog Simulation Script

> Compile -> Run Simulation -> Open Waveform viewer

A bash script for compiling and simulating SystemVerilog files using Icarus Verilog and GTKWave.

### Features
- Automatic compilation of SystemVerilog source and testbench files
- VCD waveform generation and viewing
- Automatic cleanup of generated files
- Error handling and input validation

### Usage

Install dependencies (Ubuntu/WSL):
```bash
./configure
```

Create 2 files:
 - `source_file.sv`
 - `source_file_tb.sv`

and add this to your `initial` block:
```sv
 initial begin
    $dumpfile("source_file_tb.vcd");
    $dumpvars(0,source_file_tb);
    ...
 end
```

Run the script:
```bash
./run_simulation test_bench_example/<source_file>.sv
```

Examples:
```bash
# Compile only
./run_simulation -c <source_file>.sv

# Run simulation only
./run_simulation -s <source_file>.sv

# Compile and simulate
./run_simulation -cs <source_file>.sv

# Open waveform viewer only
./run_simulation -w <source_file>.sv

# Do everything (default behavior)
./run_simulation <source_file>.sv
```

Do everything 
`./run_simulation <source_file>.sv`. Will compile, simulate and open waveform viewer:
![alt text](images/image.png)

## Create Schematics Diagram

> Synthesis done with `yosys`

Create `Yosys` script file with name `source_file_sh.ys`:

```bash
# Read the SystemVerilog file
read_verilog -sv multiplexer_2_1.sv

# Perform synthesis
synth -top multiplexer_2_1

# Write the netlist to a file
write_json multiplexer_2_1.json

# Generate the schematic
#show -format dot -prefix multiplexer_2_1
```

So you have following structure:

![alt text](images/image-1.png)

Synthesize and Generate Schematics: 

```bash
./generate_schematic test_bench_example/multiplexer_2_1_sh.ys
```

Create Diagram:

```bash
./create_diargam test_bench_example/multiplexer_2_1.json
```

This will result in creating a schematic diagram:

![alt text](images/image-2.png)

Cleanup:
> Will remove all generated files inside specified folder

```bash
./cleanup test_bench_example
```