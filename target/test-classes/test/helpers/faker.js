const faker = require('faker')
const log = require('../sys/log')
faker.locale = 'en_IND'

module.exports = {
  getfakedata(fake) {
    let fakedata = null
    try {
      fakedata = faker.fake(`{{${fake}}}`)
    } catch (e) {
      log(e, true)
    }
    return fakedata
  }
}
