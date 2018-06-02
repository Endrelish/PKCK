using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using FilmsApp.Model;
using Saxon.Api;

namespace FilmsApp
{
    public class ViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public List<string> Elements { get; set; } = new List<string>() {"Wszystkie filmy", "Dodaj film"};
        private string selectedElement;

        private Film newFilm;

        public Film NewFilm
        {
            get { return newFilm; }
            set
            {
                newFilm = value;
                RaisePropertyChanged("NewFilm");
            }
        }

        public string SelectedElement
        {
            get { return selectedElement; }
            set
            {
                selectedElement = value;

                if (value == "Wszystkie filmy")
                {
                    Baza = dataLoader?.LoadData();
                    VFilms = Visibility.Visible;
                    VAddFilm = Visibility.Collapsed;



                }
                else if (value == "Dodaj film")
                {

                    VFilms = Visibility.Collapsed;
                    VAddFilm = Visibility.Visible;
                    createNewFilmObject();
                    RaisePropertyChanged("NewFilm");

                }

                RaisePropertyChanged("SelectedElement");
                RaisePropertyChanged("VFilms");
                RaisePropertyChanged("VAddFilm");
            }
        }

        private Visibility vFilms;

        public Visibility VFilms
        {
            get { return vFilms; }
            private set
            {
                RaisePropertyChanged("VFilms");
                vFilms = value;
            }
        }

        private Visibility vAddFilm;

        public Visibility VAddFilm
        {
            get { return vAddFilm; }
            private set
            {
                RaisePropertyChanged("VAddFilm");
                vAddFilm = value;
            }
        }

        private void RaisePropertyChanged(string propertyName_)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName_));
        }

        public ObservableCollection<Film> Films { get; set; } = new ObservableCollection<Film>();
        private Film selectedFilm;

        public Film SelectedFilm
        {
            get { return selectedFilm; }
            set
            {
                selectedFilm = value;
                RaisePropertyChanged("SelectedFilm");
                RaisePropertyChanged("SelectedFilmCountries");
                RaisePropertyChanged("SelectedFilmDirectorNames");


            }
        }
        public string SelectedFilmCountries
        {
            get
            {
                return String.Join(" ",selectedFilm?.Kraje);
            }
            set
            {
                selectedFilm.Kraje.Kraj = value.Split(null).ToList();
                RaisePropertyChanged("SelectedFilmCountries");
            }
        }

        public string SelectedFilmDirectorNames
        {
            get { return selectedFilm !=null ? String.Join(" ", selectedFilm?.Rezyser?.Imie) : null;}
            set
            {
                selectedFilm.Rezyser.Imie = value.Split(null).ToList();
                RaisePropertyChanged("SelectedFilmDirectorNames");
            }
        }

        public string NewFilmCountries
        {
            get
            {
                return String.Join(" ", newFilm?.Kraje);
            }
            set
            {
                newFilm.Kraje.Kraj = value.Split(null).ToList();
                RaisePropertyChanged("NewFilmCountries");
            }
        }

        public string NewFilmDirectorNames
        {
            get { return newFilm != null ? String.Join(" ", newFilm?.Rezyser?.Imie) : null; }
            set
            {
                newFilm.Rezyser.Imie = value.Split(null).ToList();
                RaisePropertyChanged("NewFilmDirectorNames");
            }
        }

        public ICommand Click_SaveFilm { get; }
        public ICommand Click_GenerateSvg { get; }
        public ICommand Click_GenerateXhtml { get; }
        public ICommand Click_AddFilm { get; }

        public BazaFilmow Baza { get; set; }
        private DataLoader dataLoader { get; set; }
        public List<Gatunek> Genres { get; set; }
        public ViewModel()
        {
            SelectedElement = "Wszystkie filmy";
             int x = 0;
            dataLoader = new DataLoader("films.xml", "films1.xsd");
            Baza = dataLoader.LoadData();
            Genres = Baza.Gatunki.Gatunek;
            // bool isValid = d.ValidateXmlSchema(b);
            Films = new ObservableCollection<Film>(Baza.Filmy.Film);

            Click_SaveFilm = new DelegateCommand(saveFilm);
            Click_AddFilm = new DelegateCommand(addFilm);
            Click_GenerateSvg = new DelegateCommand(generateSvg);
            Click_GenerateXhtml = new DelegateCommand(generateXhtml);
            Directory.CreateDirectory("reports");
        }

        private void saveFilm()
        {
            RaisePropertyChanged("SelectedFilmCountries");

            dataLoader.SaveData(Baza);
        }

        private void generateSvg()
        {
            transform(new FileInfo("pomocniczy.xsl"), new FileInfo("films.xml"), new FileInfo("result.xml"));
            transform(new FileInfo("svg.xsl"), new FileInfo("result.xml"), new FileInfo("reports/result.svg"));
        }

        private void generateXhtml()
        {
            transform(new FileInfo("pomocniczy.xsl"), new FileInfo("films.xml"), new FileInfo("result.xml"));
            transform(new FileInfo("xhtml.xsl"), new FileInfo("result.xml"), new FileInfo("reports/pomocniczy.xhtml"));
        }

        private void createNewFilmObject()
        {
            newFilm = new Film();
            for (int i = 0; i < 3; i++)
            {
                newFilm.Kraje.Kraj.Add("");
            }
            newFilm.Rezyser.Imie.Add("");
            newFilm.ListOfGatunek = Genres;

        }

        private void addFilm()
        {
            SelectedElement = "Wszystkie filmy";
            Films.Add(newFilm);
            RaisePropertyChanged("Films");
            Baza.Filmy.Film = Films.ToList();
            dataLoader.SaveData(Baza);
        }

        private void transform(FileInfo xslt, FileInfo input, FileInfo output)
        {
         
        
            // Compile stylesheet
            var processor = new Processor();
            var compiler = processor.NewXsltCompiler();
            var executable = compiler.Compile(new Uri(xslt.FullName));

            // Do transformation to a destination
            var destination = new DomDestination();
            using (var inputStream = input.OpenRead())
            {
                var transformer = executable.Load();
                transformer.SetInputStream(inputStream, new Uri(input.DirectoryName));
                transformer.Run(destination);
            }

            // Save result to a file (or whatever else you wanna do)
            destination.XmlDocument.Save(output.FullName);

        }

    }
}

