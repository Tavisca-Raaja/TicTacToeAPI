using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace TicTacToe.DataAccess
{
    public class UserRegistration
    {
        private SqlConnection _Connection;
        private SqlConnectionStringBuilder _Connector;
        public UserRegistration()
        {
            _Connection = new SqlConnection();
            try
            {
                _Connector = new SqlConnectionStringBuilder();
                _Connector.DataSource = "localhost";
                _Connector.UserID = "sa";
                _Connector.Password = "test123!@#";
                _Connector.InitialCatalog = "Gaming";
            }
            catch (Exception e)
            {
             
            }
        }

        //updating registered details in database
        public bool UpdateNewUser(User newUser)
        {
            if (ValidateUserName(newUser.UserName))
            {
                using (_Connection = new SqlConnection(_Connector.ConnectionString))
                {
                    _Connection.Open();
                    string InsertQuery = "Insert into UserDetails (FirstName,LastName,UserName)values(@firstName,@lastName,@userName)";
                    using (SqlCommand command = new SqlCommand(InsertQuery, _Connection))
                    {
                        command.Parameters.AddWithValue("@firstName", newUser.FirstName);
                        command.Parameters.AddWithValue("@lastName", newUser.LastName);
                        command.Parameters.AddWithValue("@userName", newUser.UserName);
                        command.ExecuteNonQuery();
                    }
                }
            }
            else
                return false;
            return true;
        }

        public bool ValidateUserName(string userName)
        {
            using (_Connection = new SqlConnection(_Connector.ConnectionString))
            {
                _Connection.Open();
                string SelectQuery = "select * from UserDetails where UserName=(@newUserName)";
                using (SqlCommand command = new SqlCommand(SelectQuery, _Connection))
                {
                    command.Parameters.AddWithValue("@newUserName", userName);
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                        return false;
                   
                }
                return true;
            }
        }

        public bool GenerateToken(string userName)
        {
            using (_Connection = new SqlConnection(_Connector.ConnectionString))
            {
                _Connection.Open();
                string updateQuery = "update UserDetails set AccessToken=@accessKey where UserName=@uName";
                string SelectQuery = "select AccessToken from UserDetails where UserName=@uName";
                using (SqlCommand command = new SqlCommand(SelectQuery, _Connection))
                {
                    command.Parameters.AddWithValue("@uName", userName);
                    string alreadyGenerated = command.ExecuteScalar().ToString();
                  if (alreadyGenerated!="")
                        return false;
                }
                using (SqlCommand command = new SqlCommand(updateQuery, _Connection))
                {
                    command.Parameters.AddWithValue("@accessKey", userName + 10);
                    command.Parameters.AddWithValue("@uName", userName);
                    command.ExecuteNonQuery();
                    return true;
                }
            }
        }

        public bool ValidateAccessToken(string accessToken)
        {
            using (_Connection = new SqlConnection(_Connector.ConnectionString))
            {
                _Connection.Open();
                string SelectQuery = "select * from UserDetails where AccessToken=@accessKey";
                using (SqlCommand command = new SqlCommand(SelectQuery, _Connection))
                {
                    command.Parameters.AddWithValue("@accesskey",accessToken);
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                        return true;
                }
                return false;
            }
            }
    }
}
