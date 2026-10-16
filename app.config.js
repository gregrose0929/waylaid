const fs = require('node:fs');
const path = require('node:path');

// Extends app.json with values that must not be committed or may not exist yet.
// - GOOGLE_MAPS_ANDROID_KEY is stored as an EAS environment variable (see README).
// - google-services.json (Firebase, for push notifications) is used when present.
module.exports = ({ config }) => {
  const googleServices = path.join(__dirname, 'google-services.json');
  return {
    ...config,
    android: {
      ...config.android,
      ...(fs.existsSync(googleServices) ? { googleServicesFile: './google-services.json' } : {}),
    },
    plugins: config.plugins.map((plugin) =>
      plugin === 'react-native-maps'
        ? ['react-native-maps', { androidGoogleMapsApiKey: process.env.GOOGLE_MAPS_ANDROID_KEY }]
        : plugin,
    ),
  };
};
