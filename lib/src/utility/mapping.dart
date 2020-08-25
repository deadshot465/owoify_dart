import 'dart:math';

import 'package:owoify_dart/src/structures/word.dart';

final O_TO_OWO = RegExp(r'o');
final EW_TO_UWU = RegExp(r'ew');
final HEY_TO_HAY = RegExp(r'([Hh])ey');
final DEAD_TO_DED_UPPER = RegExp(r'Dead');
final DEAD_TO_DED_LOWER = RegExp(r'dead');
final N_VOWEL_T_TO_ND = RegExp(r'n[aeiou]*t');
final READ_TO_WEAD_UPPER = RegExp(r'Read');
final READ_TO_WEAD_LOWER = RegExp(r'read');
final BRACKETS_TO_STARTRAILS_FORE = RegExp(r'[({<]');
final BRACKETS_TO_STARTRAILS_REAR = RegExp(r'[)}>]');
final PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST =
    RegExp(r'[.,](?![0-9])');
final PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND = RegExp(r'[!;]+');
final THAT_TO_DAT_UPPER = RegExp(r'That');
final THAT_TO_DAT_LOWER = RegExp(r'that');
final TH_TO_F_UPPER = RegExp(r'TH(?!E)');
final TH_TO_F_LOWER = RegExp(r'[Tt]h(?![Ee])');
final LE_TO_WAL = RegExp(r'le$');
final VE_TO_WE_UPPER = RegExp(r'Ve');
final VE_TO_WE_LOWER = RegExp(r've');
final RY_TO_WWY = RegExp(r'ry');
final RORL_TO_W_UPPER = RegExp(r'(?:R|L)');
final RORL_TO_W_LOWER = RegExp(r'(?:r|l)');
final LL_TO_WW = RegExp(r'll');
final VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER = RegExp(r'[AEIUR]([lL])$');
final VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER = RegExp(r'[aeiur]l$');
final OLD_TO_OWLD_UPPER = RegExp(r'OLD');
final OLD_TO_OWLD_LOWER = RegExp(r'([Oo])ld');
final OL_TO_OWL_UPPER = RegExp(r'OL');
final OL_TO_OWL_LOWER = RegExp(r'([Oo])l');
final LORR_O_TO_WO_UPPER = RegExp(r'[LR]([oO])');
final LORR_O_TO_WO_LOWER = RegExp(r'[lr]o');
final SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER =
    RegExp(r'([BCDFGHJKMNPQSTXYZ])([oO])');
final SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER =
    RegExp(r'([bcdfghjkmnpqstxyz])o');
final VORW_LE_TO_WAL = RegExp(r'[vw]le');
final FI_TO_FWI_UPPER = RegExp(r'FI');
final FI_TO_FWI_LOWER = RegExp(r'([Ff])i');
final VER_TO_WER = RegExp(r'([Vv])er');
final POI_TO_PWOI = RegExp(r'([Pp])oi');
final SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL =
    RegExp(r'([DdFfGgHhJjPpQqRrSsTtXxYyZz])le$');
final CONSONANT_R_TO_CONSONANT_W = RegExp(r'([BbCcDdFfGgKkPpQqSsTtWwXxZz])r');
final LY_TO_WY_UPPER = RegExp(r'Ly');
final LY_TO_WY_LOWER = RegExp(r'ly');
final PLE_TO_PWE = RegExp(r'([Pp])le');
final NR_TO_NW_UPPER = RegExp(r'NR');
final NR_TO_NW_LOWER = RegExp(r'nr');
final FUC_TO_FWUC = RegExp(r'([Ff])uc');
final MOM_TO_MWOM = RegExp(r'([Mm])om');
final ME_TO_MWE = RegExp(r'([Mm])e');
final N_VOWEL_TO_NY_FIRST = RegExp(r'n([aeiou])');
final N_VOWEL_TO_NY_SECOND = RegExp(r'N([aeiou])');
final N_VOWEL_TO_NY_THIRD = RegExp(r'N([AEIOU])');
final OVE_TO_UV_UPPER = RegExp(r'OVE');
final OVE_TO_UV_LOWER = RegExp(r'ove');
final HAHA_TO_HEHE_XD = RegExp(r'\b(ha|hah|heh|hehe)+\b');
final THE_TO_TEH = RegExp(r'\b([Tt])he\b');
final YOU_TO_U_UPPER = RegExp(r'\bYou\b');
final YOU_TO_U_LOWER = RegExp(r'\byou\b');
final TIME_TO_TIM = RegExp(r'\b([Tt])ime\b');
final OVER_TO_OWOR = RegExp(r'([Oo])ver');
final WORSE_TO_WOSE = RegExp(r'([Ww])orse');

