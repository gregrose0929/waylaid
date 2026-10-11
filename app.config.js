// Extends app.json with values that must not be committed.
// GOOGLE_MAPS_ANDROID_KEY is stored as an EAS environment variable (see README).
module.exports = ({ config }) => ({
  ...config,
  plugins: config.plugins.map((plugin) =>
    plugin === 'react-native-maps'
      ? ['react-native-maps', { androidGoogleMapsApiKey: process.env.GOOGLE_MAPS_ANDROID_KEY }]
      : plugin,
  ),
});
