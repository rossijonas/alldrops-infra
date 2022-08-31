exports.handler = (event, context, callback) => {
  let request = event.Records[0].cf.request;
  let olduri = request.uri;

  let newuri = olduri.replace(/\/$/, '\/index.tml');
  request.uri = newuri;

  return callback(null, request);
};
