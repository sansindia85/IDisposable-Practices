using System;
using System.Diagnostics;

namespace SqlConsumer.App
{
    public class Processor
    {
        private readonly DatabaseState _database;

        public Processor(DatabaseState database)
        {
            _database = database;
        }

        public void Run()
        {
            Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}]: {_database.GetDate()}");
        }
    }
}
