/*===---- riscv_xyz.h - RISC-V Xyz intrinsics ---------------------------===
 *
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 *===------------------------------------------------------------------------===
 */

#ifndef __RISCV_XYZ_H
#define __RISCV_XYZ_H

#if defined(__cplusplus)
extern "C" {
#endif

#define __riscv_xyz_nop() __builtin_riscv_xyz_nop();

#if defined(__cplusplus)
}
#endif

#endif
