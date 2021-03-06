//===-LTOInternalize.h - LLVM Link Time Optimizer Internalization Utility -===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares a helper class to run the internalization part of LTO.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LTO_LTOINTERNALIZE_H
#define LLVM_LTO_LTOINTERNALIZE_H

#include "llvm/ADT/StringSet.h"
#include "llvm/IR/GlobalValue.h"

namespace llvm {
class Module;
class TargetMachine;

void LTOInternalize(Module &TheModule, const TargetMachine &TM,
                    const StringSet<> &MustPreserveSymbols,
                    const StringSet<> &AsmUndefinedRefs,
                    StringMap<GlobalValue::LinkageTypes> *ExternalSymbols);
}

#endif // LLVM_LTO_LTOINTERNALIZE_H
