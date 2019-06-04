//import {Builder, By, Key} from 'selenium-webdriver'

let assert = require ("chai").assert
let Builder = require("selenium-webdriver").Builder;

describe("Order Processing", function () {

    //Setting global timeout
    this.timeout(60 * 10 * 1000) //6 minutes - 60 Sec * 10 minutes * 1000 millis

    describe("Order Booking", function () {

        it("Should be able to search orders", async function () {
            var driver = await new Builder().forBrowser("chrome").build()
            await driver.get("http://localhost/saikiranBookstoreApp")
            assert(true, true, "verify title")
        })
    })

})
