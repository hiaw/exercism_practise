const gigaSecond = Math.pow(10, 12)

export default class GigaSecond {
  constructor (date) {
    this.store_date = date
  }

  date () {
    return new Date(this.store_date.getTime() + gigaSecond)
  }
}
