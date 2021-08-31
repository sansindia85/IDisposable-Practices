using System;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace SqlConsumer.Core
{
    public class DatabaseState : IDisposable
    {
        private bool _disposed;
        protected SqlConnection Connection;
        private readonly string _connectionString;
       
        public DatabaseState(IConfiguration config) : this(config.GetConnectionString("db")) { }

        public DatabaseState(string connectionString)
        {
            _connectionString = connectionString;
        }

        public virtual string GetDate()
        {
            if (_disposed)
            {
                throw new ObjectDisposedException("DatabaseState");
            }
                
            if (Connection == null)
            {
                Connection = new SqlConnection(_connectionString);
                Connection.Open();
            }
            using (var command = Connection.CreateCommand())
            {
                command.CommandText = "SELECT getdate()";
                return command.ExecuteScalar().ToString();
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (_disposed)
                return;

            if (disposing)
            {
                if (Connection != null)
                {
                    Connection.Dispose();
                    Connection = null;
                }

                _disposed = true;
            }
        }
    }
}
