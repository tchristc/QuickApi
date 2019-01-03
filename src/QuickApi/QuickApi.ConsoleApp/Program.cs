using QuickApi.Entities.Models;
using System;
using System.Linq;

namespace QuickApi.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            using (var ctx = new QuickApiDatabaseContext())
            {
                Console.WriteLine("Hello World!");
            }

            Console.ReadLine();
        }
    }
}
