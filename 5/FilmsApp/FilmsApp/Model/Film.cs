using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace FilmsApp.Model
{
    [XmlRoot(ElementName = "Film", Namespace = "http://www.example.org/baza")]
    public class Film
    {
        [XmlElement(ElementName = "Tytuł", Namespace = "http://www.example.org/baza")]
        public string Tytul { get; set; }

        [XmlElement(ElementName = "OryginalnyTytuł", Namespace = "http://www.example.org/baza")]
        public string OryginalnyTytul { get; set; }

        [XmlElement(ElementName = "DataPremiery", Namespace = "http://www.example.org/baza")]

        public string DataPremieryS { get; set; } = "1900-01-01";

        [XmlIgnore]
        public DateTime DataPremiery
        {
            get => DateTime.ParseExact(DataPremieryS, "yyyy-MM-dd",
                System.Globalization.CultureInfo.InvariantCulture);
            set => DataPremieryS = value.ToString("yyyy-MM-dd");
        }

        [XmlElement(ElementName = "Kraje", Namespace = "http://www.example.org/baza")]
        public Kraje Kraje { get; set; } = new Kraje();

        [XmlElement(ElementName = "Reżyser", Namespace = "http://www.example.org/baza")]
        public Rezyser Rezyser { get; set; } = new Rezyser();

        [XmlElement(ElementName = "Cena", Namespace = "http://www.example.org/baza")]
        public double Cena { get; set; }

        [XmlAttribute(AttributeName = "IdGatunku")]
        public string IdGatunku { get; set; }

        [XmlAttribute(AttributeName = "Ocena")]
        public int Ocena { get; set; }

        [XmlAttribute(AttributeName = "Id")]
        public long Id { get; set; }


        [XmlIgnore]
        public Gatunek Gatunek
        {
            get { return ListOfGatunek.FirstOrDefault(f => f.Id == IdGatunku); }
            set { this.IdGatunku = ListOfGatunek.FirstOrDefault(w => w.Nazwa == value.Nazwa).Id; }
        }

        [XmlIgnore] public List<Gatunek> ListOfGatunek { get; set; }
    }
}