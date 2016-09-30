export default class Transcriptor {
  toRna (input) {
    let rna = ''
    for (let i = 0; i < input.length; i++)
      rna += this.transcribe(input[i])
    return rna
  }

  transcribe (c) {
    if (c == 'C') return 'G'
    if (c == 'G') return 'C'
    if (c == 'A') return 'U'
    if (c == 'T') return 'A'
  }
}
