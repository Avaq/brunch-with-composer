Cow = require 'dev/examples/cow'

# Description of the class we are testing. Usually just the class name.
describe "cow", ->

  # Description of the unit we are testing.
  describe "constructor", ->

    # First test of the constructor. Using chai.should for asserting if what happened is OK.
    it "should have a default name", ->
      cow = new Cow
      cow.name.should.equal "Anon"

    # Second test of the constructor.
    it "should name the cow after provided name", ->
      cow = new Cow "Bessy"
      cow.name.should.equal "Bessy"

  # Another unit description. Usually a method name. In case of a method-name we prefix it with a hash.
  describe "#moo", ->

    # First test of cow.moo. We call the function and assert the result.
    it "should moo at the world", ->
      cow = new Cow
      cow.moo().should.equal "Moo world!"

    # Second test of cow.moo.
    it "should moo at what you give it", ->
      cow = new Cow
      cow.moo("Avaq").should.equal "Moo Avaq!"

  # Another unit.
  describe "#consoleMoo", ->

    # In this test we use sinon to spy on the console and stub the already-tested moo method.
    it "should moo to the console", ->
      spy = sinon.spy console, "log"
      cow = new Cow
      stub = sinon.stub cow, "moo"
      stub.returns "the_moo"
      cow.consoleMoo("Avaq");
      stub.should.have.been.calledWith "Avaq"
      spy.should.have.been.calledWith "the_moo"
      console.log.restore()
      cow.moo.restore()
