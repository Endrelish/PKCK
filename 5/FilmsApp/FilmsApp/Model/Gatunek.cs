using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Gatunek", Namespace = "http://www.example.org/baza")]
    public class Gatunek
    {
        [XmlAttribute(AttributeName = "Nazwa")]
        public string Nazwa { get; set; }
        [XmlAttribute(AttributeName = "Id")]
        public string Id { get; set; }
    }
}
