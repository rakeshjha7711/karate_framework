'use strict'

module.exports = {
  generateFakeData
}

const faker = require('./faker')
const { afakerre } = require('./regex')

function generateFakeData(userContext, events, done) {
  const { vars } = userContext
  Object.keys(vars).forEach(i => {
    const fakerdec = afakerre.exec(vars[i])
    if (fakerdec) {
      userContext.vars[i] = faker.getfakedata(fakerdec[1])
    }
  })
  return done()
}
