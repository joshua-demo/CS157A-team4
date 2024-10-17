require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

// MySQL connection configuration
const dbConfig = {
  host: process.env.MYSQL_HOST || 'mysql',
  port: process.env.MYSQL_PORT || 3306,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_ROOT_PASSWORD,
  database: process.env.MYSQL_DATABASE,
};

// Create MySQL connection pool
const pool = mysql.createPool(dbConfig);
console.log('Connection pool to MySQL created');

app.get('/', (req, res) => {
  res.send('Hello!!!');
});

app.get('/api/time', (req, res) => {
  res.json({ time: new Date().toISOString() });
});

// New endpoint to test MySQL connection
app.get('/api/db-test', async (req, res) => {
  try {
    const conn = await pool.getConnection();
    const [results, fields] = await conn.query('SELECT * FROM users LIMIT 5');
    pool.releaseConnection(conn);
    res.json({
      message: 'Database connection successful',
      users: users.map(user => ({
        id: user.id,
        username: user.username,
        email: user.email,
        created_at: user.created_at
      }))
    });
  } catch (error) {
    console.error('Database query failed:', error);
    res.status(500).json({ message: 'Database query failed', error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Express server listening at http://localhost:${port}`);
});
