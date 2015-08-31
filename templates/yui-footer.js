  var macaroon = macaroon();
  Object.keys(macaroon).forEach(function(key) {
    ns[key] = macaroon[key];
  });

}, '0.1.0', {
requires: []
});
