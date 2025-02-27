; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@g_42 = internal global i32 42

declare void @llvm.riscv.xyz.nop()
; declare void @llvm.riscv.xyz.nop() nounwind

define void @main() {
  %1 = load i32, ptr @g_42, align 4

  call void @llvm.riscv.xyz.nop()

  %3 = add i32 %1, 1
  store i32 %3, ptr @g_42, align 4
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
