.globl	main
.data 	
    LC0:	.string "lli\n"
    LC1:	.string "lli"	
    LC2:	.string "lli "
    LC3:	.string "\n"
    Input:	.string "Input a number:\n"
    Output:	.string "The damage:\n"
    Num: 	.word 3 	
.text
main:
    addi s2, x0, 1
    addi s3, x0, 10
    addi s4, x0, 20
    addi s5, x0, 1
    addi s6, x0, 5
    addi s8, x0, 0
    add s11, x0, x0 #存最後答案
    la a0, Input
    li a7, 4
    ecall
    li a7, 5
    ecall
    add s1, a0, x0
    mv s10, s1 #x變數
    mv s9, s1
    j function
end:
	add s11, s11, s8
    la a0, Output
    li a7, 4
    ecall
    mv a0, s11
    li a7, 1
    ecall
    li a7, 10
    ecall
function:
    blt s10, x0, lessthan1
    beq s10, x0, equal0
    beq s10, s2, equal1
function1:
    addi sp, sp, -32
    sw ra, 24(sp)  
    sw x8, 16(sp) 
    addi x8, sp, 32
    
    ble s10, s3, lessequal10
    beq s9, s1, minuss9
    ble s10, s4, lessequal20
    bgt s10, s4, greater20
function1_1:
    addi sp, sp, 32
    jalr x0, 0(ra)
equal0:
    addi s11, s11, 1
    j end
equal1:
    addi s11, s11, 5
    j end
lessequal10:
    beq s10, s2, function1_1
    addi s10, s10, -1
    jal ra, function1
    add s5, s5, s6
    add s11, x0, s5
    add s7, s5, x0 #s7為暫存變數
    add s5, s6, x0
    add s6, s7, x0
    lw  ra, 24(sp)
    lw x8, 16(sp)
    addi sp, sp, 32
    addi s9, s9, -1
    beq s9, s2, end
    jalr x0, 0(ra)
lessequal20:
	addi s10, s10, -1
	beq s10, s3, lessequal10
	jal ra, function1
    add s5, s5, s6
    add s11, x0, s5
    add s7, s5, x0 #s7為暫存變數
    add s5, s6, x0
    add s6, s7, x0
    lw  ra, 24(sp)
    lw x8, 16(sp)
    addi sp, sp, 32
    addi s9, s9, -1
    beq s9, s2, end
    jalr x0, 0(ra)
minuss9:
	addi s9, s9, -1
	ble s10, s4, lessequal20
	bgt s10, s4, greater20
greater20:
	slli s7, s1, 1
	add s8, x0, s7
	addi s7, x0, 5
	div s10, s10, s7
	add s9, s10, x0
	bgt s9, s3, minuss9
	j function1
lessthan1:
    la a0, Output
    li a7, 4
    ecall
    addi a0, x0, -1
    li a7, 1
    ecall
    li a7, 10
    ecall
