const express = require('express');
const path = require('path');
const fs = require('fs');
const multer = require('multer');

const app = express();

app.get('/dev/upload', (req, res) => {
  res.sendFile(`${__dirname}/static/dev.html`);
});

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

app.post('/dev/upload', upload.single('file'), async (req, res) => {
  const uploadDir = path.join(__dirname, 'static');

  if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir);
  }

  const file = req.file;

  if (!file) {
    return res.status(400).send('No file uploaded.');
  }

  const filePath = path.join(uploadDir, file.originalname);

  fs.writeFileSync(filePath, file.buffer);

  res.send('File uploaded successfully!');
});

app.listen(3000, () => {
  console.log('server started');
});
