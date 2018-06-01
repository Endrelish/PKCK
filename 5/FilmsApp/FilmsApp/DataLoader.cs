using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using FilmsApp.Model;

namespace FilmsApp
{
    public class DataLoader
    {
        public FileInfo XmlFile { get; set; }
        public FileInfo SchemaFile { get; set; }
        XmlSerializer Serializer { get; set; }

        public DataLoader(string xmlFile, string schemaFile)
        {
            XmlFile = new FileInfo(xmlFile);
            SchemaFile = new FileInfo(schemaFile);
            Serializer = new XmlSerializer(typeof(BazaFilmow));
        }

        public BazaFilmow LoadData()
        {
            BazaFilmow bazaFilmow = null;
            if (XmlFile.Exists)
            {
                using (TextReader textReader = new StreamReader(XmlFile.FullName))
                {
                    bazaFilmow = (BazaFilmow)Serializer.Deserialize(textReader);
                    textReader.Close();
                    
                }
            }
            else
            {
                throw new IOException();
            }

            return bazaFilmow;
        }

        public void SaveData(BazaFilmow bazaFilmow)
        {
            if (XmlFile.Exists) XmlFile.Delete();

            Stream stream = new FileStream(XmlFile.FullName, FileMode.Create);
            Serializer.Serialize(stream, bazaFilmow);
            stream.Close();
        }

        public bool ValidateXmlSchema(BazaFilmow bazaFilmow)
        {
            try
            {
                XmlDocument xmld = new XmlDocument();
                string xmlText = File.ReadAllText(XmlFile.Name);
                xmld.LoadXml(xmlText);
                xmld.Schemas.Add("http://www.example.org/baza", SchemaFile.FullName);
                xmld.Validate(ValidationCallBack);
                return true;
            }
            catch
            {
                return false;
            }
        }
        private void ValidationCallBack(object sender, ValidationEventArgs e)
        {

            throw new Exception();
        }
    }
}
