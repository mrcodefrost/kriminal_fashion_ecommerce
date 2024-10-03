enum SuperCategory { woman, man, kids, beauty }

List<String> superCategoriesList = SuperCategory.values.map((category) => category.name.toUpperCase()).toList();

// convert string to super category enum
SuperCategory stringToSuperCategory(String superCategory) {
  return SuperCategory.values.firstWhere((category) => category.name.toUpperCase() == superCategory);
}