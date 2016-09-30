export default function transform (old) {
  let returnObj = {}
  for (let key in old) {
    for (let value of old[key]) {
      returnObj[value.toLowerCase()] = parseInt(key)
    }
  }
  return returnObj
}
