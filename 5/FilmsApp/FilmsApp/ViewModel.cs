using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using FilmsApp.Model;

namespace FilmsApp
{
    public class ViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public List<string> Elements { get; set; } = new List<string>(){"Wszystkie filmy", "Dodaj film"};
        private string selectedElement;

        public string SelectedElement
        {
            get { return selectedElement; }
            set
            {
                selectedElement = value;
                RaisePropertyChanged("SelectedElement");
                if (value == "Wszystkie filmy")
                {
                    VFilms = Visibility.Collapsed;
                    VAddFilm = Visibility.Visible;


                }
                else if (value == "Dodaj film")
                {
                    VFilms = Visibility.Visible;
                    VAddFilm = Visibility.Collapsed;

                }
            }
        }
        private Visibility vFilms;
        public Visibility VFilms { get { return vFilms; } private set { RaisePropertyChanged("VFilms"); vFilms = value; } }

        private Visibility vAddFilm;
        public Visibility VAddFilm { get { return vAddFilm; } private set { RaisePropertyChanged("VAddFilm"); vAddFilm = value; } }
        private void RaisePropertyChanged(string propertyName_)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName_));
        }

        public List<Film> Films { get; set; }
        private Film selectedFilm;

        public Film SelectedFilm
        {
            get { return selectedFilm;}
            set
            {
                selectedFilm = value;
                RaisePropertyChanged("SelectedFilm");
            }
        }


        public ViewModel()
        {
            DataLoader d = new DataLoader("films.xml", "films1.xsd");
            BazaFilmow b = d.LoadData();
            bool isValid = d.ValidateXmlSchema(b);
            Films = b.Filmy.Film;
            int x = 0;
        }
    }
}
