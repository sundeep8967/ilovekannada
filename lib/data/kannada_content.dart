import 'lesson_models.dart';

/// 3-Month Kannada Curriculum - English Transliteration Only
class KannadaCurriculum {
  static List<LessonUnit> getAllUnits() => [
    // Month 1: Survival
    ...month1Units,
    // Month 2: Daily Life
    ...month2Units,
    // Month 3: Social
    ...month3Units,
  ];

  // ============ MONTH 1: SURVIVAL (Units 1-12) ============
  static final month1Units = [
    // Unit 1: Hello & Goodbye
    LessonUnit(
      id: 'unit_1', title: 'Hello & Goodbye', subtitle: 'Basic greetings', emoji: '👋', order: 1,
      lessons: [
        Lesson(id: 'l1_1', title: 'Hello', description: 'Ways to say hello', xpReward: 10, words: [
          Word(kannada: 'Namaskara', english: 'Hello (formal)', pronunciation: 'nuh-mus-KAH-ruh'),
          Word(kannada: 'Halo', english: 'Hello (casual)', pronunciation: 'huh-LOH'),
          Word(kannada: 'Hi', english: 'Hi', pronunciation: 'hai'),
          Word(kannada: 'Swagata', english: 'Welcome', pronunciation: 'swuh-GUH-tuh'),
          Word(kannada: 'Vandane', english: 'Greetings', pronunciation: 'vun-duh-NAY'),
        ]),
        Lesson(id: 'l1_2', title: 'Goodbye', description: 'Ways to say bye', xpReward: 10, words: [
          Word(kannada: 'Hogi banni', english: 'Goodbye', pronunciation: 'HOH-gee BUN-nee'),
          Word(kannada: 'Matte sigona', english: 'See you again', pronunciation: 'MUT-tay see-GOH-nuh'),
          Word(kannada: 'Shubha ratri', english: 'Good night', pronunciation: 'SHOO-buh RAH-tree'),
          Word(kannada: 'Nale sigona', english: 'See you tomorrow', pronunciation: 'NAH-lay see-GOH-nuh'),
          Word(kannada: 'Hogi bartini', english: 'I will come back', pronunciation: 'HOH-gee bar-TEE-nee'),
        ]),
        Lesson(id: 'l1_3', title: 'Time Greetings', description: 'Morning to night', xpReward: 10, words: [
          Word(kannada: 'Shubhodaya', english: 'Good morning', pronunciation: 'shoo-BOH-duh-yuh'),
          Word(kannada: 'Shubha madhyahna', english: 'Good afternoon', pronunciation: 'SHOO-buh mud-YAH-nuh'),
          Word(kannada: 'Shubha sanje', english: 'Good evening', pronunciation: 'SHOO-buh SUN-jay'),
        ]),
      ],
    ),

    // Unit 2: Please & Thank You
    LessonUnit(
      id: 'unit_2', title: 'Please & Thanks', subtitle: 'Polite words', emoji: '🙏', order: 2,
      lessons: [
        Lesson(id: 'l2_1', title: 'Thank You', description: 'Showing gratitude', xpReward: 10, words: [
          Word(kannada: 'Dhanyavada', english: 'Thank you', pronunciation: 'dun-yuh-VAH-duh'),
          Word(kannada: 'Dhanyavadagalu', english: 'Thank you (formal)', pronunciation: 'dun-yuh-vah-duh-GUH-loo'),
          Word(kannada: 'Thanks', english: 'Thanks (casual)', pronunciation: 'thanks'),
          Word(kannada: 'Thumba dhanyavada', english: 'Thank you very much', pronunciation: 'THOOM-buh dun-yuh-VAH-duh'),
        ]),
        Lesson(id: 'l2_2', title: 'Please & Sorry', description: 'Being polite', xpReward: 10, words: [
          Word(kannada: 'Dayavittu', english: 'Please', pronunciation: 'duh-yuh-VIT-too'),
          Word(kannada: 'Kshamisi', english: 'Sorry', pronunciation: 'kshuh-MEE-see'),
          Word(kannada: 'Paravagilla', english: 'No problem', pronunciation: 'pah-ruh-VAH-gill-uh'),
          Word(kannada: 'Olledu', english: 'Its okay', pronunciation: 'OL-lay-doo'),
        ]),
        Lesson(id: 'l2_3', title: 'Excuse Me', description: 'Getting attention', xpReward: 10, words: [
          Word(kannada: 'Kshamisi', english: 'Excuse me', pronunciation: 'kshuh-MEE-see'),
          Word(kannada: 'Ondu nimisha', english: 'One moment', pronunciation: 'ON-doo nee-MEE-shuh'),
          Word(kannada: 'Dayavittu heliri', english: 'Please tell me', pronunciation: 'duh-yuh-VIT-too HAY-lee-ree'),
        ]),
      ],
    ),

    // Unit 3: Yes & No
    LessonUnit(
      id: 'unit_3', title: 'Yes & No', subtitle: 'Basic responses', emoji: '✅', order: 3,
      lessons: [
        Lesson(id: 'l3_1', title: 'Yes', description: 'Ways to say yes', xpReward: 10, words: [
          Word(kannada: 'Houdu', english: 'Yes', pronunciation: 'HOW-doo'),
          Word(kannada: 'Aaytu', english: 'Okay/Alright', pronunciation: 'AH-yee-too'),
          Word(kannada: 'Sari', english: 'Alright/Fine', pronunciation: 'SUH-ree'),
          Word(kannada: 'Aagaboudu', english: 'Can be done', pronunciation: 'AH-guh-BOW-doo'),
        ]),
        Lesson(id: 'l3_2', title: 'No', description: 'Ways to say no', xpReward: 10, words: [
          Word(kannada: 'Illa', english: 'No', pronunciation: 'IL-luh'),
          Word(kannada: 'Beda', english: 'Dont want', pronunciation: 'BAY-duh'),
          Word(kannada: 'Aagalla', english: 'Cannot be done', pronunciation: 'AH-guh-luh'),
          Word(kannada: 'Gottilla', english: 'Dont know', pronunciation: 'GOT-til-luh'),
        ]),
        Lesson(id: 'l3_3', title: 'Maybe', description: 'Uncertain responses', xpReward: 10, words: [
          Word(kannada: 'Irboudu', english: 'Maybe', pronunciation: 'EER-bow-doo'),
          Word(kannada: 'Nodona', english: 'Lets see', pronunciation: 'NOH-doh-nuh'),
          Word(kannada: 'Gottilla', english: 'Not sure', pronunciation: 'GOT-til-luh'),
        ]),
      ],
    ),

    // Unit 4: Numbers 1-10
    LessonUnit(
      id: 'unit_4', title: 'Numbers 1-10', subtitle: 'Basic counting', emoji: '🔢', order: 4,
      lessons: [
        Lesson(id: 'l4_1', title: '1 to 5', description: 'First five', xpReward: 10, words: [
          Word(kannada: 'Ondu', english: 'One (1)', pronunciation: 'ON-doo'),
          Word(kannada: 'Eradu', english: 'Two (2)', pronunciation: 'AY-ruh-doo'),
          Word(kannada: 'Mooru', english: 'Three (3)', pronunciation: 'MOO-roo'),
          Word(kannada: 'Nalku', english: 'Four (4)', pronunciation: 'NAAL-koo'),
          Word(kannada: 'Aidu', english: 'Five (5)', pronunciation: 'EYE-doo'),
        ]),
        Lesson(id: 'l4_2', title: '6 to 10', description: 'Next five', xpReward: 10, words: [
          Word(kannada: 'Aaru', english: 'Six (6)', pronunciation: 'AA-roo'),
          Word(kannada: 'Yelu', english: 'Seven (7)', pronunciation: 'YAY-loo'),
          Word(kannada: 'Entu', english: 'Eight (8)', pronunciation: 'EN-too'),
          Word(kannada: 'Ombattu', english: 'Nine (9)', pronunciation: 'om-BUT-too'),
          Word(kannada: 'Hattu', english: 'Ten (10)', pronunciation: 'HUT-too'),
        ]),
        Lesson(id: 'l4_3', title: 'Zero & Count', description: 'Zero and counting', xpReward: 10, words: [
          Word(kannada: 'Sonne', english: 'Zero (0)', pronunciation: 'SON-nay'),
          Word(kannada: 'Sankhye', english: 'Number', pronunciation: 'SUN-khyay'),
          Word(kannada: 'Enondu', english: 'How many', pronunciation: 'YEN-on-doo'),
        ]),
      ],
    ),

    // Unit 5: Numbers 11-50
    LessonUnit(
      id: 'unit_5', title: 'Numbers 11-50', subtitle: 'More numbers', emoji: '🔢', order: 5,
      lessons: [
        Lesson(id: 'l5_1', title: '11 to 20', description: 'Teens', xpReward: 10, words: [
          Word(kannada: 'Hannondu', english: 'Eleven (11)', pronunciation: 'hun-NON-doo'),
          Word(kannada: 'Hanneradu', english: 'Twelve (12)', pronunciation: 'hun-NAY-ruh-doo'),
          Word(kannada: 'Hadimooru', english: 'Thirteen (13)', pronunciation: 'huh-dee-MOO-roo'),
          Word(kannada: 'Hadinaalku', english: 'Fourteen (14)', pronunciation: 'huh-dee-NAAL-koo'),
          Word(kannada: 'Hadinaidu', english: 'Fifteen (15)', pronunciation: 'huh-dee-NAI-doo'),
        ]),
        Lesson(id: 'l5_2', title: '16 to 20', description: 'More teens', xpReward: 10, words: [
          Word(kannada: 'Hadinaaru', english: 'Sixteen (16)', pronunciation: 'huh-dee-NAA-roo'),
          Word(kannada: 'Hadinelu', english: 'Seventeen (17)', pronunciation: 'huh-dee-NAY-loo'),
          Word(kannada: 'Hadinentu', english: 'Eighteen (18)', pronunciation: 'huh-dee-NEN-too'),
          Word(kannada: 'Hattombattu', english: 'Nineteen (19)', pronunciation: 'hut-tom-BUT-too'),
          Word(kannada: 'Ippattu', english: 'Twenty (20)', pronunciation: 'ip-PUT-too'),
        ]),
        Lesson(id: 'l5_3', title: 'Tens', description: '30, 40, 50', xpReward: 10, words: [
          Word(kannada: 'Moovattu', english: 'Thirty (30)', pronunciation: 'moo-VUT-too'),
          Word(kannada: 'Nalavattu', english: 'Forty (40)', pronunciation: 'nuh-luh-VUT-too'),
          Word(kannada: 'Aivattu', english: 'Fifty (50)', pronunciation: 'eye-VUT-too'),
        ]),
      ],
    ),

    // Unit 6: Numbers 50-100 + Money
    LessonUnit(
      id: 'unit_6', title: 'Numbers & Money', subtitle: '50-100 and currency', emoji: '💰', order: 6,
      lessons: [
        Lesson(id: 'l6_1', title: '60 to 100', description: 'Big numbers', xpReward: 10, words: [
          Word(kannada: 'Aravattu', english: 'Sixty (60)', pronunciation: 'uh-ruh-VUT-too'),
          Word(kannada: 'Eppattu', english: 'Seventy (70)', pronunciation: 'ep-PUT-too'),
          Word(kannada: 'Embattu', english: 'Eighty (80)', pronunciation: 'em-BUT-too'),
          Word(kannada: 'Tombattu', english: 'Ninety (90)', pronunciation: 'tom-BUT-too'),
          Word(kannada: 'Nooru', english: 'Hundred (100)', pronunciation: 'NOO-roo'),
        ]),
        Lesson(id: 'l6_2', title: 'Money', description: 'Currency words', xpReward: 10, words: [
          Word(kannada: 'Rupaayi', english: 'Rupee', pronunciation: 'roo-PAH-yee'),
          Word(kannada: 'Paise', english: 'Paise', pronunciation: 'PIE-say'),
          Word(kannada: 'Hanam', english: 'Money', pronunciation: 'HUH-num'),
          Word(kannada: 'Bele', english: 'Price', pronunciation: 'BAY-lay'),
        ]),
        Lesson(id: 'l6_3', title: 'Price Talk', description: 'Asking prices', xpReward: 10, words: [
          Word(kannada: 'Eshtu', english: 'How much', pronunciation: 'ESH-too'),
          Word(kannada: 'Eshtu rupaayi', english: 'How many rupees', pronunciation: 'ESH-too roo-PAH-yee'),
          Word(kannada: 'Tumba', english: 'Very/Too much', pronunciation: 'THOOM-buh'),
        ]),
      ],
    ),

    // Unit 7: What & Why
    LessonUnit(
      id: 'unit_7', title: 'What & Why', subtitle: 'Question words', emoji: '❓', order: 7,
      lessons: [
        Lesson(id: 'l7_1', title: 'What', description: 'Asking what', xpReward: 10, words: [
          Word(kannada: 'Enu', english: 'What', pronunciation: 'AY-noo'),
          Word(kannada: 'Idu enu', english: 'What is this', pronunciation: 'EE-doo AY-noo'),
          Word(kannada: 'Adu enu', english: 'What is that', pronunciation: 'AH-doo AY-noo'),
          Word(kannada: 'Enu beku', english: 'What do you want', pronunciation: 'AY-noo BAY-koo'),
        ]),
        Lesson(id: 'l7_2', title: 'Why', description: 'Asking why', xpReward: 10, words: [
          Word(kannada: 'Yake', english: 'Why', pronunciation: 'YAH-kay'),
          Word(kannada: 'Yaakandre', english: 'Because', pronunciation: 'yah-KUN-dray'),
          Word(kannada: 'Hege', english: 'How', pronunciation: 'HAY-gay'),
          Word(kannada: 'Yaavudu', english: 'Which one', pronunciation: 'YAH-voo-doo'),
        ]),
        Lesson(id: 'l7_3', title: 'Which', description: 'Asking which', xpReward: 10, words: [
          Word(kannada: 'Yaava', english: 'Which', pronunciation: 'YAH-vuh'),
          Word(kannada: 'Yaava ondu', english: 'Which one', pronunciation: 'YAH-vuh ON-doo'),
          Word(kannada: 'Ella', english: 'All', pronunciation: 'EL-luh'),
        ]),
      ],
    ),

    // Unit 8: Where & When
    LessonUnit(
      id: 'unit_8', title: 'Where & When', subtitle: 'Location and time', emoji: '📍', order: 8,
      lessons: [
        Lesson(id: 'l8_1', title: 'Where', description: 'Asking where', xpReward: 10, words: [
          Word(kannada: 'Elli', english: 'Where', pronunciation: 'EL-lee'),
          Word(kannada: 'Ellide', english: 'Where is it', pronunciation: 'el-LEE-day'),
          Word(kannada: 'Ellinda', english: 'From where', pronunciation: 'el-LIN-duh'),
          Word(kannada: 'Ellige', english: 'To where', pronunciation: 'el-LEE-gay'),
        ]),
        Lesson(id: 'l8_2', title: 'When', description: 'Asking when', xpReward: 10, words: [
          Word(kannada: 'Yaavaga', english: 'When', pronunciation: 'YAH-vuh-guh'),
          Word(kannada: 'Eega', english: 'Now', pronunciation: 'EE-guh'),
          Word(kannada: 'Amele', english: 'Later', pronunciation: 'AH-may-lay'),
          Word(kannada: 'Modalu', english: 'Earlier/First', pronunciation: 'MOH-duh-loo'),
        ]),
        Lesson(id: 'l8_3', title: 'Time Words', description: 'Time expressions', xpReward: 10, words: [
          Word(kannada: 'Ivattu', english: 'Today', pronunciation: 'ee-VUT-too'),
          Word(kannada: 'Naale', english: 'Tomorrow', pronunciation: 'NAH-lay'),
          Word(kannada: 'Ninne', english: 'Yesterday', pronunciation: 'NIN-nay'),
        ]),
      ],
    ),

    // Unit 9: Who & How
    LessonUnit(
      id: 'unit_9', title: 'Who & How', subtitle: 'People and manner', emoji: '👤', order: 9,
      lessons: [
        Lesson(id: 'l9_1', title: 'Who', description: 'Asking who', xpReward: 10, words: [
          Word(kannada: 'Yaaru', english: 'Who', pronunciation: 'YAH-roo'),
          Word(kannada: 'Yaarige', english: 'To whom', pronunciation: 'YAH-ree-gay'),
          Word(kannada: 'Yaaradu', english: 'Whose', pronunciation: 'YAH-ruh-doo'),
          Word(kannada: 'Avaru yaaru', english: 'Who is he/she', pronunciation: 'AH-vuh-roo YAH-roo'),
        ]),
        Lesson(id: 'l9_2', title: 'How', description: 'Asking how', xpReward: 10, words: [
          Word(kannada: 'Hege', english: 'How', pronunciation: 'HAY-gay'),
          Word(kannada: 'Hegiddira', english: 'How are you (formal)', pronunciation: 'hay-GID-dee-ruh'),
          Word(kannada: 'Hegiddiya', english: 'How are you (casual)', pronunciation: 'hay-GID-dee-yuh'),
          Word(kannada: 'Hege madodu', english: 'How to do', pronunciation: 'HAY-gay MAH-doh-doo'),
        ]),
        Lesson(id: 'l9_3', title: 'How Much', description: 'Quantity questions', xpReward: 10, words: [
          Word(kannada: 'Eshtu', english: 'How much/many', pronunciation: 'ESH-too'),
          Word(kannada: 'Ella eshtu', english: 'How much total', pronunciation: 'EL-luh ESH-too'),
          Word(kannada: 'Eshtu jana', english: 'How many people', pronunciation: 'ESH-too JUH-nuh'),
        ]),
      ],
    ),

    // Unit 10: This & That
    LessonUnit(
      id: 'unit_10', title: 'This & That', subtitle: 'Pointing words', emoji: '👆', order: 10,
      lessons: [
        Lesson(id: 'l10_1', title: 'This', description: 'Nearby things', xpReward: 10, words: [
          Word(kannada: 'Idu', english: 'This', pronunciation: 'EE-doo'),
          Word(kannada: 'Ivaru', english: 'This person', pronunciation: 'EE-vuh-roo'),
          Word(kannada: 'Ivaga', english: 'This time/now', pronunciation: 'EE-vuh-guh'),
          Word(kannada: 'Intha', english: 'Like this/such', pronunciation: 'IN-thuh'),
        ]),
        Lesson(id: 'l10_2', title: 'That', description: 'Far things', xpReward: 10, words: [
          Word(kannada: 'Adu', english: 'That', pronunciation: 'AH-doo'),
          Word(kannada: 'Avaru', english: 'That person', pronunciation: 'AH-vuh-roo'),
          Word(kannada: 'Avaga', english: 'That time/then', pronunciation: 'AH-vuh-guh'),
          Word(kannada: 'Antha', english: 'Like that/such', pronunciation: 'UN-thuh'),
        ]),
        Lesson(id: 'l10_3', title: 'Here & There', description: 'Location pointers', xpReward: 10, words: [
          Word(kannada: 'Illi', english: 'Here', pronunciation: 'IL-lee'),
          Word(kannada: 'Alli', english: 'There', pronunciation: 'UL-lee'),
          Word(kannada: 'Akkade', english: 'Over there', pronunciation: 'UK-kuh-day'),
        ]),
      ],
    ),

    // Unit 11: Pronouns
    LessonUnit(
      id: 'unit_11', title: 'I, You, We', subtitle: 'Personal pronouns', emoji: '👥', order: 11,
      lessons: [
        Lesson(id: 'l11_1', title: 'I & You', description: 'Self and other', xpReward: 10, words: [
          Word(kannada: 'Naanu', english: 'I', pronunciation: 'NAH-noo'),
          Word(kannada: 'Neevu', english: 'You (formal)', pronunciation: 'NEE-voo'),
          Word(kannada: 'Neenu', english: 'You (casual)', pronunciation: 'NEE-noo'),
          Word(kannada: 'Naavu', english: 'We', pronunciation: 'NAH-voo'),
        ]),
        Lesson(id: 'l11_2', title: 'He & She', description: 'Third person', xpReward: 10, words: [
          Word(kannada: 'Avanu', english: 'He', pronunciation: 'AH-vuh-noo'),
          Word(kannada: 'Avalu', english: 'She', pronunciation: 'AH-vuh-loo'),
          Word(kannada: 'Avaru', english: 'They/He/She (formal)', pronunciation: 'AH-vuh-roo'),
          Word(kannada: 'Ivaru', english: 'This person', pronunciation: 'EE-vuh-roo'),
        ]),
        Lesson(id: 'l11_3', title: 'My & Your', description: 'Possessives', xpReward: 10, words: [
          Word(kannada: 'Nanna', english: 'My', pronunciation: 'NUN-nuh'),
          Word(kannada: 'Nimma', english: 'Your (formal)', pronunciation: 'NIM-muh'),
          Word(kannada: 'Ninna', english: 'Your (casual)', pronunciation: 'NIN-nuh'),
          Word(kannada: 'Avara', english: 'His/Her/Their', pronunciation: 'AH-vuh-ruh'),
        ]),
      ],
    ),

    // Unit 12: Introductions
    LessonUnit(
      id: 'unit_12', title: 'Introductions', subtitle: 'Meeting people', emoji: '🤝', order: 12,
      lessons: [
        Lesson(id: 'l12_1', title: 'Your Name', description: 'Name questions', xpReward: 10, words: [
          Word(kannada: 'Nimma hesaru enu', english: 'What is your name', pronunciation: 'NIM-muh HAY-suh-roo AY-noo'),
          Word(kannada: 'Nanna hesaru', english: 'My name is', pronunciation: 'NUN-nuh HAY-suh-roo'),
          Word(kannada: 'Hesaru', english: 'Name', pronunciation: 'HAY-suh-roo'),
        ]),
        Lesson(id: 'l12_2', title: 'Nice to Meet', description: 'Meeting phrases', xpReward: 10, words: [
          Word(kannada: 'Nimmanna bhetiyaagi khushi', english: 'Nice to meet you', pronunciation: 'nim-MUN-nuh BAY-tee-yah-gee KOO-shee'),
          Word(kannada: 'Khushi aaytu', english: 'Happy to meet', pronunciation: 'KOO-shee AH-yee-too'),
        ]),
        Lesson(id: 'l12_3', title: 'Where From', description: 'Origin questions', xpReward: 10, words: [
          Word(kannada: 'Neevu ellinda', english: 'Where are you from', pronunciation: 'NEE-voo el-LIN-duh'),
          Word(kannada: 'Naanu ... inda', english: 'I am from ...', pronunciation: 'NAH-noo ... IN-duh'),
          Word(kannada: 'Ooru', english: 'Town/Place', pronunciation: 'OO-roo'),
        ]),
      ],
    ),
  ];

