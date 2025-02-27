###############################################################################

mlir-translate --mlir-to-llvmir xyz_tests/add.mlir |
  llc -O0 --mattr=+xxyz -march=riscv64 -mcpu=generic-rv64

###############################################################################

mlir-translate --mlir-to-llvmir xyz_tests/add.mlir -o xyz_tests/add.ll

###############################################################################

args=(
  --mattr=+xxyz
  -march=riscv64
  -mcpu=generic-rv64
  -O0
  -o xyz_tests/add.s
  xyz_tests/add.ll
)
llc "${args[@]}"

###############################################################################

args=(
  --mattr=+xxyz
  -arch=riscv64
  -mcpu=generic-rv64
  --filetype=obj
  --assemble
  xyz_tests/add.s
  -o xyz_tests/add.o
)
llvm-mc "${args[@]}"

###############################################################################

args=(
  --Map xyz_tests/add.map
  -o xyz_tests/add
  xyz_tests/add.o
)
ld.lld "${args[@]}"

###############################################################################

args=(
  -d
  xyz_tests/add
)
llvm-objdump "${args[@]}" >xyz_tests/add.dasm

###############################################################################
