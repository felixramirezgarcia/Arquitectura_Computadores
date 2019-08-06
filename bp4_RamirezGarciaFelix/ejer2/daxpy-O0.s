	.file	"daxpy.c"
	.text
	.comm	x,134217728,32
	.comm	y,134217728,32
	.section	.rodata
	.align 8
.LC0:
	.string	"Falta el tama\303\261o del vector y la constante"
	.align 8
.LC2:
	.string	"Time=%11.9f\ty[0]=%d, y[%d]=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -84(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -68(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -60(%rbp)
	cmpl	$33554432, -68(%rbp)
	jle	.L3
	movl	$33554432, -68(%rbp)
.L3:
	movl	$0, -64(%rbp)
	jmp	.L4
.L5:
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	x(%rip), %rax
	movl	-64(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	movl	-64(%rbp), %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	y(%rip), %rax
	movl	%edx, (%rcx,%rax)
	addl	$1, -64(%rbp)
.L4:
	movl	-64(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L5
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -64(%rbp)
	jmp	.L6
.L7:
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	x(%rip), %rax
	movl	(%rdx,%rax), %eax
	imull	-60(%rbp), %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	y(%rip), %rax
	movl	(%rcx,%rax), %eax
	leal	(%rdx,%rax), %ecx
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -64(%rbp)
.L6:
	movl	-64(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L7
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-68(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-68(%rbp), %eax
	leal	-1(%rax), %edi
	movl	y(%rip), %esi
	movq	-56(%rbp), %rax
	movl	%edx, %ecx
	movl	%edi, %edx
	movq	%rax, -104(%rbp)
	movsd	-104(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
