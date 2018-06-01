using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Reżyser", Namespace = "http://www.example.org/baza")]
    public class Rezyser
    {
        [XmlElement(ElementName = "Imie", Namespace = "http://www.example.org/baza")]
        public List<string> Imię { get; set; }
        [XmlElement(ElementName = "Nazwisko", Namespace = "http://www.example.org/baza")]
        public string Nazwisko { get; set; }
    }
}
