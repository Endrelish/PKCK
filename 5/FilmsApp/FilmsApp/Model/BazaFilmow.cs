using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "BazaFilmów", Namespace = "http://www.example.org/baza")]
    public class BazaFilmow
    {
        [XmlElement(ElementName = "Autorzy", Namespace = "http://www.example.org/baza")]
        public Autorzy Autorzy { get; set; }
        [XmlElement(ElementName = "Gatunki", Namespace = "http://www.example.org/baza")]
        public Gatunki Gatunki { get; set; }
        [XmlElement(ElementName = "Filmy", Namespace = "http://www.example.org/baza")]
        public Filmy Filmy { get; set; }
        [XmlAttribute(AttributeName = "xmlns")]
        public string Xmlns { get; set; }
        [XmlAttribute(AttributeName = "xsi", Namespace = "http://www.w3.org/2000/xmlns/")]
        public string Xsi { get; set; }
        [XmlAttribute(AttributeName = "schemaLocation", Namespace = "http://www.w3.org/2001/XMLSchema-instance")]
        public string SchemaLocation { get; set; }
    }
}
