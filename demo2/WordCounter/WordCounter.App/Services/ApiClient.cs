using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Threading.Tasks;
using WordCounter.App.ServiceReferences;

namespace WordCounter.App.Services
{
    public class ApiClient
    {
        private readonly IConfiguration _config;
        
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
            var httpClient = new HttpClient();
            var apiClient = new WordCounterApiClient(_config["WordCounter:Api:Url"], httpClient);
            return await apiClient.WordCountAsync(model);
        }
    }
}
