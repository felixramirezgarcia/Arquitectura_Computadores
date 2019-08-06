	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Falta el tama\303\261o del vector y la constante"
	.align 8
.LC4:
	.string	"Time=%11.9f\ty[0]=%d, y[%d]=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L23
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movq	%rax, %r14
	xorl	%esi, %esi
	movl	$10, %edx
	movl	$33554432, %ebx
	call	strtol@PLT
	cmpl	$33554432, %r14d
	movq	%rax, %r13
	movl	%eax, 12(%rsp)
	cmovle	%r14d, %ebx
	testl	%r14d, %r14d
	jle	.L3
	cmpl	$3, %r14d
	jle	.L15
	movl	%ebx, %ecx
	movdqa	.LC0(%rip), %xmm1
	leaq	x(%rip), %r12
	leaq	y(%rip), %rbp
	shrl	$2, %ecx
	movdqa	.LC2(%rip), %xmm3
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	%xmm1, %xmm2
	movdqa	%xmm1, %xmm0
	addl	$1, %edx
	pmuludq	%xmm1, %xmm2
	psrlq	$32, %xmm0
	pshufd	$8, %xmm2, %xmm2
	pmuludq	%xmm0, %xmm0
	pshufd	$8, %xmm0, %xmm0
	movaps	%xmm1, (%r12,%rax)
	paddd	%xmm3, %xmm1
	punpckldq	%xmm0, %xmm2
	movaps	%xmm2, 0(%rbp,%rax)
	addq	$16, %rax
	cmpl	%edx, %ecx
	ja	.L5
	movl	%ebx, %eax
	andl	$-4, %eax
	cmpl	%eax, %ebx
	je	.L24
.L4:
	movl	%eax, %ecx
	movslq	%eax, %rdx
	imull	%eax, %ecx
	movl	%eax, (%r12,%rdx,4)
	movl	%ecx, 0(%rbp,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %ebx
	jle	.L7
	movslq	%edx, %rcx
	addl	$2, %eax
	movl	%edx, (%r12,%rcx,4)
	imull	%edx, %edx
	cmpl	%eax, %ebx
	movl	%edx, 0(%rbp,%rcx,4)
	jle	.L7
	movslq	%eax, %rdx
	movl	%eax, (%r12,%rdx,4)
	imull	%eax, %eax
	movl	%eax, 0(%rbp,%rdx,4)
.L7:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	cmpl	$3, %r14d
	jle	.L16
.L13:
	movd	12(%rsp), %xmm4
	movl	%ebx, %ecx
	leaq	x(%rip), %rdx
	leaq	y(%rip), %rax
	shrl	$2, %ecx
	xorl	%esi, %esi
	pshufd	$0, %xmm4, %xmm2
	movdqa	%xmm2, %xmm3
	psrlq	$32, %xmm3
	.p2align 4,,10
	.p2align 3
.L9:
	movdqa	(%rdx), %xmm1
	addl	$1, %esi
	movdqa	%xmm2, %xmm0
	addq	$16, %rdx
	psrlq	$32, %xmm1
	pmuludq	%xmm3, %xmm1
	pshufd	$8, %xmm1, %xmm1
	pmuludq	-16(%rdx), %xmm0
	pshufd	$8, %xmm0, %xmm0
	addq	$16, %rax
	punpckldq	%xmm1, %xmm0
	paddd	-16(%rax), %xmm0
	movaps	%xmm0, -16(%rax)
	cmpl	%ecx, %esi
	jb	.L9
	movl	%ebx, %eax
	andl	$-4, %eax
	cmpl	%ebx, %eax
	je	.L12
.L11:
	movslq	%eax, %rdx
	movl	(%r12,%rdx,4), %ecx
	imull	%r13d, %ecx
	addl	%ecx, 0(%rbp,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%ebx, %edx
	jge	.L12
	movslq	%edx, %rdx
	addl	$2, %eax
	movl	(%r12,%rdx,4), %ecx
	imull	%r13d, %ecx
	addl	%ecx, 0(%rbp,%rdx,4)
	cmpl	%ebx, %eax
	jge	.L12
	cltq
	imull	(%r12,%rax,4), %r13d
	addl	%r13d, 0(%rbp,%rax,4)
.L12:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	24(%rsp), %rax
	pxor	%xmm1, %xmm1
	leal	-1(%rbx), %ecx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movslq	%ecx, %rdx
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	0(%rbp,%rdx,4), %r8d
	movl	y(%rip), %edx
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L25
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L13
.L3:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	leaq	y(%rip), %rbp
	call	clock_gettime@PLT
	jmp	.L12
.L15:
	xorl	%eax, %eax
	leaq	x(%rip), %r12
	leaq	y(%rip), %rbp
	jmp	.L4
.L16:
	xorl	%eax, %eax
	jmp	.L11
.L25:
	call	__stack_chk_fail@PLT
.L23:
	movq	stderr(%rip), %rcx
	leaq	.LC1(%rip), %rdi
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
