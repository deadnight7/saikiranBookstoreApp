//import {Builder, By, Key} from 'selenium-webdriver'

let assert = require ("chai").assert
let Builder = require("selenium-webdriver").Builder;
let By = require("selenium-webdriver").By;
let Key = require("selenium-webdriver").Key;
let until = require("selenium-webdriver").until

describe("Order Processing", function () {

    //Setting global timeout
    this.timeout(60 * 10 * 1000) //6 minutes - 60 Sec * 10 minutes * 1000 millis

    let driver ;
    describe("Order Booking", function () {

        before (async () => {

            let capabilities = {
                'browserName' : 'Chrome',
                'browser_version' : '72.0',
                'os' : 'Windows',
                'os_version' : '10',
                'resolution' : '1920x1080',
                'browserstack.user' : 'chirag160',
                'browserstack.key' : 'x7TyqYuzzw6vd8dyVTLm',
                'name' : 'Test '+new Date().getTime()
            }

            //
            // driver = await new Builder().
            //                     usingServer('http://hub-cloud.browserstack.com/wd/hub').
            //                     withCapabilities(capabilities).
            //                     build();

            driver = await new Builder().forBrowser("chrome").build()
            driver.manage().window().setSize(1280, 720);
        })

        it("Should be able to search orders", async function () {
            //driver = await new Builder().forBrowser("chrome").build()
            await driver.get("http://localhost/saikiranBookstoreApp")
            let title = await driver.getTitle();
            assert(title == "SaiKiran BookStores", "verify title")
        })

        it("Should be able to search for Products", async function (){

            await driver.findElement(By.xpath("//*[@id='search']")).sendKeys("Assassins Creed")
            await driver.sleep(3000)

            //Click Product
            await driver.findElement(By.xpath("//*[@id=\"loadSearches\"]//h3//span[text()=' Assassins Creed III']")).click()

            //Click Buy Button - //*[@id="buy"]
            await driver.findElement(By.xpath("//*[@id=\"buy\"]")).click()
            await driver.findElement(By.xpath("//*[@id=\"loginBtn\"]")).click()

            await driver.sleep(3000)

        })

        //Login
        it ("Should be able to login to Bookstore", async () => {

            await driver.findElement(By.xpath("//*[@name=\"email\"]")).sendKeys("dead.night7@gmail.com")
            await driver.findElement(By.xpath("//*[@name=\"pass\"]")).sendKeys("123456789" + Key.ENTER)

            //Verify UserName exists
            await driver.wait(until.elementLocated(By.xpath("//*[text()='Chirag Pandit']")), 10000);

        })

        after (async () => {
            //await driver.quit()
        })

    })

})
