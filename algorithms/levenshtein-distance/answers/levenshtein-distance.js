String.prototype.levenshteinDistance = function(other) {
  if (this.length === 0) return other.length;
  if (other.length === 0) return this.length;

  let cost;

  if (this[this.length - 1] === other[other.length - 1]) {
    cost = 0;
  } else {
    cost = 1;
  }

  const subLeft = this.slice(0, -1).levenshteinDistance(other);
  const subRight = this.levenshteinDistance(other.slice(0, -1));
  const subBoth = this.slice(0, -1).levenshteinDistance(other.slice(0, -1));

  return Math.min(subLeft + 1, subRight + 1, subBoth + cost);
}

console.log('kitten'.levenshteinDistance('sitting') === 3);
