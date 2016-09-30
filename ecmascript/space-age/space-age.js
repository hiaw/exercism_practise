import _ from 'lodash'

const ratio = {
  Mercury: 0.2408467,
  Venus: 0.61519726,
  Mars: 1.8808158,
  Jupiter: 11.862615,
  Saturn: 29.447498,
  Uranus: 84.016846,
  Neptune: 164.79132
}

const EarthDay = 31557600

export default class SpaceAge {
  constructor (seconds) {
    this.seconds = seconds
  }

  earth () {
    return this.seconds / EarthDay
  }

  planet (ratio) {
    return _.round(this.earth() / ratio, 2)
  }

  onEarth () {
    return _.round(this.earth(), 2)
  }

  onMercury () { return this.planet(ratio.Mercury) }
  onVenus () { return this.planet(ratio.Venus) }
  onMars () { return this.planet(ratio.Mars) }
  onJupiter () { return this.planet(ratio.Jupiter) }
  onSaturn () { return this.planet(ratio.Saturn) }
  onUranus () { return this.planet(ratio.Uranus) }
  onNeptune () { return this.planet(ratio.Neptune) }
}
