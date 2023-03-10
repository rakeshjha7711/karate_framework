
const jwt = require('jsonwebtoken')

let reqBody = {
  "mobileNumber": "+918722000003",
  "deviceId": "9F0D7162-F90E-41B7-8357-88891C33F0ED",
  "channel": "app",
  "merchantId": "zqFCkcpQYj",
  "amount": "60",
  "currency": "INR",
  "merchantOrderId": "KOTAK-12090353435434442211",
  "callbackUrl": "https://localhost:8000/api/processPayment",
  "emiSubvention": false,
  "emiTransaction": false,
  "paymentMode": {
    "bnpl": [{
      "paymentChannelId": "kotak_bnpl_cardless_*",
      "amount": "60"
    }]
  },

  "source": "secure-2fr"
}

const secret = "sk_live_BsIW6BAr81acNpKvPnKzQSfsB7zHRltHFsq6b1pq"

const token = jwt.sign(reqBody, secret, { expiresIn: 60 * 15 })

console.log("Encrypted req: " + token)