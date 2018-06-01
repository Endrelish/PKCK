using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Filmy", Namespace = "http://www.example.org/baza")]
    public class Filmy
    {
        [XmlElement(ElementName = "Film", Namespace = "http://www.example.org/baza")]
        public List<Film> Film { get; set; }
    }
}
