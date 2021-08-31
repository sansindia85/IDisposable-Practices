using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Threading;
using WordCounter.ModernApp.Processors;

namespace WordCounter.ModernApp.IO
{
    public class FolderWatcher
    {
        private readonly BookFeedProcessor _processor;
        private readonly ILogger _logger;
        private FileSystemWatcher _watcher;
        
        public FolderWatcher(BookFeedProcessor processor, ILogger<FolderWatcher> logger)
        {
            _processor = processor;
            _logger = logger;
        }

        public BookFeedProcessor BookFeedProcessor
        {
            get => default;
            set
            {
            }
        }

        public void Start(string path, string filter)
        {
            var fullPath = Path.GetFullPath(path);
            _watcher = new FileSystemWatcher(fullPath, filter);
            _watcher.Created += async (x, y) =>
            {
                //HACK - let the file write finish:
                Thread.Sleep(1000);
                Console.WriteLine("New file created: " + y.Name);
                await _processor.ProcessFile(y.FullPath);
            };
            _watcher.EnableRaisingEvents = true;
            _logger.LogInformation($"Listening on {path}");
        }

        public void Stop()
        {
            if (_watcher != null)
            {
                _watcher.EnableRaisingEvents = false;
            }
        }

        
    }
}