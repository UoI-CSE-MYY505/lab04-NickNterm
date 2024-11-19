
.globl str_ge, recCheck

.data

maria:    .string "Maria"
markos:   .string "Markos"
marios:   .string "Marios"
marianna: .string "Marianna"

.align 4  # make sure the string arrays are aligned to words (easier to see in ripes memory view)

# These are string arrays
# The labels below are replaced by the respective addresses
arraySorted:    .word maria, marianna, marios, markos

arrayNotSorted: .word marianna, markos, maria

.text

            la   a0, maria
            la   a1, markos
            jal str_ge
                        
            #la   a0, arrayNotSorted
            #li   a1, 4
            #jal  recCheck

            li   a7, 10
            ecall

str_ge:
#---------
# Write the subroutine code here
#  You may move jr ra   if you wish.
#---------
    add s0, a0, zero
    add s1, a1, zero
loop:
    lb t0, 0(s0)
    lb t1, 0(s1)
    beq t0, zero, exitLoop
    beq t1, zero, exitLoop
    blt t0, t1, greaterThan
    addi s0, s0, 1
    addi s1, s1, 1
    j loop

greaterThan:
    addi a0, zero, 1
    jr   ra

exitLoop:
    add a0, zero, zero 
    jr   ra
 
# ----------------------------------------------------------------------------
# recCheck(array, size)
# if size == 0 or size == 1
#     return 1
# if str_ge(array[1], array[0])      # if first two items in ascending order,
#     return recCheck(&(array[1]), size-1)  # check from 2nd element onwards
# else
#     return 0

recCheck:
#---------
# Write the subroutine code here
#  You may move jr ra   if you wish.
#---------
            jr   ra
