class ApiResponse<T> {
  Status status;
  T data;
  String message;

  ApiResponse.initial(this.message) {
    status = Status.INITIAL;
  }

  ApiResponse.loading(this.message) {
    status = Status.LOADING;
  }

  ApiResponse.complete(this.data) {
    status = Status.COMPLETE;
  }

  ApiResponse.error(this.message) {
    status = Status.ERROR;
  }
}

enum Status { INITIAL, LOADING, COMPLETE, ERROR }
