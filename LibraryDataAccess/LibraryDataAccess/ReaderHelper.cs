using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace LibraryDataAccess
{
    public static class ReaderHelper
    {
        public static int GetNullableInt32(this IDataReader reader, int ordinal, int defaultValue=0)
        {
            if (reader.IsDBNull(ordinal))
            {
                return defaultValue;
            }
            else
            {
                return reader.GetInt32(ordinal);
            }
        }

        public static decimal GetNullableDecimal(this IDataReader reader, int ordinal, decimal defaultValue = 0M)
        {
            if (reader.IsDBNull(ordinal))
            {
                return defaultValue;
            }
            else
            {
                return reader.GetDecimal(ordinal);
            }
        }

        public static DateTime GetNullableDateTime(this IDataReader reader, int ordinal, DateTime defaultValue=default(DateTime))
        {
            if (reader.IsDBNull(ordinal))
            {
                return defaultValue;
            }
            else
            {
                return reader.GetDateTime(ordinal);
            }
        }

        public static string GetNullableString(this IDataReader reader, int ordinal, string defaultValue = "")
        {
            if (reader.IsDBNull(ordinal))
            {
                return defaultValue;
            }
            else
            {
                return reader.GetString(ordinal);
            }
        }

    }
}
