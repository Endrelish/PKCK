using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
        public List<string> Kraj { get; set; } = new List<string>();

        public override string ToString()
        {
            string kraje = "";
            Kraj.ForEach(x => kraje+=x+" ");
            return kraje;
        }
    }
}
