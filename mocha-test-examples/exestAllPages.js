let assert = require('assert');
let http = require('http');
let addresses = require('./addresses.js').addresses;

describe('Server test', () => {

  context('Pages are exists', () => {

    // this.timeout(15000); /* Max timeout */

    function makeTest(path) {

      let options = {
        hostname: 'host',
        port: 80,
        path: path,
        method: 'GET',
        timeout: 6000,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36',
          'Upgrade-Insecure-Requests': '1',
          'Cookie': 'pmaCookieVer=4; phpMyAdmin=cdlcgh30k52664p7dau62bha1crk6chq; pma_lang=ru-utf-8; pma_charset=iso-8859-1; pma_collation_connection=utf8_unicode_ci; pma_fontsize=82%25; REMMEID=7a357fdf8a85838e9daefc27094f49ca; VKORG=2000; VSTEL=KL01; etpuid=aae54d1235a2e6b2dd63efc1be5faeabbf16e5ed; rPrice=0',
          'Cache-Control': 'no-cache',
          'Accept-Language': 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
          'Accept-Encoding': 'gzip, deflate, sdch',
          'Pragma': 'no-cache'
        }
      };

      it('Server [' + options.path + '] response status 200', function (done) {
        http.get(options, ( response ) => {
          assert.equal(200, response.statusCode);
          done();
        });
      });

    }

    for(var item in addresses) {
      makeTest(addresses[item]);
    };

    /** ? **/
/*
    it('Server [' + options.path + '] response status 200', function (done) {
      http.get(options, ( response ) => {
        assert.equal(200, response.statusCode);
        done();
      });
    });
    */

  });

});
