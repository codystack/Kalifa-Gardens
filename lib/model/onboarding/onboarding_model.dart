class OnboardingModel {
  late String title;
  late String description;
  late String image;

  OnboardingModel({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(description: "Kalifa Garden City is a 190 - Hectare master-planned city conceptualized to house over 1,000 families. It is positioned as ’The New Ikorodu’ due to its proximity to the heart of Lagos, and it’s prominence in the Lagos State Development Master Plan.", image: "assets/images/slide_1.png", title: "Explore your dream space"),
  OnboardingModel(description: "You can invest in Kalifa Garden City today, by activating our flexible payment plan specifically crafted to ensure investors or prospective buyers are presented with affordable choices and peace of mind.", image: "assets/images/slide_2.png", title: "Enjoy flexible payment plans"),
  OnboardingModel(description: "The authenticity of this project rides on the strength of our partners – The Lagos State Government and Land owner, His Royal Highness, Ayangburen of Ikorodu, Oba Kabiru Adewale Shotobi.  In addition, Kalifa Gardens City is managed using the renowned structure at Orange Island Lagos.", image: "assets/images/slide_3.png", title: "Backed by trusted partners"),
  OnboardingModel(description: "Using this app allows you to seamlessly glide through the purchase process and gain clarity on payment schedules, whilst enjoying the accompanied discounts assigned to early investors.", image: "assets/images/slide_4.png", title: "Stay up-to-date on the progress"),
];