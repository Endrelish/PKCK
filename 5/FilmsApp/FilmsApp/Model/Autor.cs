using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Autor", Namespace = "http://www.example.org/baza")]
    public class Autor
    {
        [XmlElement(ElementName = "Imię", Namespace = "http://www.example.org/baza")]
        public string Imie { get; set; }
        [XmlElement(ElementName = "Nazwisko", Namespace = "http://www.example.org/baza")]
        public string Nazwisko { get; set; }
        [XmlElement(ElementName = "Indeks", Namespace = "http://www.example.org/baza")]
        public string Indeks { get; set; }
    }
}
