import 'package:allohuggy/Data/Response/status.dart';

class ApiResponse<stateData> {
  Status? status;
  stateData? data;
  String? message;

  ApiResponse([this.status, this.data, this.message]);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complete(this.data) : status = Status.COMPLETE;

  ApiResponse.error(this.message) : status = Status.ERROR;


  @override
  String toString(){
    return 'Status:$status \n Message:$message \n Data:$data';
  }

}
