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
        [XmlElement(ElementName = "Imię", Namespace = "http://www.example.org/baza")]
        public List<string> Imie { get; set; }
        [XmlElement(ElementName = "Nazwisko", Namespace = "http://www.example.org/baza")]
        public string Nazwisko { get; set; }

        public override string ToString()
        {
            return Imie.First()+ " " + Nazwisko;
        }
    }
}
