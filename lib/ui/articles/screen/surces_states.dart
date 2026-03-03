
import '../../../data/model/source_response/Source.dart';

sealed class SurcesStates {}

class LoadingState extends SurcesStates{}

class ErrorState extends SurcesStates{
  String errormessage;
  ErrorState(this.errormessage);
}
class SuccessState extends SurcesStates{
  List<Source> sources;
  SuccessState(this.sources);
}