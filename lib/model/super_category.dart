enum SuperCategory { woman, man, kids, beauty }

List<String> superCategoriesList = SuperCategory.values.map((category) => category.name.toUpperCase()).toList();
