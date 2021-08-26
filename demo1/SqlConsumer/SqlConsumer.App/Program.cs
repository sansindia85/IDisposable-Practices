using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace SqlConsumer.App
{
    class Program
    {
        static void Main(string[] args)
        {
            var config = new ConfigurationBuilder()
                 .AddJsonFile("appSettings.json")
                 .Build();

            var services = new ServiceCollection()
                .AddSingleton<IConfiguration>(config)
                .AddTransient<DatabaseState>()
                .AddTransient<Processor>()
                .BuildServiceProvider();

            for (int i = 0; i < 1000; i++)
            {
                var processor = services.GetRequiredService<Processor>();
                try
                {
                    processor.Run();
                }
                catch(Exception ex)
                {
                    Console.WriteLine($"EX: {ex}");
                }
            }
            Console.WriteLine("Completed!");
            Console.ReadLine();
        }
    }
}
