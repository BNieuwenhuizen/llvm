//===-- AArch64GISelAccessor.h - AArch64 GISel Accessor ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
/// This file declares the API to access the various APIs related
/// to GlobalISel.
//
//===----------------------------------------------------------------------===/

#ifndef LLVM_LIB_TARGET_AARCH64_AARCH64GISELACCESSOR_H
#define LLVM_LIB_TARGET_AARCH64_AARCH64GISELACCESSOR_H

namespace llvm {
class CallLowering;
class RegisterBankInfo;

/// The goal of this helper class is to gather the accessor to all
/// the APIs related to GlobalISel.
/// It should be derived to feature an actual accessor to the GISel APIs.
/// The reason why this is not simply done into the subtarget is to avoid
/// spreading ifdefs around.
struct AArch64GISelAccessor {
  virtual ~AArch64GISelAccessor() {}
  virtual const CallLowering *getCallLowering() const { return nullptr;}
  virtual const RegisterBankInfo *getRegBankInfo() const { return nullptr;}
};
} // End namespace llvm;
#endif
