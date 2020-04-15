import random

def bin_sum(bin_msg_li, lenght):
    chk = bin(0)
    for m in bin_msg_li:
        chk = bin(int(chk, 2) + int(m, 2))

    try:
        overflow_bit = (str(chk)[2:])[-(lenght+1)]
        print(overflow_bit)
        chk = bin(int(str(chk)[3:], 2))
        chk = bin(int(chk, 2) + int(overflow_bit, 2))
    except IndexError:
        pass

    chk = str(chk)[2:]
    chk = chk.zfill(lenght)

    chk = list(map(int, chk))
    complement = list(map(lambda x: abs(1-x), chk))
    complement = ''.join(map(str, complement))

    return complement


def sender(msg_li):
    fill = max([len(i) for i in msg_li])
    bin_msg_li = [bin(int(i, 2)) for i in msg_li]

    checksum = bin_sum(bin_msg_li, fill)

    send = []
    msg_li.append(checksum)
    msg_li = [list(i.zfill(fill)) for i in msg_li]
    for m in msg_li:
        send.append(''.join(list(map(str, m))))
    
    return send


def transmission(msg_li):
    send = []
    for msg in msg_li[:-1]:
        li = list(map(int, list(msg)))
        if random.randint(0, 1):
            error_pos = random.randint(0, len(msg)-1)
            li[error_pos] = 1 - li[error_pos]
        send.append(''.join(list(map(str, li))))
    
    send.append(msg_li[-1])
    print(send)

    return send


def receiver(msg_li):
    fill = max([len(i) for i in msg_li])
    bin_msg_li = [bin(int(i, 2)) for i in msg_li]

    checksum = bin_sum(bin_msg_li, fill)
    checksum = checksum.zfill(fill)

    print(checksum)

    if checksum == '0'*fill:
        return True, msg_li[:-1]
    else:
        return False, msg_li[:-1]


    
data = list(map(str, input('Enter space seperated data to send: ').split()))
msg_send = sender(data)
sent = transmission(msg_send)
p, msg_received = receiver(sent)

if p:
    print('The transmission was ERROR-FREE!\nThe data received is: ' + str(msg_received))
else:
    print('There was an ERROR in the data received!\nThe data received is: ' + str(msg_received))

# print(bin_sum(['1011', '0101'], 4))