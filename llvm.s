	.text
	.file	"llvm.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	0x3ff8000000000000              # double 1.5
.LCPI0_1:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movsd	%xmm0, -80(%rbp)
	movsd	-80(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -72(%rbp)
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -64(%rbp)
	movsd	-72(%rbp), %xmm0                # xmm0 = mem[0],zero
	mulsd	-64(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-56(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -8(%rbp)
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -48(%rbp)
	movsd	-48(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -40(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	%xmm0, -32(%rbp)
	movsd	-40(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function func1
.LCPI1_0:
	.quad	0x4022000000000000              # double 9
.LCPI1_1:
	.quad	0x4008000000000000              # double 3
.LCPI1_2:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	func1
	.p2align	4, 0x90
	.type	func1,@function
func1:                                  # @func1
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rax
	movsd	%xmm0, -128(%rbp)
	movsd	.LCPI1_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -120(%rbp)
	movsd	-128(%rbp), %xmm0               # xmm0 = mem[0],zero
	movsd	%xmm0, -112(%rbp)
	movsd	.LCPI1_2(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -104(%rbp)
	movsd	-112(%rbp), %xmm0               # xmm0 = mem[0],zero
	addsd	-104(%rbp), %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	-120(%rbp), %xmm0               # xmm0 = mem[0],zero
	mulsd	-96(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	-88(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -80(%rbp)
	movsd	.LCPI1_1(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -72(%rbp)
	movsd	-80(%rbp), %xmm0                # xmm0 = mem[0],zero
	divsd	-72(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -56(%rbp)
	movsd	-64(%rbp), %xmm0                # xmm0 = mem[0],zero
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-48(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -8(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -40(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	%xmm0, -32(%rbp)
	movsd	-40(%rbp), %xmm0                # xmm0 = mem[0],zero
	mulsd	-32(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -136(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	addq	$8, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	func1, .Lfunc_end1-func1
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movabsq	$.L.str, %rdi
	leaq	-40(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movsd	-40(%rbp), %xmm0                # xmm0 = mem[0],zero
	callq	func0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	callq	func1
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%lf\n"
	.size	.L.str.1, 5

	.section	".note.GNU-stack","",@progbits
