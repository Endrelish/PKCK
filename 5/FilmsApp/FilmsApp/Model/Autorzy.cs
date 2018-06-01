using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Autorzy", Namespace = "http://www.example.org/baza")]
    public class Autorzy
    {
        [XmlElement(ElementName = "Autor", Namespace = "http://www.example.org/baza")]
        public List<Autor> Autor { get; set; }
    }
}
