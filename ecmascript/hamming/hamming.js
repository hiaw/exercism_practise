export default class Hamming {
  compute (strand1, strand2) {
    if (strand1.length != strand2.length)
      throw new Error('DNA strands must be of equal length.')

    let count = 0
    for (let i in strand1)
      if (strand2[i] != strand1[i]) count++

    return count
  }
}
