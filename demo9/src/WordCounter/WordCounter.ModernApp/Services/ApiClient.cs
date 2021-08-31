using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Threading.Tasks;
using WordCounter.ModernApp.ServiceReferences;

namespace WordCounter.ModernApp.Services
{
    public class ApiClient 
    {
        private readonly IConfiguration _config;
        private HttpClient _httpClient = new();

        public ApiClient(IConfiguration config)
        {
            _config = config;
        }

        public async Task<int> GetWordCount(string input)
        {
            var model = new WordCountModel
            {
                Line = input
            };

            // HttpClientFactory manages connections -
            // HttpClient is disposable but you don't need to dispose it

            // ...
           
            var apiClient = new WordCounterApiClient(_config["WordCounter:Api:Url"], _httpClient);
            return await apiClient.WordCountAsync(model);
        }
    }
}
