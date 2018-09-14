using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace TicTacToe.DataAccess
{
    public class Logger
    {
        private static Logger _instance;
        private SqlConnection _Connection;
        private SqlConnectionStringBuilder _Connector;

        //singleton
        public static Logger Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new Logger();
                return _instance;
            }
        }
        public Logger()
        {
            _Connection = new SqlConnection();
            _Connector = new SqlConnectionStringBuilder();
            _Connector.DataSource = "localhost";
            _Connector.UserID = "sa";
            _Connector.Password = "test123!@#";
            _Connector.InitialCatalog = "Gaming";
        }
        public void LogException(string request, string response, string exception, string comment)
        { 
            using (_Connection = new SqlConnection(_Connector.ConnectionString))
            {
                _Connection.Open();
                string InsertQuery = "Insert into StatusLogger values(@userRequest,@userResponse,@requestException,@requestComment)";
                using (SqlCommand command = new SqlCommand(InsertQuery, _Connection))
                {
                    command.Parameters.AddWithValue("@userRequest", request);
                    command.Parameters.AddWithValue("@userResponse", response);
                    command.Parameters.AddWithValue("@requestException", exception);
                    command.Parameters.AddWithValue("@requestComment", comment);
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}
