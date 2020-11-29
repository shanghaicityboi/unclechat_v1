const String male = 'male';
const String female = 'female';
const String lgbt = 'lgbt';
const String northern = 'northern';
const String central = 'central';
const String southern = 'southern';
const String foreign = 'foreign';

const Map<String, String> genders = {
  'Nam': male,
  'Nữ': female,
  'LGBT': lgbt,
};

const Map<String, String> regions = {
  'Miền Bắc': northern,
  'Miền Trung': central,
  'Miền Nam': southern,
  'Nước ngoài': foreign,
};

String convertToStandardGender(String text) {
  return genders[text];
}

String convertToStandardRegion(String text) {
  return regions[text];
}
