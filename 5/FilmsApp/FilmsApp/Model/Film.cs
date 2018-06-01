using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Film", Namespace = "http://www.example.org/baza")]
    public class Film
    {
        [XmlElement(ElementName = "Tytuł", Namespace = "http://www.example.org/baza")]
        public string Tytul { get; set; }
        [XmlElement(ElementName = "OryginalnyTytuł", Namespace = "http://www.example.org/baza")]
        public string OryginalnyTytuł { get; set; }
        [XmlElement(ElementName = "DataPremiery", Namespace = "http://www.example.org/baza")]
        public string DataPremiery { get; set; }
        [XmlElement(ElementName = "Kraje", Namespace = "http://www.example.org/baza")]
        public Kraje Kraje { get; set; }
        [XmlElement(ElementName = "Reżyser", Namespace = "http://www.example.org/baza")]
        public Rezyser Rezyser { get; set; }
        [XmlElement(ElementName = "Cena", Namespace = "http://www.example.org/baza")]
        public string Cena { get; set; }
        [XmlAttribute(AttributeName = "IdGatunku")]
        public string IdGatunku { get; set; }
        [XmlAttribute(AttributeName = "Ocena")]
        public string Ocena { get; set; }
    }
}
