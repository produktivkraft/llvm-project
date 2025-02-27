int main() {
  int ret = 42;

  __builtin_riscv_xyz_nop();

  return ret;
}
