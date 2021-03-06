; RUN: llvm-link %s %S/Inputs/mdlocation.ll -o - -S | FileCheck %s

; Test that DILocations are remapped properly.

define void @foo() !dbg !0 {
  ret void, !dbg !3
}

; CHECK: !named = !{!0, !6, !7, !8, !9, !10, !13, !14, !15, !16}
!named = !{!1, !2, !3, !4, !5}

; CHECK: !0 = !DILocation(line: 3, column: 7, scope: !1)
; CHECK: !3 = distinct !DISubprogram(
; CHECK: !6 = !DILocation(line: 3, column: 7, scope: !1, inlinedAt: !0)
; CHECK: !7 = !DILocation(line: 3, column: 7, scope: !1, inlinedAt: !6)
; CHECK: !8 = distinct !DILocation(line: 3, column: 7, scope: !1)
; CHECK: !9 = distinct !DILocation(line: 3, column: 7, scope: !1, inlinedAt: !8)
; CHECK: !10 = !DILocation(line: 3, column: 7, scope: !11)
; CHECK: !12 = distinct !DISubprogram(
; CHECK: !13 = !DILocation(line: 3, column: 7, scope: !11, inlinedAt: !10)
; CHECK: !14 = !DILocation(line: 3, column: 7, scope: !11, inlinedAt: !13)
; CHECK: !15 = distinct !DILocation(line: 3, column: 7, scope: !11)
; CHECK: !16 = distinct !DILocation(line: 3, column: 7, scope: !11, inlinedAt: !15)
!0 = distinct !DISubprogram(file: !7, scope: !7, line: 1, name: "foo", type: !9)
!1 = !DILocation(line: 3, column: 7, scope: !10)
!2 = !DILocation(line: 3, column: 7, scope: !10, inlinedAt: !1)
!3 = !DILocation(line: 3, column: 7, scope: !10, inlinedAt: !2)
; Test distinct nodes.
!4 = distinct !DILocation(line: 3, column: 7, scope: !10)
!5 = distinct !DILocation(line: 3, column: 7, scope: !10, inlinedAt: !4)

!llvm.dbg.cu = !{!6}
!6 = distinct !DICompileUnit(language: DW_LANG_C89, file: !7, subprograms: !{!0})
!7 = !DIFile(filename: "source.c", directory: "/dir")

!llvm.module.flags = !{!8}
!8 = !{i32 1, !"Debug Info Version", i32 3}
!9 = !DISubroutineType(types: !{})
!10 = distinct !DILexicalBlock(line: 3, column: 3, file: !7, scope: !0)
