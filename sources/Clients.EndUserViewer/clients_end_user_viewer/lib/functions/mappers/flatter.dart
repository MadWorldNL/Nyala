class Flatter {
  static Map<String, String> flatten(List<Map<String, String>> headerForm) {
    var headers = <String, String>{};

    for (var header in headerForm) {
      if (header['Key']!.isEmpty || header['Value']!.isEmpty) {
        continue;
      }

      headers[header['Key']!] = header['Value']!;
    }

    return headers;
  }

  static List<Map<String, String>> unflatten(Map<String, String> headers) {
    var headerForm = <Map<String, String>>[];

    for (var key in headers.keys) {
      headerForm.add({'Key': key, 'Value': headers[key]!});
    }

    return headerForm;
  }
}