// Additional kaomojis come from [owoify](https://pypi.org/project/owoify/) and Discord.
const FACES = [
  '(・`ω´・)',
  ';;w;;',
  'owo',
  'UwU',
  '>w<',
  '^w^',
  '(* ^ ω ^)',
  '(⌒ω⌒)',
  'ヽ(*・ω・)ﾉ',
  '(o´∀`o)',
  '(o･ω･o)',
  '＼(＾▽＾)／',
  '(*^ω^)',
  '(◕‿◕✿)',
  '(◕ᴥ◕)',
  'ʕ•ᴥ•ʔ',
  'ʕ￫ᴥ￩ʔ',
  '(*^.^*)',
  '(｡♥‿♥｡)',
  'OwO',
  'uwu',
  'uvu',
  'UvU',
  '(*￣з￣)',
  '(つ✧ω✧)つ',
  '(/ =ω=)/',
  '(╯°□°）╯︵ ┻━┻',
  '┬─┬ ノ( ゜-゜ノ)',
  '¯\\_(ツ)_/¯'
];

final random = Random();

Word mapOToOwO(Word input) {
  var replacement = '';
  if (random.nextInt(2) > 0) {
    replacement = 'owo';
  } else {
    replacement = 'o';
  }
  return input.replace(O_TO_OWO, replacement);
}

Word mapEwToUwu(Word input) => input.replace(EW_TO_UWU, 'uwu');
Word mapHeyToHay(Word input) => input.replace(HEY_TO_HAY, '\\1ay');

Word mapDeadToDed(Word input) {
  return input
      .replace(DEAD_TO_DED_UPPER, 'Ded')
      .replace(DEAD_TO_DED_LOWER, 'ded');
}

Word mapNVowelTToNd(Word input) => input.replace(N_VOWEL_T_TO_ND, 'nd');

Word mapReadToWead(Word input) {
  return input
      .replace(READ_TO_WEAD_UPPER, 'Wead')
      .replace(READ_TO_WEAD_LOWER, 'wead');
}

Word mapBracketToStarTrails(Word input) {
  return input
      .replace(BRACKETS_TO_STARTRAILS_FORE, '｡･:*:･ﾟ★,｡･:*:･ﾟ☆')
      .replace(BRACKETS_TO_STARTRAILS_REAR, '☆ﾟ･:*:･｡,★ﾟ･:*:･｡');
}

Word mapPeriodCommaExclamationSemicolonToKaomojis(Word input) {
  return input
      .replaceWithFuncSingle(
          PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST,
          () => ' ${FACES[(random.nextDouble() * FACES.length).floor()]}')
      .replaceWithFuncSingle(
          PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND,
          () => ' ${FACES[(random.nextDouble() * FACES.length).floor()]}');
}

Word mapThatToDat(Word input) {
  return input
      .replace(THAT_TO_DAT_LOWER, 'dat')
      .replace(THAT_TO_DAT_UPPER, 'Dat');
}

Word mapThToF(Word input) {
  return input.replace(TH_TO_F_LOWER, 'f').replace(TH_TO_F_UPPER, 'F');
}

Word mapLeToWal(Word input) => input.replace(LE_TO_WAL, 'wal');

Word mapVeToWe(Word input) {
  return input.replace(VE_TO_WE_LOWER, 'we').replace(VE_TO_WE_UPPER, 'We');
}

Word mapRyToWwy(Word input) => input.replace(RY_TO_WWY, 'wwy');

