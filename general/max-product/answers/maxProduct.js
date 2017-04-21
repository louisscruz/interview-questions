// This solution is O(n log(n))

class Heap {
  constructor() {
    this.store = [];
  }

  push(val) {
    this.store.push(val);
    this.bubbleUp(this.store.length - 1, val);
  }

  pop() {
    const head = this.store[0];
    const tail = this.store.pop();
    this.store[0] = tail;
    this.bubbleDown(0, tail);
    return head;
  }

  empty() {
    return this.store.length === 0;
  }

  bubbleUp(i, val) {
    if (i > 0) {
      const parentIdx = this.getParentIdx(i);
      const parentVal = this.store[parentIdx];

      if (this.shouldSwap(parentVal, val)) {
        this.store[parentIdx] = val;
        this.store[i] = parentVal;
        this.bubbleUp(parentIdx, val);
      }
    }
  }

  bubbleDown(i, val) {
    if (i < this.store.length) {
      let targetIdx = i;
      let targetVal = val;

      const leftIdx = this.getLeftIdx(i);
      const rightIdx = this.getRightIdx(i);

      if (leftIdx < this.store.length) {
        const leftVal = this.store[leftIdx];
        if (this.shouldSwap(targetVal, leftVal)) {
          targetIdx = leftIdx;
          targetVal = leftVal;
        }
      }

      if (rightIdx < this.store.length) {
        const rightVal = this.store[rightIdx];
        if (this.shouldSwap(targetVal, rightVal)) {
          targetIdx = rightIdx;
          targetVal = rightVal;
        }
      }

      if (targetIdx !== i) {
        this.store[targetIdx] = val;
        this.store[i] = targetVal;
        this.bubbleDown(targetIdx, val);
      }
    }
  }

  getParentIdx(i) {
    return Math.floor(i / 2);
  }

  getLeftIdx(i) {
    return i * 2 + 1;
  }

  getRightIdx(i) {
    return i * 2 + 2;
  }
}

class MinHeap extends Heap {
  shouldSwap(parent, child) {
    return parent > child;
  }
}

class MaxHeap extends Heap {
  shouldSwap(parent, child) {
    return parent < child;
  }
}

const maxProduct = (arr) => {
  const maxPos = new MaxHeap();
  const minNeg = new MinHeap();

  arr.forEach((el) => {
    if (el > 0) {
      maxPos.push(el);
    } else {
      minNeg.push(el);
    }
  });

  let ans = 1;

  for (let i = 0; i < 3; i++) {
    if (!maxPos.empty()) {
      ans *= maxPos.pop();
    } else {
      ans *= minNeg.pop();
    }
  }

  return ans;
}
