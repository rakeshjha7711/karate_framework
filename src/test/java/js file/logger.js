const fs = require('fs');

// Define the log file path
const logFilePath = 'karate-log.txt';

// Function to log a message to the file
function log(message) {
  const timestamp = new Date().toISOString();
  const logMessage = `[${timestamp}] ${message}\n`;

  fs.appendFileSync(logFilePath, logMessage);
}

// Export the log function
module.exports = {
  log: log
};
