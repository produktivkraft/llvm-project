; RUN: not llc -mtriple=mips < %s 2>&1 | FileCheck %s

declare ptr @llvm.frameaddress(i32) nounwind readnone

define ptr @f() nounwind {
entry:
  %0 = call ptr @llvm.frameaddress(i32 1)
  ret ptr %0

; CHECK: error: return address can be determined only for current frame
}
