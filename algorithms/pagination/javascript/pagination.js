const paginate = (string, k) => {
  const array = string.split('\n');
  const buffer = [];

  const hostId = row => row.split(', ')[2];

  let i = 0;
  let currentCount = 0;
  const seenSet = new Set();

  while (array.length) {
    const row = array[i];
    const id = hostId(row);

    if (!seenSet.has(id)) {
      array.splice(i, 1);
      buffer.push(row);
      seenSet.add(id);
      currentCount += 1;
    } else {
      i += 1;
    }

    if (currentCount === k) {
      buffer.push('');
      currentCount = 0;
    }

    if (i === array.length || currentCount === k) {
      i = 0;
      seenSet.clear();
    }
  }

  return buffer.join('\n').trim();
}

const string = `
123 abc st., 100, 1
124 abc st., 99, 2
125 abc st., 97, 1
126 bcd st., 80, 3
127 bcd st., 79, 2
130 dce st., 78, 1
131 dce st., 77, 2
132 dce st., 70, 3
133 asd st., 60, 1
`.trim();

console.log(paginate(string, 3));
