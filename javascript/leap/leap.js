var Year = function () {}

Year.prototype.isLeap = function (input) {
  if (input) {
    return `Hello, ${input}!`
  }
  return 'Hello, World!'
}

module.exports = Year
