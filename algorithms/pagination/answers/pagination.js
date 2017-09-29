const paginate = (array, n) => {
  const entryOwnerId = (entry) => entry.split(', ')[2];
  const buffer = [array[0]];
  const seenSet = new Set(entryOwnerId(array[0]));

  let i = 1;
  let currentCount = 1;
  let currentMinIdx = 0;
  let currentCollideCount = 0;


  while (buffer.length < array.length) {
    const entry = array[i];
    const ownerId = entryOwnerId(entry);

    if (!seenSet.has(ownerId)) {
      buffer.push(entry);
      seenSet.add(ownerId);
      currentCount += 1;
    } else {
      if (currentCollideCount === 0) {
        currentMinIdx = i;
      }
      currentCollideCount += 1;
    }

    if (currentCount === n) {
      currentCount = 0;
      currentCollideCount = 0;
      seenSet.clear();
    }

    if (i < array.length - 1) {
      i += 1;
    } else {
      // seenSet.clear();
      i = currentMinIdx;
    }
  }

  return buffer;
};

const lines = [
  '123 abc st., 100, 1',
  '124 abc st., 99, 2',
  '125 abc st., 97, 1',
  '126 bcd st., 80, 3',
  '127 bcd st., 79, 2',
  '130 dce st., 78, 1',
  '131 dce st., 77, 2',
  '132 dce st., 70, 3',
  '133 asd st., 60, 1',
];

console.log(paginate(lines, 3));
