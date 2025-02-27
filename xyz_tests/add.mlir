// mlir-translate --mlir-to-llvmir xyz_tests/add.mlir |
//   llc -O0 --mattr=+xxyz -march=riscv64 -mcpu=generic-rv64

module {
  llvm.mlir.global internal @g_42(42 : i32) : i32

  llvm.func @main() {
    %addr = llvm.mlir.addressof @g_42 : !llvm.ptr
    %i42 = llvm.load %addr : !llvm.ptr -> i32
    %c_1 = llvm.mlir.constant(1 : i32) : i32

    // inline_asm
    llvm.inline_asm "xyz.nop", "" : () -> ()

    // call_intrinsic
    llvm.call_intrinsic "llvm.riscv.xyz.nop" () : () -> () {}

    %res = llvm.add %i42, %c_1 : i32
    llvm.store %res, %addr : i32, !llvm.ptr
    llvm.return
  }
}
