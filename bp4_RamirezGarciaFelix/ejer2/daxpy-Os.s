	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta el tama\303\261o del vector y la constante"
.LC2:
	.string	"Time=%11.9f\ty[0]=%d, y[%d]=%d\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L2
	movq	stderr(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	call	fputs@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	call	atoi@PLT
	movq	16(%rbp), %rdi
	movl	%eax, %ebx
	leaq	y(%rip), %rbp
	call	atoi@PLT
	cmpl	$33554432, %ebx
	movl	$33554432, %ecx
	leaq	x(%rip), %rdx
	movl	%eax, %r12d
	cmovg	%ecx, %ebx
	xorl	%eax, %eax
.L3:
	cmpl	%ebx, %eax
	jge	.L10
	movl	%eax, %ecx
	movl	%eax, (%rdx,%rax,4)
	imull	%eax, %ecx
	movl	%ecx, 0(%rbp,%rax,4)
	incq	%rax
	jmp	.L3
.L10:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	x(%rip), %rdx
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %ebx
	jle	.L11
	movl	(%rdx,%rax,4), %ecx
	imull	%r12d, %ecx
	addl	%ecx, 0(%rbp,%rax,4)
	incq	%rax
	jmp	.L5
.L11:
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	leal	-1(%rbx), %ecx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movslq	%ecx, %rdx
	movl	0(%rbp,%rdx,4), %r8d
	movl	y(%rip), %edx
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdx
	xorq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
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
