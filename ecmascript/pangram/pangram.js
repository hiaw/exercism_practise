export default class Pangram {
  constructor (input) {
    this.sentence = input
  }

  isPangram () {
    let extractedString = this.sentence.toLowerCase().match(/[a-z]/g)
    if (extractedString) {
      let matchString = 'abcdefghijklmnopqrstuvwxyz'
      for (let i = 0; i < extractedString.length; i++) {
        matchString = matchString.split(extractedString[i]).join('')
      }
      if (matchString === '') return true
    }
    return false
  }
}
