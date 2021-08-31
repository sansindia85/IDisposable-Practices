using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Threading.Tasks;
using WordCounter.ModernApp.ServiceReferences;

namespace WordCounter.ModernApp.Services
{
    public class ApiClient 
    {
        private readonly IConfiguration _config;
        private IHttpClientFactory _httpClientFactory;

        public ApiClient(IConfiguration config, IHttpClientFactory httpClientFactory)
        {
            _config = config;
            _httpClientFactory = httpClientFactory;
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
            var httpClient = _httpClientFactory.CreateClient();
            var apiClient = new WordCounterApiClient(_config["WordCounter:Api:Url"], httpClient);
            return await apiClient.WordCountAsync(model);
        }
    }
}
