//curl -X POST -H "X-Parse-Application-Id: hrhouz" -H "X-Parse-Master-Key: master_key" http://0.0.0.0:1337/parse/functions/testfunction
// Parse.Cloud.define("testfunction", (request) => {
//   var text = "hello world";
//   var jsonObject = {
//     answer: text,
//   };
//   return jsonObject;
// });

const Parse = require('parse/node');

Parse.initialize("hrhouz", "master_key");
Parse.serverURL = 'http://0.0.0.0:1337/parse';

Parse.Cloud.define("testfunction", (request) => {
  var text = "hello world";
  var jsonObject = {
    answer: text,
  };
  return jsonObject;
});

