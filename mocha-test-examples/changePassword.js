let assert = require('assert');
let request = require('request');

describe('Server test', () => {

  context('Set new passwords', () => {

      let options = {
        url: 'http://host.info/changePassword?' + Math.random() * 100000000000000000,
        method: 'POST',
        form: {
          'set': '1',
          'password': 'asdfasdfasdf',
          'passwordConfirm': 'asdfasdf'          
        },
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36',
          'Cookie': 'generate',
          'Cache-Control': 'no-cache',
          'Accept-Language': 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
          'Accept': 'application/json, text/javascript, */*; q=0.01',
          // 'Accept-Encoding': 'gzip, deflate',
          'Pragma': 'no-cache',
          'X-Requested-With': 'XMLHttpRequest'
        }
      };

      it('Message about an error: Passwords do not eval', function (done) {
        request(options, (error, response, body) => {
          let data = JSON.parse(body);
          assert.equal(200, response.statusCode);
          assert.equal('Error! Passwords do not eval.', data.text);
          done();
        });
      });

      it('Password should have a number', function (done) {
        options.form = {
          'set': '1',
          'password': 'asdfasdfasdf',
          'passwordConfirm': 'asdfasdf'          
        };

        request(options, (error, response, body) => {
          let data = JSON.parse(body);
          assert.equal(200, response.statusCode);
          assert.equal('Password should have a number', data.text);
          done();
        });
      });
      
  }
});
