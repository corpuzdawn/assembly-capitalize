.model tiny
.data
    message db "Hello World $"
.code
    main proc
    
    increment:
        mov dl, [message+di]
        inc di
        cmp dl, 24h
        je stop
        cmp dl, 97
        jge upperbound
        jmp print
    
    print:
        mov ah, 2
        int 21h
        jmp increment
    
    upperbound:
        cmp dl, 122
        jle capital
        jmp print
        
    capital:
        sub dl, 32
        jmp print
    
    stop:
        mov ah, 4Ch
        int 21h
        
main endp
end