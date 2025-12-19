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

  // ============ MONTH 2: Placeholder ============
  static final month2Units = <LessonUnit>[];
  
  // ============ MONTH 3: Placeholder ============
  static final month3Units = <LessonUnit>[];
}
