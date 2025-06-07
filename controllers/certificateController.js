const Certificate = require('../models/Certificate');

// Submit a new certificate
exports.submitCertificate = async (req, res) => {
  try {
    const { name, club, event, date, certificateId } = req.body;
    
    // Create and save new certificate
    const certificate = new Certificate({
      name,
      club,
      event,
      date: new Date(date),
      certificateId,
      userId: req.user.id
    });
    
    await certificate.save();
    
    res.status(201).json({
      success: true,
      message: "Certificate submitted successfully",
      data: certificate
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error', error: error.message });
  }
};

// Get all certificates for logged-in user
exports.getUserCertificates = async (req, res) => {
  try {
    const certificates = await Certificate.find({ userId: req.user.id });
    
    res.json({
      success: true,
      count: certificates.length,
      data: certificates
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error', error: error.message });
  }
};