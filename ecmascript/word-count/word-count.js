export default class Words {
  count (input) {
    let returnObj = {}
    let wordList = input.trim().toLowerCase().split(/\s+/)
    wordList.map((word) => {
      if (Number.isInteger(returnObj[word]))
        returnObj[word] += 1
      else
        returnObj[word] = 1
    })
    return returnObj
  }
}
