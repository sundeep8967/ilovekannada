import 'lesson_models.dart';

/// Kannada vocabulary curriculum - 10 units focused on learning words
class KannadaCurriculum {
  static List<LessonUnit> getAllUnits() => [
    unit1Greetings,
    unit2Numbers,
    unit3Family,
    unit4Colors,
    unit5Food,
    unit6Drinks,
    unit7Body,
    unit8Animals,
    unit9Household,
    unit10Verbs,
  ];

  // ============================================================
  // UNIT 1: GREETINGS & BASIC WORDS
  // ============================================================
  static final unit1Greetings = LessonUnit(
    id: 'unit_1',
    title: 'Greetings',
    subtitle: '15 essential greeting words',
    emoji: '👋',
    order: 1,
    lessons: [
      Lesson(
        id: 'lesson_1_1',
        title: 'Hello & Goodbye',
        description: 'Basic greetings',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ನಮಸ್ಕಾರ', transliteration: 'Namaskara', english: 'Hello (formal)', pronunciation: 'nuh-mus-KAH-ruh'),
          VocabWord(kannada: 'ಹಲೋ', transliteration: 'Halo', english: 'Hello (casual)', pronunciation: 'huh-LOH'),
          VocabWord(kannada: 'ಹೋಗಿ ಬನ್ನಿ', transliteration: 'Hogi banni', english: 'Goodbye', pronunciation: 'HOH-gee BUN-nee'),
          VocabWord(kannada: 'ಮತ್ತೆ ಸಿಗೋಣ', transliteration: 'Matte sigona', english: 'See you again', pronunciation: 'MUT-tay see-GOH-nuh'),
          VocabWord(kannada: 'ಸ್ವಾಗತ', transliteration: 'Swagata', english: 'Welcome', pronunciation: 'SWAH-guh-tuh'),
        ],
      ),
      Lesson(
        id: 'lesson_1_2',
        title: 'Morning to Night',
        description: 'Time-based greetings',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಶುಭೋದಯ', transliteration: 'Shubhodaya', english: 'Good morning', pronunciation: 'shoo-BOH-duh-yuh'),
          VocabWord(kannada: 'ಶುಭ ಮಧ್ಯಾಹ್ನ', transliteration: 'Shubha madhyahna', english: 'Good afternoon', pronunciation: 'SHOO-buh mud-YAH-nuh'),
          VocabWord(kannada: 'ಶುಭ ಸಂಜೆ', transliteration: 'Shubha sanje', english: 'Good evening', pronunciation: 'SHOO-buh SUN-jay'),
          VocabWord(kannada: 'ಶುಭ ರಾತ್ರಿ', transliteration: 'Shubha ratri', english: 'Good night', pronunciation: 'SHOO-buh RAH-tree'),
        ],
      ),
      Lesson(
        id: 'lesson_1_3',
        title: 'Polite Words',
        description: 'Please, thank you, sorry',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಧನ್ಯವಾದ', transliteration: 'Dhanyavada', english: 'Thank you', pronunciation: 'dun-yuh-VAH-duh'),
          VocabWord(kannada: 'ದಯವಿಟ್ಟು', transliteration: 'Dayavittu', english: 'Please', pronunciation: 'duh-yuh-VIT-too'),
          VocabWord(kannada: 'ಕ್ಷಮಿಸಿ', transliteration: 'Kshamisi', english: 'Sorry', pronunciation: 'kshuh-MEE-see'),
          VocabWord(kannada: 'ಪರವಾಗಿಲ್ಲ', transliteration: 'Paravagilla', english: 'No problem', pronunciation: 'puh-ruh-VAH-gill-uh'),
          VocabWord(kannada: 'ಹೌದು', transliteration: 'Houdu', english: 'Yes', pronunciation: 'HOW-doo'),
          VocabWord(kannada: 'ಇಲ್ಲ', transliteration: 'Illa', english: 'No', pronunciation: 'IL-luh'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 2: NUMBERS
  // ============================================================
  static final unit2Numbers = LessonUnit(
    id: 'unit_2',
    title: 'Numbers',
    subtitle: 'Count from 1 to 100',
    emoji: '🔢',
    order: 2,
    lessons: [
      Lesson(
        id: 'lesson_2_1',
        title: 'Numbers 1-5',
        description: 'First five numbers',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಒಂದು', transliteration: 'Ondu', english: 'One (1)', pronunciation: 'ON-doo'),
          VocabWord(kannada: 'ಎರಡು', transliteration: 'Eradu', english: 'Two (2)', pronunciation: 'EH-ruh-doo'),
          VocabWord(kannada: 'ಮೂರು', transliteration: 'Mooru', english: 'Three (3)', pronunciation: 'MOO-roo'),
          VocabWord(kannada: 'ನಾಲ್ಕು', transliteration: 'Nalku', english: 'Four (4)', pronunciation: 'NAAL-koo'),
          VocabWord(kannada: 'ಐದು', transliteration: 'Aidu', english: 'Five (5)', pronunciation: 'EYE-doo'),
        ],
      ),
      Lesson(
        id: 'lesson_2_2',
        title: 'Numbers 6-10',
        description: 'Numbers six to ten',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಆರು', transliteration: 'Aaru', english: 'Six (6)', pronunciation: 'AA-roo'),
          VocabWord(kannada: 'ಏಳು', transliteration: 'Yelu', english: 'Seven (7)', pronunciation: 'YAY-loo'),
          VocabWord(kannada: 'ಎಂಟು', transliteration: 'Entu', english: 'Eight (8)', pronunciation: 'EN-too'),
          VocabWord(kannada: 'ಒಂಬತ್ತು', transliteration: 'Ombattu', english: 'Nine (9)', pronunciation: 'om-BUT-too'),
          VocabWord(kannada: 'ಹತ್ತು', transliteration: 'Hattu', english: 'Ten (10)', pronunciation: 'HUT-too'),
        ],
      ),
      Lesson(
        id: 'lesson_2_3',
        title: 'Tens',
        description: '10, 20, 30... 100',
        xpReward: 15,
        content: [
          VocabWord(kannada: 'ಹತ್ತು', transliteration: 'Hattu', english: 'Ten (10)'),
          VocabWord(kannada: 'ಇಪ್ಪತ್ತು', transliteration: 'Ippattu', english: 'Twenty (20)'),
          VocabWord(kannada: 'ಮೂವತ್ತು', transliteration: 'Moovattu', english: 'Thirty (30)'),
          VocabWord(kannada: 'ನಲವತ್ತು', transliteration: 'Nalavattu', english: 'Forty (40)'),
          VocabWord(kannada: 'ಐವತ್ತು', transliteration: 'Aivattu', english: 'Fifty (50)'),
          VocabWord(kannada: 'ಅರವತ್ತು', transliteration: 'Aravattu', english: 'Sixty (60)'),
          VocabWord(kannada: 'ಎಪ್ಪತ್ತು', transliteration: 'Eppattu', english: 'Seventy (70)'),
          VocabWord(kannada: 'ಎಂಬತ್ತು', transliteration: 'Embattu', english: 'Eighty (80)'),
          VocabWord(kannada: 'ತೊಂಬತ್ತು', transliteration: 'Tombattu', english: 'Ninety (90)'),
          VocabWord(kannada: 'ನೂರು', transliteration: 'Nooru', english: 'Hundred (100)'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 3: FAMILY
  // ============================================================
  static final unit3Family = LessonUnit(
    id: 'unit_3',
    title: 'Family',
    subtitle: 'Family member names',
    emoji: '👨‍👩‍👧‍👦',
    order: 3,
    lessons: [
      Lesson(
        id: 'lesson_3_1',
        title: 'Parents',
        description: 'Mother, father',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಅಪ್ಪ', transliteration: 'Appa', english: 'Father', pronunciation: 'UP-puh'),
          VocabWord(kannada: 'ಅಮ್ಮ', transliteration: 'Amma', english: 'Mother', pronunciation: 'UM-muh'),
          VocabWord(kannada: 'ಮಗ', transliteration: 'Maga', english: 'Son', pronunciation: 'MUH-guh'),
          VocabWord(kannada: 'ಮಗಳು', transliteration: 'Magalu', english: 'Daughter', pronunciation: 'MUH-guh-loo'),
          VocabWord(kannada: 'ಮಕ್ಕಳು', transliteration: 'Makkalu', english: 'Children', pronunciation: 'MUK-kuh-loo'),
        ],
      ),
      Lesson(
        id: 'lesson_3_2',
        title: 'Siblings',
        description: 'Brothers and sisters',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಅಣ್ಣ', transliteration: 'Anna', english: 'Elder brother', pronunciation: 'UN-nuh'),
          VocabWord(kannada: 'ತಮ್ಮ', transliteration: 'Tamma', english: 'Younger brother', pronunciation: 'TUM-muh'),
          VocabWord(kannada: 'ಅಕ್ಕ', transliteration: 'Akka', english: 'Elder sister', pronunciation: 'UK-kuh'),
          VocabWord(kannada: 'ತಂಗಿ', transliteration: 'Tangi', english: 'Younger sister', pronunciation: 'TUNG-ee'),
        ],
      ),
      Lesson(
        id: 'lesson_3_3',
        title: 'Grandparents',
        description: 'Elders of the family',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಅಜ್ಜ', transliteration: 'Ajja', english: 'Grandfather', pronunciation: 'UJ-juh'),
          VocabWord(kannada: 'ಅಜ್ಜಿ', transliteration: 'Ajji', english: 'Grandmother', pronunciation: 'UJ-jee'),
          VocabWord(kannada: 'ಗಂಡ', transliteration: 'Ganda', english: 'Husband', pronunciation: 'GUN-duh'),
          VocabWord(kannada: 'ಹೆಂಡತಿ', transliteration: 'Hendati', english: 'Wife', pronunciation: 'HEN-duh-tee'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 4: COLORS
  // ============================================================
  static final unit4Colors = LessonUnit(
    id: 'unit_4',
    title: 'Colors',
    subtitle: 'Learn all the colors',
    emoji: '🌈',
    order: 4,
    lessons: [
      Lesson(
        id: 'lesson_4_1',
        title: 'Primary Colors',
        description: 'Red, blue, yellow',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಕೆಂಪು', transliteration: 'Kempu', english: 'Red', pronunciation: 'KEM-poo'),
          VocabWord(kannada: 'ನೀಲಿ', transliteration: 'Neeli', english: 'Blue', pronunciation: 'NEE-lee'),
          VocabWord(kannada: 'ಹಳದಿ', transliteration: 'Haladi', english: 'Yellow', pronunciation: 'HUL-uh-dee'),
          VocabWord(kannada: 'ಹಸಿರು', transliteration: 'Hasiru', english: 'Green', pronunciation: 'HUH-see-roo'),
        ],
      ),
      Lesson(
        id: 'lesson_4_2',
        title: 'More Colors',
        description: 'Orange, purple, pink',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಕಿತ್ತಳೆ', transliteration: 'Kittale', english: 'Orange', pronunciation: 'KIT-tuh-lay'),
          VocabWord(kannada: 'ನೇರಳೆ', transliteration: 'Nerale', english: 'Purple', pronunciation: 'NAY-ruh-lay'),
          VocabWord(kannada: 'ಗುಲಾಬಿ', transliteration: 'Gulabi', english: 'Pink', pronunciation: 'goo-LAH-bee'),
          VocabWord(kannada: 'ಕಂದು', transliteration: 'Kandu', english: 'Brown', pronunciation: 'KUN-doo'),
        ],
      ),
      Lesson(
        id: 'lesson_4_3',
        title: 'Black & White',
        description: 'Neutral colors',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಕಪ್ಪು', transliteration: 'Kappu', english: 'Black', pronunciation: 'KUP-poo'),
          VocabWord(kannada: 'ಬಿಳಿ', transliteration: 'Bili', english: 'White', pronunciation: 'BIL-ee'),
          VocabWord(kannada: 'ಬೂದು', transliteration: 'Boodu', english: 'Gray', pronunciation: 'BOO-doo'),
          VocabWord(kannada: 'ಬಣ್ಣ', transliteration: 'Banna', english: 'Color', pronunciation: 'BUN-nuh'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 5: FOOD
  // ============================================================
  static final unit5Food = LessonUnit(
    id: 'unit_5',
    title: 'Food',
    subtitle: 'Common food items',
    emoji: '🍛',
    order: 5,
    lessons: [
      Lesson(
        id: 'lesson_5_1',
        title: 'Staples',
        description: 'Rice, bread, dal',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಅನ್ನ', transliteration: 'Anna', english: 'Rice (cooked)', pronunciation: 'UN-nuh'),
          VocabWord(kannada: 'ಅಕ್ಕಿ', transliteration: 'Akki', english: 'Rice (raw)', pronunciation: 'UK-kee'),
          VocabWord(kannada: 'ರೊಟ್ಟಿ', transliteration: 'Rotti', english: 'Bread/Roti', pronunciation: 'ROT-tee'),
          VocabWord(kannada: 'ಚಪಾತಿ', transliteration: 'Chapati', english: 'Chapati', pronunciation: 'chuh-PAH-tee'),
          VocabWord(kannada: 'ದೋಸೆ', transliteration: 'Dose', english: 'Dosa', pronunciation: 'DOH-say'),
          VocabWord(kannada: 'ಇಡ್ಲಿ', transliteration: 'Idli', english: 'Idli', pronunciation: 'ID-lee'),
        ],
      ),
      Lesson(
        id: 'lesson_5_2',
        title: 'Vegetables',
        description: 'Common vegetables',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ತರಕಾರಿ', transliteration: 'Tarakaari', english: 'Vegetable', pronunciation: 'tuh-ruh-KAH-ree'),
          VocabWord(kannada: 'ಆಲೂಗಡ್ಡೆ', transliteration: 'Aalugadde', english: 'Potato', pronunciation: 'AA-loo-GUD-day'),
          VocabWord(kannada: 'ಈರುಳ್ಳಿ', transliteration: 'Eerulli', english: 'Onion', pronunciation: 'EE-rool-lee'),
          VocabWord(kannada: 'ಟೊಮ್ಯಾಟೊ', transliteration: 'Tomato', english: 'Tomato', pronunciation: 'toh-MAH-toh'),
          VocabWord(kannada: 'ಬದನೆಕಾಯಿ', transliteration: 'Badanekayi', english: 'Brinjal', pronunciation: 'buh-duh-nay-KAH-yee'),
        ],
      ),
      Lesson(
        id: 'lesson_5_3',
        title: 'Fruits',
        description: 'Common fruits',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಹಣ್ಣು', transliteration: 'Hannu', english: 'Fruit', pronunciation: 'HUN-noo'),
          VocabWord(kannada: 'ಮಾವಿನಹಣ್ಣು', transliteration: 'Maavinahannu', english: 'Mango', pronunciation: 'MAH-vee-nuh-HUN-noo'),
          VocabWord(kannada: 'ಬಾಳೆಹಣ್ಣು', transliteration: 'Baalehannu', english: 'Banana', pronunciation: 'BAH-lay-HUN-noo'),
          VocabWord(kannada: 'ಸೇಬು', transliteration: 'Sebu', english: 'Apple', pronunciation: 'SAY-boo'),
          VocabWord(kannada: 'ಕಿತ್ತಳೆಹಣ್ಣು', transliteration: 'Kittalehannu', english: 'Orange (fruit)', pronunciation: 'kit-TAH-lay-HUN-noo'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 6: DRINKS
  // ============================================================
  static final unit6Drinks = LessonUnit(
    id: 'unit_6',
    title: 'Drinks',
    subtitle: 'Beverages and liquids',
    emoji: '🥤',
    order: 6,
    lessons: [
      Lesson(
        id: 'lesson_6_1',
        title: 'Basic Drinks',
        description: 'Water, tea, coffee',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ನೀರು', transliteration: 'Neeru', english: 'Water', pronunciation: 'NEE-roo'),
          VocabWord(kannada: 'ಹಾಲು', transliteration: 'Haalu', english: 'Milk', pronunciation: 'HAH-loo'),
          VocabWord(kannada: 'ಚಹಾ', transliteration: 'Chaha', english: 'Tea', pronunciation: 'chuh-HAH'),
          VocabWord(kannada: 'ಕಾಫಿ', transliteration: 'Kaafi', english: 'Coffee', pronunciation: 'KAH-fee'),
        ],
      ),
      Lesson(
        id: 'lesson_6_2',
        title: 'More Drinks',
        description: 'Juice, buttermilk',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಜ್ಯೂಸ್', transliteration: 'Juice', english: 'Juice', pronunciation: 'JOOS'),
          VocabWord(kannada: 'ಮಜ್ಜಿಗೆ', transliteration: 'Majjige', english: 'Buttermilk', pronunciation: 'MUJ-jee-gay'),
          VocabWord(kannada: 'ಎಳನೀರು', transliteration: 'Elaneeru', english: 'Coconut water', pronunciation: 'EL-uh-NEE-roo'),
          VocabWord(kannada: 'ಮೊಸರು', transliteration: 'Mosaru', english: 'Curd/Yogurt', pronunciation: 'MOH-suh-roo'),
        ],
      ),
      Lesson(
        id: 'lesson_6_3',
        title: 'Tastes',
        description: 'Sweet, spicy, sour',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಸಿಹಿ', transliteration: 'Sihi', english: 'Sweet', pronunciation: 'SEE-hee'),
          VocabWord(kannada: 'ಖಾರ', transliteration: 'Khaara', english: 'Spicy', pronunciation: 'KHAH-ruh'),
          VocabWord(kannada: 'ಹುಳಿ', transliteration: 'Huli', english: 'Sour', pronunciation: 'HOO-lee'),
          VocabWord(kannada: 'ಉಪ್ಪು', transliteration: 'Uppu', english: 'Salt/Salty', pronunciation: 'UP-poo'),
          VocabWord(kannada: 'ಕಹಿ', transliteration: 'Kahi', english: 'Bitter', pronunciation: 'KUH-hee'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 7: BODY PARTS
  // ============================================================
  static final unit7Body = LessonUnit(
    id: 'unit_7',
    title: 'Body Parts',
    subtitle: 'Parts of the body',
    emoji: '🧍',
    order: 7,
    lessons: [
      Lesson(
        id: 'lesson_7_1',
        title: 'Head & Face',
        description: 'Eyes, nose, mouth',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ತಲೆ', transliteration: 'Tale', english: 'Head', pronunciation: 'TUH-lay'),
          VocabWord(kannada: 'ಕಣ್ಣು', transliteration: 'Kannu', english: 'Eye', pronunciation: 'KUN-noo'),
          VocabWord(kannada: 'ಮೂಗು', transliteration: 'Moogu', english: 'Nose', pronunciation: 'MOO-goo'),
          VocabWord(kannada: 'ಬಾಯಿ', transliteration: 'Baayi', english: 'Mouth', pronunciation: 'BAH-yee'),
          VocabWord(kannada: 'ಕಿವಿ', transliteration: 'Kivi', english: 'Ear', pronunciation: 'KIH-vee'),
        ],
      ),
      Lesson(
        id: 'lesson_7_2',
        title: 'Upper Body',
        description: 'Hand, arm, chest',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಕೈ', transliteration: 'Kai', english: 'Hand', pronunciation: 'KAI'),
          VocabWord(kannada: 'ತೋಳು', transliteration: 'Tolu', english: 'Arm', pronunciation: 'TOH-loo'),
          VocabWord(kannada: 'ಹೊಟ್ಟೆ', transliteration: 'Hotte', english: 'Stomach', pronunciation: 'HOT-tay'),
          VocabWord(kannada: 'ಬೆನ್ನು', transliteration: 'Bennu', english: 'Back', pronunciation: 'BEN-noo'),
          VocabWord(kannada: 'ಎದೆ', transliteration: 'Ede', english: 'Chest', pronunciation: 'EH-day'),
        ],
      ),
      Lesson(
        id: 'lesson_7_3',
        title: 'Lower Body',
        description: 'Legs, feet',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಕಾಲು', transliteration: 'Kaalu', english: 'Leg/Foot', pronunciation: 'KAH-loo'),
          VocabWord(kannada: 'ಮೊಣಕಾಲು', transliteration: 'Monakaalu', english: 'Knee', pronunciation: 'MOH-nuh-KAH-loo'),
          VocabWord(kannada: 'ಪಾದ', transliteration: 'Paada', english: 'Foot', pronunciation: 'PAH-duh'),
          VocabWord(kannada: 'ಬೆರಳು', transliteration: 'Beralu', english: 'Finger/Toe', pronunciation: 'BEH-ruh-loo'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 8: ANIMALS
  // ============================================================
  static final unit8Animals = LessonUnit(
    id: 'unit_8',
    title: 'Animals',
    subtitle: 'Common animals',
    emoji: '🐾',
    order: 8,
    lessons: [
      Lesson(
        id: 'lesson_8_1',
        title: 'Pets',
        description: 'Dog, cat, cow',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ನಾಯಿ', transliteration: 'Naayi', english: 'Dog', pronunciation: 'NAH-yee'),
          VocabWord(kannada: 'ಬೆಕ್ಕು', transliteration: 'Bekku', english: 'Cat', pronunciation: 'BEK-koo'),
          VocabWord(kannada: 'ಹಸು', transliteration: 'Hasu', english: 'Cow', pronunciation: 'HUH-soo'),
          VocabWord(kannada: 'ಎತ್ತು', transliteration: 'Ettu', english: 'Bull/Ox', pronunciation: 'ET-too'),
        ],
      ),
      Lesson(
        id: 'lesson_8_2',
        title: 'Farm Animals',
        description: 'Goat, sheep, chicken',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಮೇಕೆ', transliteration: 'Meke', english: 'Goat', pronunciation: 'MAY-kay'),
          VocabWord(kannada: 'ಕುರಿ', transliteration: 'Kuri', english: 'Sheep', pronunciation: 'KOO-ree'),
          VocabWord(kannada: 'ಕೋಳಿ', transliteration: 'Koli', english: 'Chicken', pronunciation: 'KOH-lee'),
          VocabWord(kannada: 'ಹಂದಿ', transliteration: 'Handi', english: 'Pig', pronunciation: 'HUN-dee'),
          VocabWord(kannada: 'ಕುದುರೆ', transliteration: 'Kudure', english: 'Horse', pronunciation: 'koo-DOO-ray'),
        ],
      ),
      Lesson(
        id: 'lesson_8_3',
        title: 'Wild Animals',
        description: 'Lion, elephant, monkey',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಸಿಂಹ', transliteration: 'Simha', english: 'Lion', pronunciation: 'SIM-huh'),
          VocabWord(kannada: 'ಆನೆ', transliteration: 'Aane', english: 'Elephant', pronunciation: 'AH-nay'),
          VocabWord(kannada: 'ಹುಲಿ', transliteration: 'Huli', english: 'Tiger', pronunciation: 'HOO-lee'),
          VocabWord(kannada: 'ಕೋತಿ', transliteration: 'Koti', english: 'Monkey', pronunciation: 'KOH-tee'),
          VocabWord(kannada: 'ಹಾವು', transliteration: 'Haavu', english: 'Snake', pronunciation: 'HAH-voo'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 9: HOUSEHOLD ITEMS
  // ============================================================
  static final unit9Household = LessonUnit(
    id: 'unit_9',
    title: 'Home',
    subtitle: 'Household items',
    emoji: '🏠',
    order: 9,
    lessons: [
      Lesson(
        id: 'lesson_9_1',
        title: 'Rooms',
        description: 'House, room, door',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಮನೆ', transliteration: 'Mane', english: 'House/Home', pronunciation: 'MUH-nay'),
          VocabWord(kannada: 'ಕೋಣೆ', transliteration: 'Kone', english: 'Room', pronunciation: 'KOH-nay'),
          VocabWord(kannada: 'ಬಾಗಿಲು', transliteration: 'Baagilu', english: 'Door', pronunciation: 'BAH-gee-loo'),
          VocabWord(kannada: 'ಕಿಟಕಿ', transliteration: 'Kitaki', english: 'Window', pronunciation: 'KIT-uh-kee'),
          VocabWord(kannada: 'ಗೋಡೆ', transliteration: 'Gode', english: 'Wall', pronunciation: 'GOH-day'),
        ],
      ),
      Lesson(
        id: 'lesson_9_2',
        title: 'Furniture',
        description: 'Table, chair, bed',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಮೇಜು', transliteration: 'Meju', english: 'Table', pronunciation: 'MAY-joo'),
          VocabWord(kannada: 'ಕುರ್ಚಿ', transliteration: 'Kurchi', english: 'Chair', pronunciation: 'KOOR-chee'),
          VocabWord(kannada: 'ಹಾಸಿಗೆ', transliteration: 'Haasige', english: 'Bed', pronunciation: 'HAH-see-gay'),
          VocabWord(kannada: 'ಅಲ್ಮಾರಿ', transliteration: 'Almaari', english: 'Cupboard', pronunciation: 'ul-MAH-ree'),
        ],
      ),
      Lesson(
        id: 'lesson_9_3',
        title: 'Kitchen Items',
        description: 'Plate, glass, spoon',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ತಟ್ಟೆ', transliteration: 'Tatte', english: 'Plate', pronunciation: 'TUT-tay'),
          VocabWord(kannada: 'ಲೋಟ', transliteration: 'Lota', english: 'Glass/Cup', pronunciation: 'LOH-tuh'),
          VocabWord(kannada: 'ಚಮಚ', transliteration: 'Chamacha', english: 'Spoon', pronunciation: 'chuh-MUH-chuh'),
          VocabWord(kannada: 'ಕತ್ತಿ', transliteration: 'Katti', english: 'Knife', pronunciation: 'KUT-tee'),
          VocabWord(kannada: 'ಪಾತ್ರೆ', transliteration: 'Paatre', english: 'Vessel/Pot', pronunciation: 'PAH-tray'),
        ],
      ),
    ],
  );

  // ============================================================
  // UNIT 10: COMMON VERBS
  // ============================================================
  static final unit10Verbs = LessonUnit(
    id: 'unit_10',
    title: 'Actions',
    subtitle: 'Common verbs',
    emoji: '🏃',
    order: 10,
    lessons: [
      Lesson(
        id: 'lesson_10_1',
        title: 'Basic Actions',
        description: 'Go, come, eat',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಹೋಗು', transliteration: 'Hogu', english: 'Go', pronunciation: 'HOH-goo'),
          VocabWord(kannada: 'ಬಾ', transliteration: 'Baa', english: 'Come', pronunciation: 'BAH'),
          VocabWord(kannada: 'ತಿನ್ನು', transliteration: 'Tinnu', english: 'Eat', pronunciation: 'TIN-noo'),
          VocabWord(kannada: 'ಕುಡಿ', transliteration: 'Kudi', english: 'Drink', pronunciation: 'KOO-dee'),
          VocabWord(kannada: 'ಮಲಗು', transliteration: 'Malagu', english: 'Sleep', pronunciation: 'MUH-luh-goo'),
        ],
      ),
      Lesson(
        id: 'lesson_10_2',
        title: 'More Actions',
        description: 'See, hear, speak',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ನೋಡು', transliteration: 'Nodu', english: 'See/Look', pronunciation: 'NOH-doo'),
          VocabWord(kannada: 'ಕೇಳು', transliteration: 'Kelu', english: 'Hear/Listen', pronunciation: 'KAY-loo'),
          VocabWord(kannada: 'ಹೇಳು', transliteration: 'Helu', english: 'Say/Tell', pronunciation: 'HAY-loo'),
          VocabWord(kannada: 'ಮಾತಾಡು', transliteration: 'Maataadu', english: 'Speak/Talk', pronunciation: 'MAH-tah-doo'),
          VocabWord(kannada: 'ಓದು', transliteration: 'Odu', english: 'Read', pronunciation: 'OH-doo'),
        ],
      ),
      Lesson(
        id: 'lesson_10_3',
        title: 'Daily Actions',
        description: 'Work, sit, stand',
        xpReward: 10,
        content: [
          VocabWord(kannada: 'ಕೆಲಸ ಮಾಡು', transliteration: 'Kelasa maadu', english: 'Work', pronunciation: 'KEL-uh-suh MAH-doo'),
          VocabWord(kannada: 'ಕುಳಿತುಕೊ', transliteration: 'Kulituko', english: 'Sit', pronunciation: 'koo-lee-too-KOH'),
          VocabWord(kannada: 'ನಿಲ್ಲು', transliteration: 'Nillu', english: 'Stand', pronunciation: 'NIL-loo'),
          VocabWord(kannada: 'ನಡೆ', transliteration: 'Nade', english: 'Walk', pronunciation: 'NUH-day'),
          VocabWord(kannada: 'ಓಡು', transliteration: 'Odu', english: 'Run', pronunciation: 'OH-doo'),
        ],
      ),
    ],
  );
}
