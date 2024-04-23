// image and svg assets path
const String explore = 'assets/images/explore.svg';
const String pending = 'assets/images/pending.svg';

// network image url
const String dummyImage =
    'https://avatars.githubusercontent.com/u/82651930?v=4';
const String dummyImage2 = '';
const String dummyImage3 =
    '';
const String dummyImage4 =
    '';
const String dummyImage5 =
    '';
const String dummyImage6 =
    '';

String extractNameFromEmail(String email) {
  // Split the email address at the '@' symbol
  List<String> parts = email.split('@');

  // Check if there are exactly two parts (name and domain)
  if (parts.length == 2) {
    // Return the first part (name)
    return parts[0];
  } else {
    // Return empty string if the email format is invalid
    return email;
  }
}
