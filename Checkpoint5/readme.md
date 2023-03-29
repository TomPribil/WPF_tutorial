# Část 5
## MainWindow.xaml.cs
Vytvoříme metody pro načtení všech piv při spuštění aplikace a upravíme Text box tak, aby následně filtroval načtená data.

    public partial class MainWindow : Window
        {
            private PivoContext _context = new PivoContext();
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
