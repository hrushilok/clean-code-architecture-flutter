import 'package:clean_code_architecture_flutter/common/constants/exception_constants.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/server_exception.dart';

class BadRequestException extends ServerException {
  BadRequestException(String message)
      : super(
          message: message ?? '',
          code: ExceptionConstants.badRequest,
        );
}
