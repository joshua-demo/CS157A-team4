const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello!');
});

app.get('/api/time', (req, res) => {
  // res.json({ time: new Date().toISOString() });
  res.json({ time: '2024-02-20T12:00:00Z' });
});

app.listen(port, () => {
  console.log(`Express server listening at http://localhost:${port}`);
});
