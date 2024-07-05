import fs from "fs"; // Without star
import stringify from 'csv-stringify';

// Read data from text file
fs.readFile('variable.txt', 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading file:', err);
        return;
    }

    // Parse text file data into an array of objects
    const parsedData = data.split('\n')
        .map(line => line.split(','))
        .filter(line => line.length === 3) // Ensure each line has all columns
        .map(line => ({ name: line[0], age: parseInt(line[1]), city: line[2] }));

    // Configure csv-stringify
    const stringifyOptions = {
        header: true,
        columns: ['name', 'age', 'city']
    };

    // Convert parsed data to CSV string
    stringify(parsedData, stringifyOptions, (err, output) => {
        if (err) {
            console.error('Error converting to CSV:', err);
            return;
        }

        // Output the generated CSV string
        console.log('Generated CSV:');
        console.log(output);
    });
});