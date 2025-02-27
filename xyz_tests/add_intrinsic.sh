###############################################################################

args=(
  --mattr=+xxyz
  -march=riscv64
  -mcpu=generic-rv64
  -O0
  -o xyz_tests/add_intrinsic.s
  xyz_tests/add_intrinsic.ll
)
llc "${args[@]}"

###############################################################################

args=(
  -march=rv64i_xxyz
  -mabi=lp64
  -mcpu=generic-rv64
  --target=riscv64-unknown-elf
  #
  -O0
  -S
  # -v
  #
  -o xyz_tests/add_intrinsic_c.s
  xyz_tests/add_intrinsic_c.c
)
clang "${args[@]}"

###############################################################################
