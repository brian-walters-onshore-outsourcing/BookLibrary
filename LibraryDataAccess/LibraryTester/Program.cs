using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using LibraryCommon;
using LibraryDataAccess;


namespace LibraryTester
{
    class Program
    {
        static void testauthors(IDbConnection conn)
        {
            // create
            // find
            // create
            // create
            // obtaincount
            // get
            // update just
            // update safe success
            // update safe failure
        }
        static void testbooks(IDbConnection conn)
        {

        }

        static void testborrowers(IDbConnection conn)
        {

        }
        static void testgenres(IDbConnection conn)
        {

        }
        static void testroles(IDbConnection conn)
        {

        }
        static void testTypeA(IDbConnection conn)
        {

        }
        static void testTypeB(IDbConnection conn)
        {

        }
        static void testTypeC(IDbConnection conn)
        {

        }
        static void testTypeD(IDbConnection conn)
        {

        }

        static void testConnection()
        {
            LibraryBusinessLogicLayer.Context ctx =
                new LibraryBusinessLogicLayer.Context();
        }
        static void Main(string[] args)
        {
            string connectionstring = @"Data Source=.\sqlexpress;Initial Catalog=Library;Integrated Security=True";

            using (System.Data.SqlClient.SqlConnection connection =
                new System.Data.SqlClient.SqlConnection(connectionstring))
            {
                testConnection();
                testauthors(connection);
                testbooks(connection);
                testborrowers(connection);
                testgenres(connection);
                testroles(connection);
                testTypeA(connection);
                testTypeB(connection);
                testTypeC(connection);
                testTypeD(connection);

            }

        }
    }
}
