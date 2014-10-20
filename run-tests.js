// https://github.com/brunch/brunch/blob/master/docs/faq.md#what-is-the-recommended-way-of-running-tests
sinonChai = require("dev/sinon-chai");
chaiAsPromised = require("dev/chai-as-promised");
expect = chai.expect;

jQuery(function($){

  mocha.setup("bdd");

  require.list()
  .filter(function(name){return /^test\/units/.test(name);})
  .forEach(require);

  chai.use(chaiAsPromised);
  chai.use(sinonChai);
  chai.should();

  mocha
  .checkLeaks()
  .run();

});
