using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Kraje", Namespace = "http://www.example.org/baza")]
    public class Kraje
    {
        [XmlElement(ElementName = "Kraj", Namespace = "http://www.example.org/baza")]
        public List<string> Kraj { get; set; }
    }
}
