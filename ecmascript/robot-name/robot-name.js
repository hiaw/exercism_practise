const alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
const numeric = '0123456789'

const rD = (a) => {
  return Math.floor(Math.random() * a)
}

const rC = () => {
  return alpha.charAt(rD(26))
}
const rN = () => {
  return numeric.charAt(rD(10))
}

const newName = () => {
  return rC() + rC() + rN() + rN() + rN()
}

export default class Robot {
  constructor () {
    this.reset()
  }

  get name () {
    return this._name
  }

  reset () {
    this._name = newName()
  }
}
