let verse = (num) => {
  if (num > 0) {
    let n = num
    let p = n === 1 ? '' : 's'
    let n1 = n === 1 ? 'no more' : num - 1
    let p1 = n1 === 1 ? '' : 's'
    let c = n === 1 ? 'it' : 'one'
    return `${n} bottle${p} of beer on the wall, ${n} bottle${p} of beer.
Take ${c} down and pass it around, ${n1} bottle${p1} of beer on the wall.
`
  } else if (num === 0) {
    return `No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
`
  }
}

let sing = (startNum = 99, endNum = 0) => {
  let verses = ''
  for (let i = startNum; i >= endNum; i--) {
    verses += verse(i)
    if (i !== endNum) verses += '\n'
  }
  return verses
}
export default {
  verse: verse,
  sing: sing
}
