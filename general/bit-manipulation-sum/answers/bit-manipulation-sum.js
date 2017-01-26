function bitManipulationSum(a, b) {
  if (b === 0) {
    return a;
  } else {
    const xor = a ^ b;
    const carryOver = (a & b) << 1;
    return bitManipulationSum(carryOver, xor);
  }
}

console.log(bitManipulationSum(4, 4));
