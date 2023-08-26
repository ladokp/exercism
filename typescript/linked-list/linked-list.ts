export class LinkedList<TElement> {
  first: Node<TElement>;
  last: Node<TElement>;
  
  constructor() {
    this.first = this.last = new Node<TElement>();
  }
  
  public push(element: TElement) {
    if (this.last.value === undefined) {
      this.last.value = element;
    } else {
      let newNode = new Node<TElement>();
      newNode.next = undefined;
      newNode.prev = this.last;
      newNode.value = element;
      this.last.next = newNode;
      this.last = newNode;
    }
  }
  
  public pop(): TElement | undefined {
    let newLast = this.last.prev;
    let value = this.last.value;
    if (newLast !== undefined) {
      newLast.next = undefined;
      this.last = newLast
    } else {
      this.last.value = undefined
    }
    return value;
  }
  
  public shift(): TElement | undefined {
    let newFirst = this.first.next;
    let value = this.first.value
    if (newFirst !== undefined) {
      newFirst.prev = undefined;
      this.first = newFirst;
    } else {
      this.first.value = undefined
    }
    return value;
  }
  
  public unshift(element: TElement) {
    if (this.first.value === undefined) {
      this.first.value = element;
    } else {
      let newNode = new Node<TElement>();
      newNode.prev = undefined;
      newNode.next = this.first;
      newNode.value = element;
      this.first.prev = newNode;
      this.first = newNode;
    }
  }
  
  public delete(element: unknown) {
    if (this.first.value === element && this.last.value === element) {
      this.first.value = undefined; 
      this.last.value = undefined;
      return
    }
    
    function deleteNode(node: Node<TElement>) {
      if (node.prev !== undefined) node.prev.next = node.next;
      if (node.next !== undefined) node.next.prev = node.prev;
    }
    
    function iterate(node: Node<TElement>) {
      if (node.value === element) {
        deleteNode(node);
      }
      if (node.next === undefined) {        
        return
      } else {
        iterate(node.next)
      }
    }
    iterate(this.first)
  }
  
  public count(): number {
    if (this.first.value === undefined) return 0;
    
    function count(counter: number, node: Node<TElement>): number {
      if (node.next === undefined) {
        return counter;
      } else {
        return count(counter + 1, node.next)
      }
    }
    
    return count(1, this.first)    
  }
}

class Node<TElement> {
  public prev: Node<TElement> | undefined;
  public next: Node<TElement> | undefined;
  public value: TElement | undefined;
}