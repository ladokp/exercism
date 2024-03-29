from io import BufferedRandom


class MeteredFile(BufferedRandom):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._read_bytes = (
            self._read_ops
        ) = self._write_bytes = self._write_ops = 0

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        return super().__exit__(exc_type, exc_val, exc_tb)

    def __iter__(self):
        return self

    def __next__(self):
        data = super().readline()
        self._read_bytes += len(data)
        self._read_ops += 1
        if data:
            return data
        raise StopIteration

    def read(self, size=-1):
        data = super().read(size)
        self._read_bytes += len(data)
        self._read_ops += 1
        return data

    @property
    def read_bytes(self):
        return self._read_bytes

    @property
    def read_ops(self):
        return self._read_ops

    def write(self, b):
        write_length = super().write(b)
        self._write_bytes += write_length
        self._write_ops += 1
        return write_length

    @property
    def write_bytes(self):
        return self._write_bytes

    @property
    def write_ops(self):
        return self._write_ops


class MeteredSocket:
    def __init__(self, socket):
        self.socket = socket
        self._recv_bytes = (
            self._recv_ops
        ) = self._send_bytes = self._send_ops = 0

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        return self.socket.__exit__(exc_type, exc_val, exc_tb)

    def recv(self, buffer_size, flags=0):
        data = self.socket.recv(buffer_size, flags)
        self._recv_bytes += len(data)
        self._recv_ops += 1
        return data

    @property
    def recv_bytes(self):
        return self._recv_bytes

    @property
    def recv_ops(self):
        return self._recv_ops

    def send(self, data, flags=0):
        send_len = self.socket.send(data, flags)
        self._send_bytes += send_len
        self._send_ops += 1
        return send_len

    @property
    def send_bytes(self):
        return self._send_bytes

    @property
    def send_ops(self):
        return self._send_ops
