using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "BazaFilmów", Namespace = "http://www.example.org/baza")]
    public class BazaFilmow
    {
        [XmlIgnore]
        private Filmy _Filmy;


        [XmlElement(ElementName = "Autorzy", Namespace = "http://www.example.org/baza")]
        public Autorzy Autorzy { get; set; }

        [XmlElement(ElementName = "Gatunki", Namespace = "http://www.example.org/baza")]
        public Gatunki Gatunki { get; set; }

        [XmlElement(ElementName = "Filmy", Namespace = "http://www.example.org/baza")]
        public Filmy Filmy
        {
            get { return this._Filmy; }
            set
            {
                this._Filmy = value;
                    Filmy.Film.ForEach(f => f.ListOfGatunek = this.Gatunki.Gatunek);
            }
        }

        [XmlAttribute(AttributeName = "xmlns")]
        public string Xmlns { get; set; }
    }
}
