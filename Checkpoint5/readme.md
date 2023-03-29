# Část 5
## MainWindow.xaml.cs
Vytvoříme metody pro načtení všech piv při spuštění aplikace a upravíme Text box tak, aby následně filtroval načtená data.

    public partial class MainWindow : Window
        {
            private PivoContext _context = new PivoContext();
            public ObservableCollection<Pivo> FilteredPiva { get; set; } = new ObservableCollection<Pivo>();

            public MainWindow()
            {
                InitializeComponent();
                LoadPiva();
                DataContext = this;
            }

            private void LoadPiva()
            {
                var query = _context.Piva
                    .Include(p => p.Stupnovitost)
                    .Include(p => p.Barva)
                    .Include(p => p.TypPiva)
                    .Include(p => p.Pivovary)
                    .ToList();

                FilteredPiva.Clear();
                foreach (var pivo in query)
                {
                    FilteredPiva.Add(pivo);
                }
            }
            
Kód pro samotné filtrování piv, filtr bude vracet položky, u kterých se bude input rovnat hodnotě z jakéhokoliv sloupce.

    private void TxtFilter_OnKeyDown(object sender, KeyEventArgs e)
            {
                if (e.Key == Key.Enter)
                {
                    string filter = txtFilter.Text;

                    var query = from p in _context.Piva
                            .Include(p => p.Stupnovitost)
                            .Include(p => p.Barva)
                            .Include(p => p.TypPiva)
                            .Include(p => p.Pivovary)
                        where p.Nazev.Contains(filter)
                              || p.Barva.Nazev.Contains(filter)
                              || p.TypPiva.Nazev.Contains(filter)
                              || p.Pivovary.Nazev.Contains(filter)
                        select p;


                    FilteredPiva.Clear();
                    foreach (var pivo in query)
                    {
                        FilteredPiva.Add(pivo);
                    }
                }
            }
