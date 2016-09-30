export default class PhoneNumber {
  constructor (number) {
    this.phoneNumber = number
  }

  number () {
    let returnNumber = this.phoneNumber.match(/\d/g).join('')
    if (returnNumber.length === 11) {
      if (returnNumber[0] == 1) {
        return returnNumber.substr(1)
      } else {
        return '0000000000'
      }
    }
    if (returnNumber.length !== 10) {
      return '0000000000'
    }
    return returnNumber
  }

  areaCode () {
    return this.number().substr(0, 3)
  }
  split1 () {
    return this.number().substr(3, 3)
  }
  split2 () {
    return this.number().substr(6)
  }
  toString () {
    return `(${this.areaCode()}) ${this.split1()}-${this.split2()}`
  }

}
