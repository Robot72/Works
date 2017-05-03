let assert = require('assert');
let http = require('http');
let addresses = require('./addresses.js').addresses;
let hostName = '/';

describe('Server test', () => {

  context('Существование страниц', () => {

    // this.timeout(15000); /* Максимальный таймаут */

    function makeTest(path) {

      let options = {
        hostname: 'q-store.uk.armtek.local',
        port: 80,
        path: path,
        method: 'GET',
        timeout: 6000,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36',
          'Upgrade-Insecure-Requests': '1',
          'Cookie': 'REMMEID=1431efa021f22cad28758f6dded33e54; VKORG=2000; VSTEL=MIPT; rPrice=0; etpuid=2bac88f5105c5ff7d38582e5ecfeb93b686eef2e',
          'Cache-Control': 'no-cache',
          'Accept-Language': 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
          'Accept-Encoding': 'gzip, deflate, sdch',
          'Pragma': 'no-cache'
        }
      };

      it('Cтраница [' + options.path + '] возвращает статус 200', function (done) {
        http.get(options, ( response ) => {
          assert.equal(200, response.statusCode);
          done();
        });
      });

    }

    for(var item in addresses) {
      makeTest(addresses[item]);
    };

  });

});
