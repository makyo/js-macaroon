/*jslint node: true, continue: true, eqeq: true, forin: true, nomen: true, plusplus: true, todo: true, vars: true, white: true */

var assert = require("assert");
var sjcl = require("sjcl");
var macaroon = require("../build/node-macaroon");

"use strict";

function strBitArray(s) {
	return sjcl.codec.utf8String.toBits(s);
}



describe("macaroon", function() {
	it("loads the macaroon library in a usable state", function() {
		var rootKey = strBitArray("secret");
		var m = macaroon.newMacaroon(rootKey, "some id", "a location");
		assert.equal(m.location(), "a location");
		assert.equal(m.id(), "some id");
		assert.equal(sjcl.codec.hex.fromBits(m.signature()), "d916ce6f9b62dc4a080ce5d4a660956471f19b860da4242b0852727331c1033d");
		var obj = macaroon.export(m);
		assert.deepEqual(obj, {
			location: "a location",
			identifier: "some id",
			signature: "d916ce6f9b62dc4a080ce5d4a660956471f19b860da4242b0852727331c1033d",
			caveats: [],
		});

		m.verify(rootKey, function() {
    	return "condition is never true";
    }, null);
	});
});
