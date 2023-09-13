const fs = require('fs');
const handlebars = require('handlebars');

// Define a Handlebars template for the custom report
const templateSource = `
<!DOCTYPE html>
<html>
<head>
    <title>Karate Custom Report</title>
</head>
<body>
    <h1>Karate Custom Report</h1>
    <table border="1">
        <tr>
            <th>Feature</th>
            <th>Scenario</th>
            <th>Status</th>
            <th>Duration (ms)</th>
        </tr>
        {{#each testResults}}
        <tr>
            <td>{{featureName}}</td>
            <td>{{scenarioName}}</td>
            <td>{{status}}</td>
            <td>{{duration}}</td>
        </tr>
        {{/each}}
    </table>
</body>
</html>
`;

const template = handlebars.compile(templateSource);

// Load the test data (assuming it's stored in a JSON file)
const testResults = require('./test-results.json');

// Generate the custom report HTML using the Handlebars template and test data
const customReportHtml = template({ testResults });

// Specify the output file path for the custom report
const outputFilePath = 'custom-report.html';

// Write the custom report HTML to the output file
fs.writeFileSync(outputFilePath, customReportHtml);

console.log(`Custom report generated: ${outputFilePath}`);
