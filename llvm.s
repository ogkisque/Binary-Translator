	.text
	.file	"llvm.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	main
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
	subq	$32, %rsp
	movabsq	$.L.str, %rdi
	leaq	-8(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rbp)
.LBB0_1:                                # %while0
                                        # =>This Inner Loop Header: Depth=1
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rax)
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	%xmm0, (%rax)
	movsd	(%rcx), %xmm0                   # xmm0 = mem[0],zero
	ucomisd	(%rax), %xmm0
	jbe	.LBB0_3
# %bb.2:                                # %body_while0
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rax)
	movq	%rsp, %rcx
	movq	%rcx, %rdx
	addq	$-16, %rdx
	movq	%rdx, %rsp
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rcx)
	movsd	-16(%rax), %xmm0                # xmm0 = mem[0],zero
	movsd	-16(%rcx), %xmm1                # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movsd	%xmm0, -16(%rax)
	movsd	-16(%rax), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	%xmm0, -16(%rax)
	movq	%rsp, %rcx
	movq	%rcx, %rdx
	addq	$-16, %rdx
	movq	%rdx, %rsp
	movabsq	$4607182418800017408, %rdx      # imm = 0x3FF0000000000000
	movq	%rdx, -16(%rcx)
	movsd	-16(%rax), %xmm0                # xmm0 = mem[0],zero
	movsd	-16(%rcx), %xmm1                # xmm1 = mem[0],zero
	subsd	%xmm1, %xmm0
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	movsd	%xmm0, (%rax)
	movsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
	movsd	%xmm0, -8(%rbp)
	jmp	.LBB0_1
.LBB0_3:                                # %end_while0
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movabsq	$.L.str.1, %rdi
	movb	$1, %al
	callq	printf@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
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
