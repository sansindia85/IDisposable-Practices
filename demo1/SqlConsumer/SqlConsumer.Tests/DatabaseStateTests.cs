using Microsoft.Extensions.Configuration;
using NUnit.Framework;
using System;
using System.Diagnostics;
using System.Threading;

namespace SqlConsumer.Tests
{
    public class GetDateTests
    {
        private string _connectionString;
        
        [SetUp]
        public void Setup()
        {
            var config = new ConfigurationBuilder()
                               .AddJsonFile("appSettings.json")
                               .Build();
            _connectionString = config.GetConnectionString("db-max"); //db-max or db
        }

        [Test]
        public void WithUsing()
        {
            using (var state = new DatabaseState(_connectionString))
            {
                Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] GetDate; {state.GetDate()}");
            }
            Wait();
        }

        [Test]
        public void WithoutUsing()
        {
            var state = new DatabaseState(_connectionString);
            Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] GetDate; {state.GetDate()}");
            Wait();
        }

        [Test]
        public void LoopWithUsing()
        {
            for (int i = 0; i < 1000; i++)
            {
                using var state = new DatabaseState(_connectionString);
                Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] GetDate; {state.GetDate()}");
            }
            Wait();
        }

        [Test]
        public void LoopWithoutUsing()
        {
            for (int i = 0; i < 1000; i++)
            {
                var state = new DatabaseState(_connectionString);
                Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] GetDate; {state.GetDate()}");
            }
            Wait();
        }

        [Test]
        public void LoopWithCatch()
        {
            try
            {
                for (int i = 0; i < 1000; i++)
                {
                    var state = new DatabaseState(_connectionString);
                    Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] GetDate; {state.GetDate()}");
                }
                Wait();
            }
            catch
            {
                GC.Collect();
            }
        }

        private void Wait()
        {
            Thread.Sleep(5 * 1000);
            Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] Waited.");
        }
    }
}