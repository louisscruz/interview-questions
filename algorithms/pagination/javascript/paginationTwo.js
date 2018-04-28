const paginate = (input, perPage) => {
  const response = {};
  let remaining = input.length;
  let responseCount = 0;
  let currentIdx = 0;
  // Given more time, I would use a LinkedHashSet here, but that implementation would take a while.
  const addedIdxSet = new Set();

  let currentPageIdx = 0;

  while (remaining > 0) {
    let currentPage = [];

    let seenAuthors = new Set();

    while ((currentPage.length < perPage) && (remaining > 0)) {
      if (currentIdx < input.length) {
        if (!addedIdxSet.has(currentIdx)) {
          const currentPost = input[currentIdx];
          const currentAuthor = currentPost.author;

          if (!seenAuthors.has(currentAuthor)) {
            currentPage.push(currentPost);
            remaining--;
            seenAuthors.add(currentAuthor);
            addedIdxSet.add(currentIdx);
          }
        }

        if (currentIdx === input.length - 1) {
          seenAuthors = new Set();
          currentIdx = 0;
        } else {
          currentIdx++;
        }
      } else {
        currentIdx = 0;
        seenAuthor = new Set();
      }
    }

    response[currentPageIdx++] = currentPage;
    currentPage = [];
    currentIdx = 0;
  }

  return response;
}

const data = [
  {
    ranking: 0,
    author: 'a' // 0
  },
  {
    ranking: 1,
    author: 'a' // 1
  },
  {
    ranking: 2,
    author: 'b' // 0
  },
  {
    ranking: 3,
    author: 'c' // 0
  },
  {
    ranking: 4,
    author: 'a' // 2
  },
  {
    ranking: 5,
    author: 'c' // 1
  },
  {
    ranking: 6,
    author: 'a' // 3
  },
  {
    ranking: 7,
    author: 'c' // 2
  },
  {
    ranking: 8,
    author: 'b' // 1
  },
  {
    ranking: 9,
    author: 'd' // 2
  },
  {
    ranking: 10,
    author: 'a' // 3
  },
  {
    ranking: 11,
    author: 'c' // 3
  },
];

const response = paginate(data, 3);

console.log(response);
