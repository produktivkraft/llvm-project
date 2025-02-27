//===-- RISCVInstrInfoXXyz.td - RISC-V 'XXyz' instructions -*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// RISC-V specific DAG Nodes.
//===----------------------------------------------------------------------===//

// TODO

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

let DecoderNamespace = "XXyz",
    hasSideEffects = 1, mayLoad = 1, mayStore = 1 in
class XXyz_nop<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs), (ins), opcodestr, ""> {
  let rd = 0b11111;
  let rs1 = 0b11111;
  let rs2 = 0b11111;
}

let Predicates = [HasVendorXXyz, IsRV64] in {
def NOP : XXyz_nop<0b1111111, 0b111, "xyz.nop">;
} // Predicates = [HasVendorXXyz, IsRV64]

//===----------------------------------------------------------------------===//
// Pseudo-instructions and codegen patterns
//===----------------------------------------------------------------------===//

let Predicates = [HasVendorXXyz, IsRV64] in {
def : Pat<(int_riscv_xyz_nop), (NOP)>;
} // Predicates = [HasVendorXXyz, IsRV64]
