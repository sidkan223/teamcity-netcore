using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using NUnit.Framework;
using teamcity_netcore.Controllers;

namespace unit_tests
{
    [TestFixture]
    public class Tests
    {
        private Mock<ILogger<HomeController>> mockLogger;

        [SetUp]
        public void Setup()
        {
            mockLogger = new Mock<ILogger<HomeController>>();
        }

        [Test]
        public void Index_loads_expected_view()
        {
            var controller = new HomeController(mockLogger.Object);

            var result = controller.Index() as ViewResult;

            Assert.AreEqual("Index", result.ViewName);
        }
    }
}