using Microsoft.Extensions.Configuration;
using System;
using SqlConsumer.Core;

namespace SqlConsumer.App
{
    class Program
    {
        private static DatabaseState _databaseState;
        private static IConfiguration _config;
        
        static void Main()
        {
            _config = new ConfigurationBuilder()
                 .AddJsonFile("appSettings.json")
                 .Build();

            Console.WriteLine("'g' to Get Date; 'gc' to Garbage Collect; 'x' to Exit");
            var command = "";
            while (command != "x")
            {
                command = Console.ReadLine();
                switch (command)
                {
                    case "g":
                        GetDate();
                        break;

                    case "gc":
                        GC.Collect(2, GCCollectionMode.Forced, blocking: true, compacting: true);
                        Console.WriteLine("GC done");
                        break;
                }
            }
        }

        private static void GetDate()
        {
            /*
            if (_databaseState == null)
            {
                _databaseState = new DatabaseState(_config);
            }
            Console.WriteLine(_databaseState.GetDate());
            */
            
            /*
            var localDatabaseState = new DatabaseState(_config);
            Console.WriteLine(localDatabaseState.GetDate());
            */

            using (var localDatabaseState = new DatabaseState(_config))
            {
                Console.WriteLine(localDatabaseState.GetDate());
            }
        }
    }
}
