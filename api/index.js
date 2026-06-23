const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.post('/submit', (req, res) => {
    const body = req.body;
    console.log('Received:', body);
    res.json({
        status: 'success',
        received: body
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});