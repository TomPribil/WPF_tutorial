# Část 6
## Vytvoření okna pro přidávání piv
Vytvoříme nové okno
## AddPivoWindow.xaml
  <Grid>
          <Grid.RowDefinitions>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="Auto"/>
          </Grid.RowDefinitions>
          <Grid.ColumnDefinitions>
              <ColumnDefinition Width="Auto"/>
              <ColumnDefinition Width="*"/>
          </Grid.ColumnDefinitions>

          <Label Grid.Row="0" Grid.Column="0" Content="Název:"/>
          <TextBox Grid.Row="0" Grid.Column="1" x:Name="txtNazev"/>

          <Label Grid.Row="1" Grid.Column="0" Content="Stupeň:"/>
          <ComboBox Grid.Row="1" Grid.Column="1" x:Name="cbStupnovitost"/>

          <Label Grid.Row="2" Grid.Column="0" Content="IBU:"/>
          <TextBox Grid.Row="2" Grid.Column="1" x:Name="txtIBU"/>

          <Label Grid.Row="3" Grid.Column="0" Content="Obsah alkoholu (%):"/>
          <TextBox Grid.Row="3" Grid.Column="1" x:Name="txtObsahAlkoholu"/>

          <Label Grid.Row="4" Grid.Column="0" Content="Barva:"/>
          <ComboBox Grid.Row="4" Grid.Column="1" x:Name="cbBarva"/>

          <Label Grid.Row="5" Grid.Column="0" Content="Typ piva:"/>
          <ComboBox Grid.Row="5" Grid.Column="1" x:Name="cbTypPiva"/>

          <Label Grid.Row="6" Grid.Column="0" Content="Pivovar:"/>
          <ComboBox Grid.Row="6" Grid.Column="1" x:Name="cbPivovar"/>

          <Button Grid.Row="8" Grid.Column="0" Grid.ColumnSpan="2" Content="Přidat pivo" Click="btnAdd_Click"/>
          <Button Grid.Row="9" Grid.Column="0" Grid.ColumnSpan="2" Content="Cancel" Click="btnCancel_Click"/>
      </Grid>

Nechceme psát hodnoty do ComboBoxů ručně, ale aby se automaticky braly z tabulek databáze

## AddPivoWindow.xaml.cs

        private PivoContext _context;

        public Pivo NewPivo { get; set; }
        public AddPivoWindow()
        {
            InitializeComponent();
            _context = new PivoContext();
            FillComboBoxes();
        }
        private void FillComboBoxes()
        {

            cbStupnovitost.ItemsSource = _context.Stupnovitost.ToList();
            cbStupnovitost.DisplayMemberPath = "Nazev";
            cbStupnovitost.SelectedValuePath = "Id_stupne";


            cbBarva.ItemsSource = _context.Barva.ToList();
            cbBarva.DisplayMemberPath = "Nazev";
            cbBarva.SelectedValuePath = "Id_barvy";


            cbTypPiva.ItemsSource = _context.TypPiva.ToList();
            cbTypPiva.DisplayMemberPath = "Nazev";
            cbTypPiva.SelectedValuePath = "Id_typu";

            cbPivovar.ItemsSource = _context.Pivovary.ToList();
            cbPivovar.DisplayMemberPath = "Nazev";
            cbPivovar.SelectedValuePath = "Id_pivovaru";
        }
        
Funkce pro přidání piva

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(txtNazev.Text) || string.IsNullOrEmpty(txtIBU.Text) || string.IsNullOrEmpty(txtObsahAlkoholu.Text) ||
                cbStupnovitost.SelectedValue == null || cbBarva.SelectedValue == null || 
                cbTypPiva.SelectedValue == null || cbPivovar.SelectedValue == null)
            {
                MessageBox.Show("Před odesláním musíte vyplnit všechny informace!");
                return;
            }

            var pivo = new Pivo
            {
                Nazev = txtNazev.Text,
                IBU = int.Parse(txtIBU.Text),
                Obsah_alkoholu = decimal.Parse(txtObsahAlkoholu.Text),
                Id_stupne = (int)cbStupnovitost.SelectedValue,
                Id_barvy = (int)cbBarva.SelectedValue,
                Id_typu = (int)cbTypPiva.SelectedValue,
                Id_pivovaru = (int)cbPivovar.SelectedValue
            };

            _context.Piva.Add(pivo);
            _context.SaveChanges();

            Close();
        }

Zrušení

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

