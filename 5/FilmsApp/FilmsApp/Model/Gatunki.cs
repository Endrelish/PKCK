using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Gatunki", Namespace = "http://www.example.org/baza")]
    public class Gatunki
    {
        [XmlElement(ElementName = "Gatunek", Namespace = "http://www.example.org/baza")]
        public List<Gatunek> Gatunek { get; set; }
    }
}
