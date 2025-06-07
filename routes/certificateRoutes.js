const express = require('express');
const { submitCertificate, getUserCertificates } = require('../controllers/certificateController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

// Apply auth middleware to all certificate routes
router.use(authMiddleware);

// Submit a new certificate
router.post('/submit', submitCertificate);

// Get all certificates for the logged-in user
router.get('/', getUserCertificates);

module.exports = router;