Word mapROrLToW(Word input) {
  return input.replace(RORL_TO_W_LOWER, 'w').replace(RORL_TO_W_UPPER, 'W');
}

Word mapLlToWw(Word input) => input.replace(LL_TO_WW, 'ww');

Word mapVowelOrRExceptOLToWl(Word input) {
  return input
      .replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER, 'wl')
      .replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER, 'W\\1');
}

Word mapOldToOwld(Word input) {
  return input
      .replace(OLD_TO_OWLD_LOWER, '\\1wld')
      .replace(OLD_TO_OWLD_UPPER, 'OWLD');
}

Word mapOlToOwl(Word input) {
  return input
      .replace(OL_TO_OWL_LOWER, '\\1wl')
      .replace(OL_TO_OWL_UPPER, 'OWL');
}

Word mapLOrROToWo(Word input) {
  return input
      .replace(LORR_O_TO_WO_LOWER, 'wo')
      .replace(LORR_O_TO_WO_UPPER, 'W\\1');
}

Word mapSpecificConsonantsOToLetterAndWo(Word input) {
  return input
      .replace(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER, '\\1wo')
      .replaceWithFuncMultiple(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER,
          (str1, str2) {
    var msg = str1;
    if (str2.toUpperCase() == str2) {
      msg += 'W';
    } else {
      msg += 'w';
    }
    msg += str2;
    return msg;
  });
}

Word mapVOrWLeToWal(Word input) => input.replace(VORW_LE_TO_WAL, 'wal');

Word mapFiToFwi(Word input) {
  return input
      .replace(FI_TO_FWI_LOWER, '\\1wi')
      .replace(FI_TO_FWI_UPPER, 'FWI');
}

Word mapVerToWer(Word input) => input.replace(VER_TO_WER, 'wer');
Word mapPoiToPwoi(Word input) => input.replace(POI_TO_PWOI, '\\1woi');
Word mapSpecificConsonantsLeToLetterAndWal(Word input) =>
    input.replace(SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL, '\\1wal');
Word mapConsonantsRToConsonantW(Word input) =>
    input.replace(CONSONANT_R_TO_CONSONANT_W, '\\1w');

Word mapLyToWy(Word input) {
  return input.replace(LY_TO_WY_LOWER, 'wy').replace(LY_TO_WY_UPPER, 'Wy');
}

Word mapPleToPwe(Word input) => input.replace(PLE_TO_PWE, '\\1we');

Word mapNrToNw(Word input) {
  return input.replace(NR_TO_NW_LOWER, 'nw').replace(NR_TO_NW_UPPER, 'NW');
}

Word mapFucToFwuc(Word input) => input.replace(FUC_TO_FWUC, '\\1wuc');
Word mapMomToMwom(Word input) => input.replace(MOM_TO_MWOM, '\\1wom');
Word mapMeToMwe(Word input) => input.replace(ME_TO_MWE, '\\1we');

Word mapNVowelToNy(Word input) {
  return input
      .replace(N_VOWEL_TO_NY_FIRST, 'ny\\1')
      .replace(N_VOWEL_TO_NY_SECOND, 'Ny\\1')
      .replace(N_VOWEL_TO_NY_THIRD, 'NY\\1');
}

Word mapOveToUv(Word input) {
  return input.replace(OVE_TO_UV_LOWER, 'uv').replace(OVE_TO_UV_UPPER, 'UV');
}

Word mapHahaToHeheXd(Word input) => input.replace(HAHA_TO_HEHE_XD, 'hehe xD');
Word mapTheToTeh(Word input) => input.replace(THE_TO_TEH, '\\1eh');

Word mapYouToU(Word input) {
  return input.replace(YOU_TO_U_UPPER, 'U').replace(YOU_TO_U_LOWER, 'u');
}

Word mapTimeToTim(Word input) => input.replace(TIME_TO_TIM, '\\1im');
Word mapOverToOwor(Word input) => input.replace(OVER_TO_OWOR, '\\1wor');
Word mapWorseToWose(Word input) => input.replace(WORSE_TO_WOSE, '\\1ose');
