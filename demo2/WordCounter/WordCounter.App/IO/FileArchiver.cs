using System.IO;

namespace WordCounter.App.IO
{
    public class FileArchiver
    {
        public void CopyFile(string sourcePath, string targetPath)
        {
            var inputStream = File.OpenRead(sourcePath);
            var outputStream = File.Create(targetPath);
            inputStream.CopyTo(outputStream);
        }
    }
}
