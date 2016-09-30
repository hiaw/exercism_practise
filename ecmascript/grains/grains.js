import BigInt from './big-integer.js'

export default class Grains {
  square (num) {
    let bigI = BigInt(2)
    bigI = bigI.pow(num - 1)
    return bigI.toString()
  }

  total () {
    let bigI = BigInt(0)
    for (let i = 1; i <= 64; i++) {
      bigI = bigI.add(this.square(i))
    }
    return bigI.toString()
  }
}
