const things = {
  '0': 'fly',
  '1': 'spider',
  '2': 'bird',
  '3': 'cat',
  '4': 'dog',
  '5': 'goat',
  '6': 'cow',
  '7': 'horse'
}
const v2 = {
  '1': 'It wriggled and jiggled and tickled inside her.',
  '2': 'How absurd to swallow a bird!',
  '3': 'Imagine that, to swallow a cat!',
  '4': 'What a hog, to swallow a dog!',
  '5': 'Just opened her throat and swallowed a goat!',
  '6': "I don't know how she swallowed a cow!",
  '7': "She's dead, of course!"
}
const v3 = {
  '1': 'She swallowed the spider to catch the fly.',
  '2': 'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.',
  '3': 'She swallowed the cat to catch the bird.',
  '4': 'She swallowed the dog to catch the cat.',
  '5': 'She swallowed the goat to catch the dog.',
  '6': 'She swallowed the cow to catch the goat.'
}
const verseL = "I don't know why she swallowed the fly. Perhaps she'll die.\n"

export default class Song {
  v1 (num) {
    return `I know an old lady who swallowed a ${things[num - 1]}.\n`
  }

  verse (num) {
    let returnVerse = this.v1(num)
    if (num > 1) {
      returnVerse += v2[num - 1]
      returnVerse += '\n'
    }
    if (num < 8) {
      for (let i = num - 1; i > 0; i--) {
        returnVerse += v3[i]
        returnVerse += '\n'
      }
      returnVerse += verseL
    }
    return returnVerse
  }

  verses (start, finish) {
    let returnVerse = ''
    for (let i = start; i <= finish; i++) {
      returnVerse += this.verse(i)
      returnVerse += '\n'
    }
    return returnVerse
  }
}
