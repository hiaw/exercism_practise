export default class School {
  constructor () {
    this.students = {}
  }

  roster () {
    return this.students
  }

  add (name, grade) {
    if (this.students[grade] == null)
      this.students[grade] = []
    this.students[grade].push(name)
  }

  grade (grade) {
    if (this.students[grade] != null)
      return this.students[grade].sort()
    return []
  }

  roster () {
    let returnObject = {}
    for (let s in this.students) {
      returnObject[s] = this.students[s].slice().sort()
    }
    return returnObject
  }
}
