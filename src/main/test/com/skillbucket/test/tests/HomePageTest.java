package com.skillbucket.test.tests;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class HomePageTest {
	
	@Test
	public void testLogIn() throws InterruptedException {
	  // Optional, if not specified, WebDriver will search your path for chromedriver. /Applications
	  System.setProperty("webdriver.chrome.driver", "/Applications/chromedriver");

	  WebDriver driver = new ChromeDriver();
	  driver.get("http://skillbucket-angelarosario.rhcloud.com");
	  
	  Thread.sleep(2000);  // Let the user actually see something!
	  
	  WebElement loginLink = driver.findElement(By.linkText("Log in"));
	  loginLink.click();
	  Thread.sleep(2000);  // Let the user actually see something!
	  
	  WebElement username = driver.findElement(By.name("username"));
	  username.sendKeys("angelamanila");
	  
	  WebElement password = driver.findElement(By.name("password"));
	  password.sendKeys("walalang");
	  
	  WebElement submit = driver.findElement(By.cssSelector("button[type=submit]"));
	  submit.click();
	  
	  driver.quit();
	}

}
