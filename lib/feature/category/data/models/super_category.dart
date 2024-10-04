const List<String> superCategoriesList = ['Woman', 'Man', 'Kids', 'Beauty'];

// enums are not required, adds unnecessary complexity since dropdowns & DB will only accept string //

// enum SuperCategory { woman, man, kids, beauty }

// // Extend the enum with a helper to get the enum value from a string
// extension SuperCategoryExtension on SuperCategory {
//   String get name {
//     switch (this) {
//       case SuperCategory.man:
//         return 'MAN';
//       case SuperCategory.woman:
//         return 'WOMAN';
//       case SuperCategory.kids:
//         return 'KIDS';
//       case SuperCategory.beauty:
//         return 'BEAUTY';
//       default:
//         return '';
//     }
//   }
//
//   // Convert a string back to the enum
//   static SuperCategory fromString(String category) {
//     switch (category) {
//       case 'MAN':
//         return SuperCategory.man;
//       case 'WOMAN':
//         return SuperCategory.woman;
//       case 'KIDS':
//         return SuperCategory.kids;
//       case 'BEAUTY':
//         return SuperCategory.beauty;
//       default:
//         throw Exception('Unknown super category: $category');
//     }
//   }
// }

// List<String> superCategoriesList = SuperCategory.values.map((category) => category.name.toUpperCase()).toList();

// // convert string to super category enum
// SuperCategory stringToSuperCategory(String superCategory) {
//   return SuperCategory.values.firstWhere((category) => category.name.toUpperCase() == superCategory);
// }
