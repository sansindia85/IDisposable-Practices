using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Diagnostics;

namespace SqlConsumer
{
    public class DatabaseState : IDisposable
    {
        private readonly string _connectionString;
        private SqlConnection _connection;

        public DatabaseState(IConfiguration config) : this(config.GetConnectionString("db")) { }

        public DatabaseState(string connectionString)
        {
            _connectionString = connectionString;
        }

        public string GetDate()
        {
            if (_connection == null)
            {
                _connection = new SqlConnection(_connectionString);
                _connection.Open();
            }
            using (var command = _connection.CreateCommand())
            {
                command.CommandText = "SELECT getdate()";
                return command.ExecuteScalar().ToString();
            }
        }

        public void Dispose()
        {
            Debug.WriteLine($"[{DateTime.Now.ToLongTimeString()}] Disposing; SqlConnection: {_connection.GetHashCode()}");
            _connection.Close();
            _connection.Dispose();
            _connection = null;
        }
    }
}
