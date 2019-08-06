	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta el tama\303\261o del vector y la constante"
	.align 8
.LC2:
	.string	"Time=%11.9f\ty[0]=%d, y[%d]=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L15
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbp), %rdi
	movq	%rax, %rbx
	xorl	%esi, %esi
	movl	$10, %edx
	movl	$33554432, %ebp
	call	strtol@PLT
	cmpl	$33554432, %ebx
	movl	%eax, %r13d
	cmovle	%ebx, %ebp
	testl	%ebx, %ebx
	jle	.L3
	leaq	x(%rip), %r12
	leaq	y(%rip), %rbx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%edx, %ecx
	movl	%edx, (%r12,%rdx,4)
	imull	%edx, %ecx
	movl	%ecx, (%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %ebp
	jg	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%r12,%rdx,4), %ecx
	imull	%r13d, %ecx
	addl	%ecx, (%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %ebp
	jg	.L6
.L7:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leal	-1(%rbp), %ecx
	pxor	%xmm0, %xmm0
	leaq	.LC2(%rip), %rsi
	pxor	%xmm1, %xmm1
	movslq	%ecx, %rdx
	movl	(%rbx,%rdx,4), %r8d
	movl	y(%rip), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L16
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	y(%rip), %rbx
	call	clock_gettime@PLT
	jmp	.L7
.L16:
	call	__stack_chk_fail@PLT
.L15:
	movq	stderr(%rip), %rcx
	leaq	.LC0(%rip), %rdi
	movl	$42, %edx
	movl	$1, %esi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	y,134217728,32
	.comm	x,134217728,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
