using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace SqlConsumer.Core
{
    public class DatabaseState
    {
        protected SqlConnection Connection;
        private readonly string _connectionString;
       
        public DatabaseState(IConfiguration config) : this(config.GetConnectionString("db")) { }

        public DatabaseState(string connectionString)
        {
            _connectionString = connectionString;
        }

        public virtual string GetDate()
        {            
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
    }
}
