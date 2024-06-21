class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "JOIN CHITS",
    image: "assets/logos/Screen_3_Slider/Slider1_logo.png",
    desc:
        "Select chits and join now to start your savings journey with Chitbox!",
  ),
  OnboardingContents(
    title: "Place Bid !!!",
    image: "assets/logos/Screen_3_Slider/Slider_2.png",
    desc: "Place your Bid now and seize the opportunity with Chitbox auctions!",
  ),
  OnboardingContents(
    title: "Claim Prize Money",
    image: "assets/logos/Screen_3_Slider/Slider_3.png",
    desc:
        "Unlock your prize money! Submit your documents and claim your reward today!",
  ),
];
