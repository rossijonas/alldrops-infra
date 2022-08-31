function handler(event) {
  var request = event.request;

  request.uri = uri.replace(/\/$/, '\/index.html');

  return request;
};
