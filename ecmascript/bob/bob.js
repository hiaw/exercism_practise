//
// This is only a SKELETON file for the 'Bob' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

class Bob {
  hey (message) {
    let reply = 'Whatever.'
    if (message.endsWith('?')) {
      reply = 'Sure.'
    }
    if (/[A-z]/.test(message) && message.toUpperCase() === message) {
      reply = 'Whoa, chill out!'
    }
    if (message.trim() === '') {
      reply = 'Fine. Be that way!'
    }
    return reply
  }
}

export default Bob
