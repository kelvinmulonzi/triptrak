// image and svg assets path
const String explore = 'assets/images/explore.svg';
const String pending = 'assets/images/pending.svg';

// network image url
const String dummyImage =
    'https://avatars.githubusercontent.com/u/82651930?v=4';
const String dummyImage2 =
    'https://upload.wikimedia.org/wikipedia/commons/1/17/Masai_Mara_at_Sunset.jpg';
const String dummyImage3 =
    'https://www.nairobinationalparkkenya.com/wp-content/uploads/2022/04/Nairobi-National-Park-700x450-2.jpg';
const String dummyImage4 =
    'https://unsplash.com/photos/white-sail-boat-on-sea-during-daytime-oEBqrgQU-gY';
const String dummyImage5 =
    'https://unsplash.com/photos/brown-and-beige-giraffe-NEJcmvLFcws';
const String dummyImage6 =
    'https://en.m.wikipedia.org/wiki/File:Hell%27s_Gate_Airtram_and_Suspension_Bridge_-_panoramio.jpg';

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