  // ============ MONTH 2: DAILY LIFE (Units 13-24) ============
  static final month2Units = [
    // Unit 13: Rice & Staples
    LessonUnit(
      id: 'unit_13', title: 'Rice & Staples', subtitle: 'Main foods', emoji: '🍚', order: 13,
      lessons: [
        Lesson(id: 'l13_1', title: 'Rice Dishes', description: 'Rice foods', xpReward: 10, words: [
          Word(kannada: 'Anna', english: 'Rice', pronunciation: 'UN-nuh'),
          Word(kannada: 'Chitranna', english: 'Lemon rice', pronunciation: 'chit-RUN-nuh'),
          Word(kannada: 'Bisibelebath', english: 'Spicy dal rice', pronunciation: 'bee-see-BAY-lay-baath'),
          Word(kannada: 'Puliyogare', english: 'Tamarind rice', pronunciation: 'poo-lee-YOH-guh-ray'),
        ]),
        Lesson(id: 'l13_2', title: 'Bread', description: 'Bread types', xpReward: 10, words: [
          Word(kannada: 'Rotti', english: 'Roti/Flatbread', pronunciation: 'ROT-tee'),
          Word(kannada: 'Chapati', english: 'Chapati', pronunciation: 'chuh-PAH-tee'),
          Word(kannada: 'Dosa', english: 'Dosa', pronunciation: 'DOH-suh'),
          Word(kannada: 'Idli', english: 'Idli', pronunciation: 'ID-lee'),
        ]),
        Lesson(id: 'l13_3', title: 'Dal & Curry', description: 'Curries', xpReward: 10, words: [
          Word(kannada: 'Saaru', english: 'Rasam/Dal soup', pronunciation: 'SAA-roo'),
          Word(kannada: 'Sambar', english: 'Sambar', pronunciation: 'SAAM-bar'),
          Word(kannada: 'Palya', english: 'Vegetable curry', pronunciation: 'PUL-yuh'),
        ]),
      ],
    ),

    // Unit 14: Vegetables
    LessonUnit(
      id: 'unit_14', title: 'Vegetables', subtitle: 'Common veggies', emoji: '🥬', order: 14,
      lessons: [
        Lesson(id: 'l14_1', title: 'Common Veggies', description: 'Everyday vegetables', xpReward: 10, words: [
          Word(kannada: 'Aalugadde', english: 'Potato', pronunciation: 'AA-loo-gud-day'),
          Word(kannada: 'Eerulli', english: 'Onion', pronunciation: 'EE-roo-lee'),
          Word(kannada: 'Tomato', english: 'Tomato', pronunciation: 'toh-MAH-toh'),
          Word(kannada: 'Bende kayi', english: 'Okra', pronunciation: 'BEN-day KYE'),
        ]),
        Lesson(id: 'l14_2', title: 'Green Veggies', description: 'Leafy greens', xpReward: 10, words: [
          Word(kannada: 'Soppu', english: 'Greens/Leaves', pronunciation: 'SOP-poo'),
          Word(kannada: 'Soutekayi', english: 'Cucumber', pronunciation: 'SOW-tay-kye'),
          Word(kannada: 'Badne kayi', english: 'Brinjal', pronunciation: 'BAAD-nay KYE'),
          Word(kannada: 'Kosu', english: 'Cabbage', pronunciation: 'KOH-soo'),
        ]),
        Lesson(id: 'l14_3', title: 'More Veggies', description: 'Other vegetables', xpReward: 10, words: [
          Word(kannada: 'Carrot', english: 'Carrot', pronunciation: 'CARE-rot'),
          Word(kannada: 'Beans', english: 'Beans', pronunciation: 'beans'),
          Word(kannada: 'Hesaru kaalu', english: 'Green gram', pronunciation: 'HAY-suh-roo KAA-loo'),
        ]),
      ],
    ),

    // Unit 15: Fruits
    LessonUnit(
      id: 'unit_15', title: 'Fruits', subtitle: 'Common fruits', emoji: '🍎', order: 15,
      lessons: [
        Lesson(id: 'l15_1', title: 'Sweet Fruits', description: 'Popular fruits', xpReward: 10, words: [
          Word(kannada: 'Maavinhannu', english: 'Mango', pronunciation: 'MAA-vin-HUN-noo'),
          Word(kannada: 'Baalehannu', english: 'Banana', pronunciation: 'BAA-lay-HUN-noo'),
          Word(kannada: 'Sebe hannu', english: 'Apple', pronunciation: 'SAY-bay HUN-noo'),
          Word(kannada: 'Drakshi', english: 'Grapes', pronunciation: 'DRUK-shee'),
        ]),
        Lesson(id: 'l15_2', title: 'Citrus', description: 'Sour fruits', xpReward: 10, words: [
          Word(kannada: 'Kittale hannu', english: 'Orange', pronunciation: 'KIT-tuh-lay HUN-noo'),
          Word(kannada: 'Nimbe hannu', english: 'Lemon', pronunciation: 'NIM-bay HUN-noo'),
          Word(kannada: 'Mousambi', english: 'Sweet lime', pronunciation: 'mow-SUM-bee'),
        ]),
        Lesson(id: 'l15_3', title: 'More Fruits', description: 'Other fruits', xpReward: 10, words: [
          Word(kannada: 'Pappayi', english: 'Papaya', pronunciation: 'puh-PIE'),
          Word(kannada: 'Sapota', english: 'Sapota', pronunciation: 'suh-POH-tuh'),
          Word(kannada: 'Daanimbe', english: 'Pomegranate', pronunciation: 'DAA-nim-bay'),
        ]),
      ],
    ),

    // Unit 16: Drinks
    LessonUnit(
      id: 'unit_16', title: 'Drinks', subtitle: 'Beverages', emoji: '☕', order: 16,
      lessons: [
        Lesson(id: 'l16_1', title: 'Hot Drinks', description: 'Tea and coffee', xpReward: 10, words: [
          Word(kannada: 'Chaaha', english: 'Tea', pronunciation: 'CHAA-huh'),
          Word(kannada: 'Kaapi', english: 'Coffee', pronunciation: 'KAA-pee'),
          Word(kannada: 'Haalu', english: 'Milk', pronunciation: 'HAA-loo'),
          Word(kannada: 'Bisi neeru', english: 'Hot water', pronunciation: 'BEE-see NEE-roo'),
        ]),
        Lesson(id: 'l16_2', title: 'Cold Drinks', description: 'Cool beverages', xpReward: 10, words: [
          Word(kannada: 'Neeru', english: 'Water', pronunciation: 'NEE-roo'),
          Word(kannada: 'Thanda neeru', english: 'Cold water', pronunciation: 'THUN-duh NEE-roo'),
          Word(kannada: 'Juice', english: 'Juice', pronunciation: 'joose'),
          Word(kannada: 'Elaneer', english: 'Coconut water', pronunciation: 'AY-luh-neer'),
        ]),
        Lesson(id: 'l16_3', title: 'More Drinks', description: 'Other beverages', xpReward: 10, words: [
          Word(kannada: 'Majjige', english: 'Buttermilk', pronunciation: 'MUJ-jee-gay'),
          Word(kannada: 'Lassi', english: 'Lassi', pronunciation: 'LUS-see'),
          Word(kannada: 'Sherbet', english: 'Sherbet', pronunciation: 'SHER-bet'),
        ]),
      ],
    ),

    // Unit 17: Tastes
    LessonUnit(
      id: 'unit_17', title: 'Tastes', subtitle: 'Food flavors', emoji: '😋', order: 17,
      lessons: [
        Lesson(id: 'l17_1', title: 'Basic Tastes', description: 'Main flavors', xpReward: 10, words: [
          Word(kannada: 'Sihi', english: 'Sweet', pronunciation: 'SEE-hee'),
          Word(kannada: 'Khara', english: 'Spicy', pronunciation: 'KUH-ruh'),
          Word(kannada: 'Huli', english: 'Sour', pronunciation: 'HOO-lee'),
          Word(kannada: 'Uppu', english: 'Salty', pronunciation: 'OOP-poo'),
        ]),
        Lesson(id: 'l17_2', title: 'More Tastes', description: 'Other flavors', xpReward: 10, words: [
          Word(kannada: 'Kaidu', english: 'Bitter', pronunciation: 'KYE-doo'),
          Word(kannada: 'Ruchi', english: 'Tasty', pronunciation: 'ROO-chee'),
          Word(kannada: 'Thumba ruchi', english: 'Very tasty', pronunciation: 'THOOM-buh ROO-chee'),
        ]),
        Lesson(id: 'l17_3', title: 'Food Quality', description: 'Food descriptions', xpReward: 10, words: [
          Word(kannada: 'Bisi', english: 'Hot', pronunciation: 'BEE-see'),
          Word(kannada: 'Thanda', english: 'Cold', pronunciation: 'THUN-duh'),
          Word(kannada: 'Fresh', english: 'Fresh', pronunciation: 'fresh'),
        ]),
      ],
    ),

    // Unit 18: Restaurant
    LessonUnit(
      id: 'unit_18', title: 'Restaurant', subtitle: 'Ordering food', emoji: '🍽️', order: 18,
      lessons: [
        Lesson(id: 'l18_1', title: 'Order Words', description: 'Ordering food', xpReward: 10, words: [
          Word(kannada: 'Menu', english: 'Menu', pronunciation: 'MEN-oo'),
          Word(kannada: 'Order', english: 'Order', pronunciation: 'OR-der'),
          Word(kannada: 'Bill', english: 'Bill', pronunciation: 'bill'),
          Word(kannada: 'Oota', english: 'Meal/Food', pronunciation: 'OO-tuh'),
        ]),
        Lesson(id: 'l18_2', title: 'Meal Times', description: 'Meal words', xpReward: 10, words: [
          Word(kannada: 'Tindi', english: 'Snack/Breakfast', pronunciation: 'TIN-dee'),
          Word(kannada: 'Madhyahna oota', english: 'Lunch', pronunciation: 'mud-YAH-nuh OO-tuh'),
          Word(kannada: 'Raatri oota', english: 'Dinner', pronunciation: 'RAA-tree OO-tuh'),
        ]),
        Lesson(id: 'l18_3', title: 'Restaurant Phrases', description: 'Useful phrases', xpReward: 10, words: [
          Word(kannada: 'Enu beku', english: 'What do you want', pronunciation: 'AY-noo BAY-koo'),
          Word(kannada: 'Idu kodi', english: 'Give this', pronunciation: 'EE-doo KOH-dee'),
          Word(kannada: 'Bill kodi', english: 'Give bill', pronunciation: 'bill KOH-dee'),
        ]),
      ],
    ),

    // Unit 19: Directions Basic
    LessonUnit(
      id: 'unit_19', title: 'Directions', subtitle: 'Left and right', emoji: '🧭', order: 19,
      lessons: [
        Lesson(id: 'l19_1', title: 'Left & Right', description: 'Basic directions', xpReward: 10, words: [
          Word(kannada: 'Edakke', english: 'To the left', pronunciation: 'AY-duk-kay'),
          Word(kannada: 'Balakke', english: 'To the right', pronunciation: 'BUH-luk-kay'),
          Word(kannada: 'Nera', english: 'Straight', pronunciation: 'NAY-ruh'),
          Word(kannada: 'Tirugi', english: 'Turn', pronunciation: 'tee-ROO-gee'),
        ]),
        Lesson(id: 'l19_2', title: 'Front & Back', description: 'Position words', xpReward: 10, words: [
          Word(kannada: 'Munde', english: 'In front', pronunciation: 'MOON-day'),
          Word(kannada: 'Hinde', english: 'Behind', pronunciation: 'HIN-day'),
          Word(kannada: 'Mele', english: 'Above', pronunciation: 'MAY-lay'),
          Word(kannada: 'Kelage', english: 'Below', pronunciation: 'KAY-luh-gay'),
        ]),
        Lesson(id: 'l19_3', title: 'Near & Far', description: 'Distance', xpReward: 10, words: [
          Word(kannada: 'Hattira', english: 'Near', pronunciation: 'HUT-tee-ruh'),
          Word(kannada: 'Doora', english: 'Far', pronunciation: 'DOO-ruh'),
          Word(kannada: 'Eshtu doora', english: 'How far', pronunciation: 'ESH-too DOO-ruh'),
        ]),
      ],
    ),

    // Unit 20: Places
    LessonUnit(
      id: 'unit_20', title: 'Places', subtitle: 'Common locations', emoji: '🏪', order: 20,
      lessons: [
        Lesson(id: 'l20_1', title: 'Shops', description: 'Shopping places', xpReward: 10, words: [
          Word(kannada: 'Angadi', english: 'Shop', pronunciation: 'UN-guh-dee'),
          Word(kannada: 'Market', english: 'Market', pronunciation: 'MAR-ket'),
          Word(kannada: 'Mall', english: 'Mall', pronunciation: 'mall'),
          Word(kannada: 'Kirana angadi', english: 'Grocery shop', pronunciation: 'kee-RAA-nuh UN-guh-dee'),
        ]),
        Lesson(id: 'l20_2', title: 'Services', description: 'Service places', xpReward: 10, words: [
          Word(kannada: 'Bank', english: 'Bank', pronunciation: 'bank'),
          Word(kannada: 'Aspathre', english: 'Hospital', pronunciation: 'us-PUH-tray'),
          Word(kannada: 'Police station', english: 'Police station', pronunciation: 'poh-LEES STAY-shun'),
          Word(kannada: 'Post office', english: 'Post office', pronunciation: 'post OFF-iss'),
        ]),
        Lesson(id: 'l20_3', title: 'Public Places', description: 'Common places', xpReward: 10, words: [
          Word(kannada: 'Bus stand', english: 'Bus stand', pronunciation: 'bus STAND'),
          Word(kannada: 'Railway station', english: 'Railway station', pronunciation: 'RAIL-way STAY-shun'),
          Word(kannada: 'Airport', english: 'Airport', pronunciation: 'AIR-port'),
        ]),
      ],
    ),

    // Unit 21: Transport
    LessonUnit(
      id: 'unit_21', title: 'Transport', subtitle: 'Getting around', emoji: '🚌', order: 21,
      lessons: [
        Lesson(id: 'l21_1', title: 'Vehicles', description: 'Transport types', xpReward: 10, words: [
          Word(kannada: 'Bus', english: 'Bus', pronunciation: 'bus'),
          Word(kannada: 'Auto', english: 'Auto rickshaw', pronunciation: 'AW-toh'),
          Word(kannada: 'Taxi', english: 'Taxi', pronunciation: 'TAK-see'),
          Word(kannada: 'Train', english: 'Train', pronunciation: 'train'),
        ]),
        Lesson(id: 'l21_2', title: 'Travel Words', description: 'Travel terms', xpReward: 10, words: [
          Word(kannada: 'Ticket', english: 'Ticket', pronunciation: 'TIK-et'),
          Word(kannada: 'Stop', english: 'Stop', pronunciation: 'stop'),
          Word(kannada: 'Nillisi', english: 'Please stop', pronunciation: 'nil-LEE-see'),
          Word(kannada: 'Hogi', english: 'Go', pronunciation: 'HOH-gee'),
        ]),
        Lesson(id: 'l21_3', title: 'Travel Phrases', description: 'Useful phrases', xpReward: 10, words: [
          Word(kannada: '... ge hogbeku', english: 'Need to go to...', pronunciation: '... gay HOG-bay-koo'),
          Word(kannada: 'Eshtu aagutte', english: 'How much will it cost', pronunciation: 'ESH-too AA-goo-tay'),
          Word(kannada: 'Illi nillisi', english: 'Stop here', pronunciation: 'IL-lee nil-LEE-see'),
        ]),
      ],
    ),

    // Unit 22: Asking Directions
    LessonUnit(
      id: 'unit_22', title: 'Ask Directions', subtitle: 'Finding places', emoji: '🗺️', order: 22,
      lessons: [
        Lesson(id: 'l22_1', title: 'Where Is', description: 'Location questions', xpReward: 10, words: [
          Word(kannada: '... ellide', english: 'Where is...', pronunciation: '... el-LEE-day'),
          Word(kannada: 'Hege hogodu', english: 'How to go', pronunciation: 'HAY-gay HOH-goh-doo'),
          Word(kannada: 'Daari', english: 'Way/Road', pronunciation: 'DAA-ree'),
        ]),
        Lesson(id: 'l22_2', title: 'Getting Help', description: 'Asking for help', xpReward: 10, words: [
          Word(kannada: 'Dayavittu heliri', english: 'Please tell me', pronunciation: 'duh-yuh-VIT-too HAY-lee-ree'),
          Word(kannada: 'Naanu hosa', english: 'I am new', pronunciation: 'NAH-noo HOH-suh'),
          Word(kannada: 'Daari gottilla', english: 'Dont know the way', pronunciation: 'DAA-ree GOT-til-luh'),
        ]),
        Lesson(id: 'l22_3', title: 'Landmarks', description: 'Reference points', xpReward: 10, words: [
          Word(kannada: 'Signal', english: 'Traffic light', pronunciation: 'SIG-nal'),
          Word(kannada: 'Circle', english: 'Roundabout', pronunciation: 'SER-kul'),
          Word(kannada: 'Cross', english: 'Intersection', pronunciation: 'cross'),
        ]),
      ],
    ),

    // Unit 23: Shopping
    LessonUnit(
      id: 'unit_23', title: 'Shopping', subtitle: 'Buying things', emoji: '🛒', order: 23,
      lessons: [
        Lesson(id: 'l23_1', title: 'Buy & Sell', description: 'Transaction words', xpReward: 10, words: [
          Word(kannada: 'Kodee', english: 'Give', pronunciation: 'KOH-dee'),
          Word(kannada: 'Beku', english: 'Want/Need', pronunciation: 'BAY-koo'),
          Word(kannada: 'Thago', english: 'Take', pronunciation: 'THUH-goh'),
          Word(kannada: 'Kharidi', english: 'Purchase', pronunciation: 'kuh-REE-dee'),
        ]),
        Lesson(id: 'l23_2', title: 'Price Talk', description: 'Negotiating', xpReward: 10, words: [
          Word(kannada: 'Bele eshtu', english: 'How much is the price', pronunciation: 'BAY-lay ESH-too'),
          Word(kannada: 'Tumba jaasti', english: 'Too expensive', pronunciation: 'THOOM-buh JAA-stee'),
          Word(kannada: 'Kammi maadi', english: 'Reduce it', pronunciation: 'KUM-mee MAA-dee'),
        ]),
        Lesson(id: 'l23_3', title: 'Size & Color', description: 'Product details', xpReward: 10, words: [
          Word(kannada: 'Dodda', english: 'Big', pronunciation: 'DOD-duh'),
          Word(kannada: 'Chikka', english: 'Small', pronunciation: 'CHIK-kuh'),
          Word(kannada: 'Banna', english: 'Color', pronunciation: 'BUN-nuh'),
        ]),
      ],
    ),

    // Unit 24: Colors
    LessonUnit(
      id: 'unit_24', title: 'Colors', subtitle: 'Basic colors', emoji: '🎨', order: 24,
      lessons: [
        Lesson(id: 'l24_1', title: 'Primary Colors', description: 'Main colors', xpReward: 10, words: [
          Word(kannada: 'Kempu', english: 'Red', pronunciation: 'KEM-poo'),
          Word(kannada: 'Neeli', english: 'Blue', pronunciation: 'NEE-lee'),
          Word(kannada: 'Hasiru', english: 'Green', pronunciation: 'HUH-see-roo'),
          Word(kannada: 'Haladi', english: 'Yellow', pronunciation: 'HUH-luh-dee'),
        ]),
        Lesson(id: 'l24_2', title: 'More Colors', description: 'Other colors', xpReward: 10, words: [
          Word(kannada: 'Bili', english: 'White', pronunciation: 'BEE-lee'),
          Word(kannada: 'Kappu', english: 'Black', pronunciation: 'KUP-poo'),
          Word(kannada: 'Kittale', english: 'Orange', pronunciation: 'KIT-tuh-lay'),
          Word(kannada: 'Neerali', english: 'Purple', pronunciation: 'nee-RUH-lee'),
        ]),
        Lesson(id: 'l24_3', title: 'Color Talk', description: 'Using colors', xpReward: 10, words: [
          Word(kannada: 'Banna yavudu', english: 'What color', pronunciation: 'BUN-nuh YAH-voo-doo'),
          Word(kannada: '... banna', english: '... color', pronunciation: '... BUN-nuh'),
          Word(kannada: 'Chennaagide', english: 'Looks nice', pronunciation: 'chen-NAA-gee-day'),
        ]),
      ],
    ),
  ];
  
