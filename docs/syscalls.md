# Syscalls

Because `quisc` runs in user space and implements QUIC on top of UDP, it must
use [system calls](https://en.wikipedia.org/wiki/System_call) (_syscalls_) to
interact with the kernel. Syscalls allow an unprivileged program to request that
the kernel perform some privileged action on its behalf. Most user space
programs that perform any operations of consequence invoke some number of
syscalls. Because `quisc` is implementing a network protocol, the kernel acts as
a messenger between it and the networking hardware on the machine.

The following sections contain information about common syscalls that `quisc`
utilizes, as well as information about how they are invoked.

## Networking

- [`socket`](https://man7.org/linux/man-pages/man2/socket.2.html): creates an endpoint for communication and returns a file descriptor that refers to that endpoint.
    - Number: [`198`](https://github.com/torvalds/linux/blob/a19944809fe9942e6a96292490717904d0690c21/include/uapi/asm-generic/unistd.h#L588)
    - Arguments:
        - `a0`: _domain_ (`int`)
        - `a1`: _type_ (`int`)
        - `a2`: _protocol_ (`int`)
        - `a7`: `198`
- [`bind`](https://man7.org/linux/man-pages/man2/bind.2.html): assigns an address to a socket file descriptor.
    - Number: [`200`](https://github.com/torvalds/linux/blob/a19944809fe9942e6a96292490717904d0690c21/include/uapi/asm-generic/unistd.h#L592)
    - Arguments:
        - `a0`: _sockfd_ (`int`)
        - `a1`: _*addr_ (`const struct sockaddr`)
        - `a2`: _addrlen_ (`socklen_t`)
        - `a7`: `200`
- [`listen`](https://man7.org/linux/man-pages/man2/listen.2.html): marks a socket as passive (i.e. willing to `accept` connections).
    - Number: [`201`](https://github.com/torvalds/linux/blob/a19944809fe9942e6a96292490717904d0690c21/include/uapi/asm-generic/unistd.h#L594)
    - Arguments:
        - `a0`: _sockfd_ (`int`)
        - `a1`: _backlog_ (`int`)
        - `a7`: `201`