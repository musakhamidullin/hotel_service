class BaseResponse<T> {
  const BaseResponse({
    this.errorCode = 0,
    required this.data,
  });

  final int errorCode;
  final T data;
}
