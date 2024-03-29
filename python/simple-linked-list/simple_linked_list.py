class Node:
    def __init__(self, value, next_=None):
        self._value = value
        self._next = next_

    def value(self):
        return self._value

    def next(self):
        return self._next


class LinkedList:
    def __init__(self, values=None):
        if values is None:
            values = []
        self._head = None
        self._count = 0
        for v in values:
            self.push(v)

    def __len__(self):
        return self._count

    def head(self):
        if self._head is None:
            raise EmptyListException()
        return self._head

    def push(self, value):
        self._head = Node(value, self._head)
        self._count += 1

    def pop(self):
        if self._head is None:
            raise EmptyListException()
        value = self._head.value()
        self._head = self._head.next()
        self._count -= 1
        return value

    def reversed(self):
        return LinkedList(self)

    def __iter__(self):
        node = self._head
        while node is not None:
            yield node.value()
            node = node.next()


class EmptyListException(Exception):
    def __init__(self, message="The list is empty."):
        super().__init__(message)
