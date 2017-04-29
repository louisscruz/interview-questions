const spiralMatrix = (arr, cb) => {
  const directions = {
    right: {
      name: 'right',
      next: 'down',
      remaining: arr[0].length,
      delta: [0, 1],
    },
    down: {
      name: 'down',
      next: 'left',
      remaining: arr.length - 1,
      delta: [1, 0],
    },
    left: {
      name: 'left',
      next: 'up',
      remaining: arr[0].length - 1,
      delta: [0, -1],
    },
    up: {
      name: 'up',
      next: 'right',
      remaining: arr.length - 2,
      delta: [-1, 0],
    },
  };

  let currentDirection = directions.right;
  let currentPosition = [0, -1];

  const currentElement = () => arr[currentPosition[0]][currentPosition[1]];
  const updatePosition = () => {
    currentPosition = currentPosition.map((el, i) => {
      return el + currentDirection.delta[i]
    });
  };

  while (currentDirection.remaining > 0) {
    for (let i = 0; i < currentDirection.remaining; i += 1) {
      updatePosition();
      cb(currentElement());
    }
    currentDirection.remaining -= 2;
    currentDirection = directions[currentDirection.next];
  }

  return arr;
}
