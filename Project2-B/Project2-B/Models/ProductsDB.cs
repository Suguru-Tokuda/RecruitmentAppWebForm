using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project2_B.Models
{
    [DataObject(true)]
    public class ProductsDB
    {
        public static DataSet getProducts()
        {
            //List<Product> retVal = new List<Product>();
            //string sql = "SELECT * FROM products ORDER BY productCode";

            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {

                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM products", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                //using (SqlCommand cmd = new SqlCommand(sql, con))
                //{
                //    con.Open();
                //    SqlDataReader dr = cmd.ExecuteReader();
                //    Product product;
                //    while (dr.Read())
                //    {
                //        product = new Product();
                //        product.productCode = dr["productCode"].ToString();
                //        product.name = dr["name"].ToString();
                //        product.version = Convert.ToDecimal(dr["version"].ToString());
                //        product.releaseDate = Convert.ToDateTime(dr["releaseDate"].ToString());
                //        retVal.Add(product);
                //    }
                //    dr.Close();
                //}
                return ds;
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void insertProduct(Product product)
        {
            string sql = "INSERT INTO products "
                         + "(productCode, name, version, releaseDate) "
                         + "VALUES (@productCode, @name, @version, @releaseDate)";
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("productCode", product.productCode);
                    cmd.Parameters.AddWithValue("name", product.name);
                    cmd.Parameters.AddWithValue("version", product.version);
                    cmd.Parameters.AddWithValue("releaseDate", product.releaseDate);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int updateProduct(Product original_product, Product product)
        {
            int updateCount = 0;
            string sql = "UPDATE products "
                        + "SET name = @name "
                        + "WHERE productCode = @original_productCode "
                        + "AND name = @original_name "
                        + "AND version = @original_version "
                        + "AND releaseDate = @original_releaseDate";
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("productCode", product.productCode);
                    cmd.Parameters.AddWithValue("name", product.name);
                    cmd.Parameters.AddWithValue("version", product.version);
                    cmd.Parameters.AddWithValue("releaseDate", product.releaseDate);
                    cmd.Parameters.AddWithValue("original_productCode", original_product.productCode);
                    cmd.Parameters.AddWithValue("original_name", original_product.name);
                    cmd.Parameters.AddWithValue("original_version", original_product.version);
                    cmd.Parameters.AddWithValue("original_releaseDate", original_product.releaseDate);
                    con.Open();
                    updateCount = cmd.ExecuteNonQuery();
                }
            }
            return updateCount;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static int deleteProduct(Product product)
        {
            int deleteCount = 0;
            string sql = "DELETE FROM products "
                         + "WHERE productCode = @productCode";
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("productCode", product.productCode);
                    con.Open();
                    deleteCount = cmd.ExecuteNonQuery();
                }
            }
            return deleteCount;
        }

        private static String getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }





    }
}