  // ============ MONTH 3: SOCIAL & PRACTICAL (Units 25-36) ============
  static final month3Units = [
    // Unit 25: Family Core
    LessonUnit(
      id: 'unit_25', title: 'Family Core', subtitle: 'Immediate family', emoji: '👨‍👩‍👧', order: 25,
      lessons: [
        Lesson(id: 'l25_1', title: 'Parents', description: 'Mom and Dad', xpReward: 10, words: [
          Word(kannada: 'Appa', english: 'Father', pronunciation: 'UP-puh'),
          Word(kannada: 'Amma', english: 'Mother', pronunciation: 'UM-muh'),
          Word(kannada: 'Makkalu', english: 'Children', pronunciation: 'MUK-kuh-loo'),
          Word(kannada: 'Kudumba', english: 'Family', pronunciation: 'koo-DOOM-buh'),
        ]),
        Lesson(id: 'l25_2', title: 'Siblings', description: 'Brothers and sisters', xpReward: 10, words: [
          Word(kannada: 'Anna', english: 'Elder brother', pronunciation: 'UN-nuh'),
          Word(kannada: 'Akka', english: 'Elder sister', pronunciation: 'UK-kuh'),
          Word(kannada: 'Tamma', english: 'Younger brother', pronunciation: 'THUM-muh'),
          Word(kannada: 'Tangi', english: 'Younger sister', pronunciation: 'THUN-gee'),
        ]),
        Lesson(id: 'l25_3', title: 'Spouse', description: 'Husband and wife', xpReward: 10, words: [
          Word(kannada: 'Ganda', english: 'Husband', pronunciation: 'GUN-duh'),
          Word(kannada: 'Hendti', english: 'Wife', pronunciation: 'HEN-d-tee'),
          Word(kannada: 'Maduve', english: 'Marriage', pronunciation: 'MUH-doo-vay'),
        ]),
      ],
    ),

    // Unit 26: Family Extended
    LessonUnit(
      id: 'unit_26', title: 'Extended Family', subtitle: 'Relatives', emoji: '👴', order: 26,
      lessons: [
        Lesson(id: 'l26_1', title: 'Grandparents', description: 'Grandpa and Grandma', xpReward: 10, words: [
          Word(kannada: 'Ajja', english: 'Grandfather', pronunciation: 'UJ-juh'),
          Word(kannada: 'Ajji', english: 'Grandmother', pronunciation: 'UJ-jee'),
          Word(kannada: 'Mommagalu', english: 'Grandson', pronunciation: 'MOM-muh-guh-loo'),
          Word(kannada: 'Mommakalu', english: 'Grandchildren', pronunciation: 'MOM-muh-kuh-loo'),
        ]),
        Lesson(id: 'l26_2', title: 'Uncle & Aunt', description: 'Uncles and aunts', xpReward: 10, words: [
          Word(kannada: 'Maava', english: 'Uncle (maternal)', pronunciation: 'MAA-vuh'),
          Word(kannada: 'Atthe', english: 'Aunt (maternal)', pronunciation: 'UT-thay'),
          Word(kannada: 'Chikkappa', english: 'Uncle (paternal younger)', pronunciation: 'CHIK-kup-puh'),
          Word(kannada: 'Chikkamma', english: 'Aunt (paternal younger)', pronunciation: 'CHIK-kum-muh'),
        ]),
        Lesson(id: 'l26_3', title: 'Cousins', description: 'Cousins and relatives', xpReward: 10, words: [
          Word(kannada: 'Banda', english: 'Relative', pronunciation: 'BUN-duh'),
          Word(kannada: 'Shodara', english: 'Brother/Cousin', pronunciation: 'SHOH-duh-ruh'),
          Word(kannada: 'Sodari', english: 'Sister/Cousin', pronunciation: 'SOH-duh-ree'),
        ]),
      ],
    ),

    // Unit 27: Time Words
    LessonUnit(
      id: 'unit_27', title: 'Time Words', subtitle: 'When and how long', emoji: '⏰', order: 27,
      lessons: [
        Lesson(id: 'l27_1', title: 'Now & Later', description: 'Time expressions', xpReward: 10, words: [
          Word(kannada: 'Eega', english: 'Now', pronunciation: 'EE-guh'),
          Word(kannada: 'Amele', english: 'Later', pronunciation: 'AH-may-lay'),
          Word(kannada: 'Bega', english: 'Soon/Early', pronunciation: 'BAY-guh'),
          Word(kannada: 'Thado', english: 'Late', pronunciation: 'THUH-doh'),
        ]),
        Lesson(id: 'l27_2', title: 'Day Parts', description: 'Parts of day', xpReward: 10, words: [
          Word(kannada: 'Bellige', english: 'Morning', pronunciation: 'BEL-lee-gay'),
          Word(kannada: 'Madhyahna', english: 'Afternoon', pronunciation: 'mud-YAH-nuh'),
          Word(kannada: 'Sanje', english: 'Evening', pronunciation: 'SUN-jay'),
          Word(kannada: 'Raatri', english: 'Night', pronunciation: 'RAA-tree'),
        ]),
        Lesson(id: 'l27_3', title: 'Duration', description: 'Time length', xpReward: 10, words: [
          Word(kannada: 'Gante', english: 'Hour', pronunciation: 'GUN-tay'),
          Word(kannada: 'Nimisha', english: 'Minute', pronunciation: 'nee-MEE-shuh'),
          Word(kannada: 'Samaya', english: 'Time', pronunciation: 'suh-MY-uh'),
        ]),
      ],
    ),

    // Unit 28: Days of Week
    LessonUnit(
      id: 'unit_28', title: 'Days of Week', subtitle: 'Weekly schedule', emoji: '📅', order: 28,
      lessons: [
        Lesson(id: 'l28_1', title: 'Mon-Wed', description: 'First days', xpReward: 10, words: [
          Word(kannada: 'Somavaara', english: 'Monday', pronunciation: 'SOH-muh-VAA-ruh'),
          Word(kannada: 'Mangalavaara', english: 'Tuesday', pronunciation: 'mun-guh-luh-VAA-ruh'),
          Word(kannada: 'Budhavaara', english: 'Wednesday', pronunciation: 'boo-dhuh-VAA-ruh'),
        ]),
        Lesson(id: 'l28_2', title: 'Thu-Sat', description: 'Middle days', xpReward: 10, words: [
          Word(kannada: 'Guruvaara', english: 'Thursday', pronunciation: 'goo-roo-VAA-ruh'),
          Word(kannada: 'Shukravaara', english: 'Friday', pronunciation: 'shook-ruh-VAA-ruh'),
          Word(kannada: 'Shanivaara', english: 'Saturday', pronunciation: 'shuh-nee-VAA-ruh'),
        ]),
        Lesson(id: 'l28_3', title: 'Sunday', description: 'Weekend', xpReward: 10, words: [
          Word(kannada: 'Bhanuvaara', english: 'Sunday', pronunciation: 'BHAA-noo-VAA-ruh'),
          Word(kannada: 'Vaara', english: 'Week', pronunciation: 'VAA-ruh'),
          Word(kannada: 'Dina', english: 'Day', pronunciation: 'DEE-nuh'),
        ]),
      ],
    ),

    // Unit 29: Time Telling
    LessonUnit(
      id: 'unit_29', title: 'Telling Time', subtitle: 'Clock reading', emoji: '🕐', order: 29,
      lessons: [
        Lesson(id: 'l29_1', title: 'Clock Words', description: 'Time telling', xpReward: 10, words: [
          Word(kannada: 'Gante', english: 'Hour/OClock', pronunciation: 'GUN-tay'),
          Word(kannada: 'Eshtu gante', english: 'What time', pronunciation: 'ESH-too GUN-tay'),
          Word(kannada: 'Aarda', english: 'Half', pronunciation: 'AAR-duh'),
        ]),
        Lesson(id: 'l29_2', title: 'Specific Times', description: 'Time examples', xpReward: 10, words: [
          Word(kannada: 'Ondu gante', english: 'One oclock', pronunciation: 'ON-doo GUN-tay'),
          Word(kannada: 'Eradu gante', english: 'Two oclock', pronunciation: 'AY-ruh-doo GUN-tay'),
          Word(kannada: 'Hattu gante', english: 'Ten oclock', pronunciation: 'HUT-too GUN-tay'),
        ]),
        Lesson(id: 'l29_3', title: 'Time Phrases', description: 'Common phrases', xpReward: 10, words: [
          Word(kannada: 'Samaya aaytu', english: 'Time is up', pronunciation: 'suh-MY-uh AH-yee-too'),
          Word(kannada: 'Thado aaytu', english: 'Its late', pronunciation: 'THUH-doh AH-yee-too'),
        ]),
      ],
    ),

    // Unit 30: Basic Verbs
    LessonUnit(
      id: 'unit_30', title: 'Basic Verbs', subtitle: 'Action words', emoji: '🏃', order: 30,
      lessons: [
        Lesson(id: 'l30_1', title: 'Movement', description: 'Go and come', xpReward: 10, words: [
          Word(kannada: 'Hogu', english: 'Go', pronunciation: 'HOH-goo'),
          Word(kannada: 'Baa', english: 'Come', pronunciation: 'BAA'),
          Word(kannada: 'Nodu', english: 'See/Look', pronunciation: 'NOH-doo'),
          Word(kannada: 'Nadee', english: 'Walk', pronunciation: 'nuh-DEE'),
        ]),
        Lesson(id: 'l30_2', title: 'Eating', description: 'Food verbs', xpReward: 10, words: [
          Word(kannada: 'Tinnu', english: 'Eat', pronunciation: 'TIN-noo'),
          Word(kannada: 'Kudi', english: 'Drink', pronunciation: 'KOO-dee'),
          Word(kannada: 'Aadu', english: 'Cook', pronunciation: 'AA-doo'),
        ]),
        Lesson(id: 'l30_3', title: 'Actions', description: 'Common actions', xpReward: 10, words: [
          Word(kannada: 'Maadu', english: 'Do/Make', pronunciation: 'MAA-doo'),
          Word(kannada: 'Kodu', english: 'Give', pronunciation: 'KOH-doo'),
          Word(kannada: 'Thago', english: 'Take', pronunciation: 'THUH-goh'),
        ]),
      ],
    ),

    // Unit 31: More Verbs
    LessonUnit(
      id: 'unit_31', title: 'More Verbs', subtitle: 'More actions', emoji: '💪', order: 31,
      lessons: [
        Lesson(id: 'l31_1', title: 'Speaking', description: 'Talk verbs', xpReward: 10, words: [
          Word(kannada: 'Helu', english: 'Tell/Say', pronunciation: 'HAY-loo'),
          Word(kannada: 'Kelu', english: 'Listen/Ask', pronunciation: 'KAY-loo'),
          Word(kannada: 'Maathaadu', english: 'Speak/Talk', pronunciation: 'MAA-thaa-doo'),
        ]),
        Lesson(id: 'l31_2', title: 'Learning', description: 'Study verbs', xpReward: 10, words: [
          Word(kannada: 'Kalituko', english: 'Learn', pronunciation: 'kuh-lee-TOO-koh'),
          Word(kannada: 'Odi', english: 'Read', pronunciation: 'OH-dee'),
          Word(kannada: 'Bareyiri', english: 'Write', pronunciation: 'buh-RAY-yee-ree'),
        ]),
        Lesson(id: 'l31_3', title: 'Living', description: 'Life verbs', xpReward: 10, words: [
          Word(kannada: 'Irtu', english: 'Stay/Be', pronunciation: 'EER-too'),
          Word(kannada: 'Malgu', english: 'Sleep', pronunciation: 'MUL-goo'),
          Word(kannada: 'Yeddelu', english: 'Wake up', pronunciation: 'yed-DAY-loo'),
        ]),
      ],
    ),

    // Unit 32: Body Parts
    LessonUnit(
      id: 'unit_32', title: 'Body Parts', subtitle: 'Human body', emoji: '🦶', order: 32,
      lessons: [
        Lesson(id: 'l32_1', title: 'Head', description: 'Face parts', xpReward: 10, words: [
          Word(kannada: 'Tale', english: 'Head', pronunciation: 'TUH-lay'),
          Word(kannada: 'Kannu', english: 'Eye', pronunciation: 'KUN-noo'),
          Word(kannada: 'Moogu', english: 'Nose', pronunciation: 'MOO-goo'),
          Word(kannada: 'Baayi', english: 'Mouth', pronunciation: 'BAA-yee'),
        ]),
        Lesson(id: 'l32_2', title: 'Body', description: 'Body parts', xpReward: 10, words: [
          Word(kannada: 'Kai', english: 'Hand', pronunciation: 'KYE'),
          Word(kannada: 'Kaalu', english: 'Leg/Foot', pronunciation: 'KAA-loo'),
          Word(kannada: 'Hotte', english: 'Stomach', pronunciation: 'HOT-tay'),
          Word(kannada: 'Benna', english: 'Back', pronunciation: 'BEN-nuh'),
        ]),
        Lesson(id: 'l32_3', title: 'More Parts', description: 'Other parts', xpReward: 10, words: [
          Word(kannada: 'Kivi', english: 'Ear', pronunciation: 'KEE-vee'),
          Word(kannada: 'Hallu', english: 'Teeth', pronunciation: 'HUL-loo'),
          Word(kannada: 'Koodalu', english: 'Hair', pronunciation: 'KOO-duh-loo'),
        ]),
      ],
    ),

    // Unit 33: Feelings
    LessonUnit(
      id: 'unit_33', title: 'Feelings', subtitle: 'Emotions', emoji: '😊', order: 33,
      lessons: [
        Lesson(id: 'l33_1', title: 'Happy & Sad', description: 'Basic emotions', xpReward: 10, words: [
          Word(kannada: 'Khushi', english: 'Happy', pronunciation: 'KOO-shee'),
          Word(kannada: 'Dukha', english: 'Sad', pronunciation: 'DOO-kuh'),
          Word(kannada: 'Chennaagide', english: 'Im fine', pronunciation: 'chen-NAA-gee-day'),
          Word(kannada: 'Saaku', english: 'Enough/Tired', pronunciation: 'SAA-koo'),
        ]),
        Lesson(id: 'l33_2', title: 'Need & Want', description: 'Physical needs', xpReward: 10, words: [
          Word(kannada: 'Hasivu', english: 'Hungry', pronunciation: 'HUH-see-voo'),
          Word(kannada: 'Baayarike', english: 'Thirsty', pronunciation: 'BAA-yuh-ree-kay'),
          Word(kannada: 'Nidde', english: 'Sleepy', pronunciation: 'NID-day'),
        ]),
        Lesson(id: 'l33_3', title: 'Pain', description: 'Discomfort', xpReward: 10, words: [
          Word(kannada: 'Novu', english: 'Pain', pronunciation: 'NOH-voo'),
          Word(kannada: 'Tale novu', english: 'Headache', pronunciation: 'TUH-lay NOH-voo'),
          Word(kannada: 'Hotte novu', english: 'Stomach ache', pronunciation: 'HOT-tay NOH-voo'),
        ]),
      ],
    ),

    // Unit 34: Weather
    LessonUnit(
      id: 'unit_34', title: 'Weather', subtitle: 'Climate words', emoji: '🌤️', order: 34,
      lessons: [
        Lesson(id: 'l34_1', title: 'Weather Types', description: 'Weather words', xpReward: 10, words: [
          Word(kannada: 'Male', english: 'Rain', pronunciation: 'MUH-lay'),
          Word(kannada: 'Bisilu', english: 'Sunlight/Hot', pronunciation: 'BEE-see-loo'),
          Word(kannada: 'Chali', english: 'Cold', pronunciation: 'CHUH-lee'),
          Word(kannada: 'Gaali', english: 'Wind', pronunciation: 'GAA-lee'),
        ]),
        Lesson(id: 'l34_2', title: 'Weather Talk', description: 'Describing weather', xpReward: 10, words: [
          Word(kannada: 'Tumba bisilu', english: 'Very hot', pronunciation: 'THOOM-buh BEE-see-loo'),
          Word(kannada: 'Male barthaade', english: 'Its raining', pronunciation: 'MUH-lay bar-THAA-day'),
          Word(kannada: 'Chali aagutte', english: 'Its cold', pronunciation: 'CHUH-lee AA-goo-tay'),
        ]),
        Lesson(id: 'l34_3', title: 'Seasons', description: 'Season words', xpReward: 10, words: [
          Word(kannada: 'Malegaala', english: 'Rainy season', pronunciation: 'MUH-lay-GAA-luh'),
          Word(kannada: 'Chali gaala', english: 'Winter', pronunciation: 'CHUH-lee GAA-luh'),
          Word(kannada: 'Bisilu gaala', english: 'Summer', pronunciation: 'BEE-see-loo GAA-luh'),
        ]),
      ],
    ),

    // Unit 35: Health
    LessonUnit(
      id: 'unit_35', title: 'Health', subtitle: 'Medical words', emoji: '🏥', order: 35,
      lessons: [
        Lesson(id: 'l35_1', title: 'Sick', description: 'Illness words', xpReward: 10, words: [
          Word(kannada: 'Jaara', english: 'Fever', pronunciation: 'JAA-ruh'),
          Word(kannada: 'Kemmu', english: 'Cough', pronunciation: 'KEM-moo'),
          Word(kannada: 'Neli', english: 'Cold/Flu', pronunciation: 'NAY-lee'),
          Word(kannada: 'Arogya', english: 'Health', pronunciation: 'aa-ROH-gyuh'),
        ]),
        Lesson(id: 'l35_2', title: 'Medical Help', description: 'Getting help', xpReward: 10, words: [
          Word(kannada: 'Doctor', english: 'Doctor', pronunciation: 'DOK-tor'),
          Word(kannada: 'Oushadhi', english: 'Medicine', pronunciation: 'ow-SHUH-dhee'),
          Word(kannada: 'Aspathre', english: 'Hospital', pronunciation: 'us-PUH-tray'),
        ]),
        Lesson(id: 'l35_3', title: 'Recovery', description: 'Getting better', xpReward: 10, words: [
          Word(kannada: 'Chennaagide', english: 'Im fine now', pronunciation: 'chen-NAA-gee-day'),
          Word(kannada: 'Gunavaagithe', english: 'Getting better', pronunciation: 'goo-nuh-VAA-gee-thay'),
          Word(kannada: 'Rest', english: 'Rest', pronunciation: 'rest'),
        ]),
      ],
    ),

    // Unit 36: Emergency
    LessonUnit(
      id: 'unit_36', title: 'Emergency', subtitle: 'Urgent help', emoji: '🚨', order: 36,
      lessons: [
        Lesson(id: 'l36_1', title: 'Help!', description: 'Emergency words', xpReward: 10, words: [
          Word(kannada: 'Sahaya', english: 'Help', pronunciation: 'suh-HAA-yuh'),
          Word(kannada: 'Sahaya beku', english: 'I need help', pronunciation: 'suh-HAA-yuh BAY-koo'),
          Word(kannada: 'Police', english: 'Police', pronunciation: 'poh-LEES'),
          Word(kannada: 'Ambulance', english: 'Ambulance', pronunciation: 'AM-byoo-lans'),
        ]),
        Lesson(id: 'l36_2', title: 'Danger', description: 'Warning words', xpReward: 10, words: [
          Word(kannada: 'Apaya', english: 'Danger', pronunciation: 'uh-PAA-yuh'),
          Word(kannada: 'Beega banni', english: 'Come quickly', pronunciation: 'BEE-guh BUN-nee'),
          Word(kannada: 'Accident', english: 'Accident', pronunciation: 'AK-see-dent'),
        ]),
        Lesson(id: 'l36_3', title: 'Contact', description: 'Getting contact', xpReward: 10, words: [
          Word(kannada: 'Phone number', english: 'Phone number', pronunciation: 'fone NUM-ber'),
          Word(kannada: 'Call maadi', english: 'Please call', pronunciation: 'call MAA-dee'),
          Word(kannada: 'Emergency', english: 'Emergency', pronunciation: 'ee-MER-jen-see'),
        ]),
      ],
    ),
  ];
}
