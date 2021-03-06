;# Copyright (c) 2018 tevador
;#
;# This file is part of RandomX.
;#
;# RandomX is free software: you can redistribute it and/or modify
;# it under the terms of the GNU General Public License as published by
;# the Free Software Foundation, either version 3 of the License, or
;# (at your option) any later version.
;#
;# RandomX is distributed in the hope that it will be useful,
;# but WITHOUT ANY WARRANTY; without even the implied warranty of
;# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;# GNU General Public License for more details.
;#
;# You should have received a copy of the GNU General Public License
;# along with RandomX.  If not, see<http://www.gnu.org/licenses/>.

.intel_syntax noprefix
#if defined(__APPLE__)
.text
#else
.section .text
#endif
#if defined(__WIN32__) || defined(__APPLE__)
#define DECL(x) _##x
#else
#define DECL(x) x
#endif
.global DECL(randomx_program_prologue)
.global DECL(randomx_program_loop_begin)
.global DECL(randomx_program_loop_load)
.global DECL(randomx_program_start)
.global DECL(randomx_program_read_dataset)
.global DECL(randomx_program_read_dataset_light)
.global DECL(randomx_program_loop_store)
.global DECL(randomx_program_loop_end)
.global DECL(randomx_program_read_dataset_light_sub)
.global DECL(randomx_program_epilogue)
.global DECL(randomx_program_end)

#define db .byte

.balign 64
DECL(randomx_program_prologue):
	#include "asm/program_prologue_linux.inc"

.balign 64
	#include "asm/program_xmm_constants.inc"

.balign 64
DECL(randomx_program_loop_begin):
	nop

DECL(randomx_program_loop_load):
	#include "asm/program_loop_load.inc"

DECL(randomx_program_start):
	nop

DECL(randomx_program_read_dataset):
	#include "asm/program_read_dataset.inc"

DECL(randomx_program_read_dataset_light):
	#include "asm/program_read_dataset_light.inc"

DECL(randomx_program_loop_store):
	#include "asm/program_loop_store.inc"

DECL(randomx_program_loop_end):
	nop

.balign 64
DECL(randomx_program_read_dataset_light_sub):
	#include "asm/program_read_dataset_light_sub.inc"
squareHashSub:
	#include "asm/squareHash.inc"

.balign 64
DECL(randomx_program_epilogue):
	#include "asm/program_epilogue_linux.inc"

.balign 64
DECL(randomx_program_end):
	nop
