import 'package:intl/intl.dart';

class Util{

  static String appId = '28fec65357bce9e97b99ccf07bf4f659';

  static String getFormattedDate(DateTime dateTime){

    return DateFormat('EEEE, MMM, d, y').format(dateTime);
  }

}