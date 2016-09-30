export default class Anagram {
  constructor (input) {
    this.phrase = input
  }

  match (item) {
    // Different length it not Anagram
    if (item.length !== this.phrase.length) {
      return false
    }
    // Same word is not Anagram
    if (item.toLowerCase() === this.phrase.toLowerCase()) {
      return false
    }

    let matchString = this.phrase
    for (let i = 0; i < item.length; i++) {
      let index = matchString.indexOf(item[i])
      matchString = matchString.substr(0, index - 1) + matchString.substr(index + 1)
    }
    return matchString == ''
  }

  matches (array) {
    let returnArray = []
    if (typeof array == 'string') {
      array = [array]
    }
    for (let item of array) {
      if (this.match(item)) returnArray.push(item)
    }
    return returnArray
  }
}
