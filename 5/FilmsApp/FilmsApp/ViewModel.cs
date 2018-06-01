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

        public List<Film> Films { get; set; }
        private Film selectedFilm;

        public Film SelectedFilm
        {
            get { return selectedFilm; }
            set
            {
                selectedFilm = value;
                RaisePropertyChanged("SelectedFilm");
            }
        }

        public ICommand Click_SaveFilm { get; }
        public ICommand Click_GenerateSvg { get; }
        public ICommand Click_GenerateXhtml { get; }

        private BazaFilmow baza { get; set; }
        private DataLoader dataLoader { get; set; }

        public ViewModel()
        {
            SelectedElement = "Wszystkie filmy";
             int x = 0;
            dataLoader = new DataLoader("films.xml", "films1.xsd");
            baza = dataLoader.LoadData();
            // bool isValid = d.ValidateXmlSchema(b);
            Films = baza.Filmy.Film;

            Click_SaveFilm = new DelegateCommand(saveFilm);
            Click_GenerateSvg = new DelegateCommand(generateSvg);
            Click_GenerateXhtml = new DelegateCommand(generateXhtml);
            Directory.CreateDirectory("reports");
        }

        private void saveFilm()
        {
            dataLoader.SaveData(baza);
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

