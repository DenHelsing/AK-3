.global lab1
.syntax unified
#define P0_DATA #10
#define P1_DATA #8
#define P2_DATA #5

//(a&b)>> + c!

lab1:
    push {lr}

    mov r0, P0_DATA
    mov r1, P1_DATA
    mov r2, P2_DATA

    bl calculate
    pop {pc}

calculate:
    push { r3, lr }
    mov r3, r2 // save R2(c)

    and r0, r1 // R0(a) and R1(b)
    
    lsr r0, 1  // shifting result

    bl factorial

    add r0, r3
    pop { r3, pc }

factorial:
    subs r2, #1
    .fact_calc:
        mul r3, r2
        subs r2, #1
        bne .fact_calc
    mov r2, r3
    bx lr
