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
              <RowDefinition Height="*"/>
          </Grid.RowDefinitions>
          <Grid.ColumnDefinitions>
              <ColumnDefinition Width="Auto"/>
              <ColumnDefinition Width="*"/>
          </Grid.ColumnDefinitions>
          <Label Grid.Row="0" Grid.Column="0" Content="Název:"/>
          <TextBox Grid.Row="0" Grid.Column="1" x:Name="txtNazev"/>


          <Label Grid.Row="1" Grid.Column="0" Content="Stupeň:"/>
          <StackPanel Orientation="Horizontal" Grid.Row="1" Grid.Column="1">
              <ComboBox  x:Name="cbStupnovitost" Width="185"/>
              <Button x:Name="bttnAddStupen" Content="+" Width="20" Click="OnAddCategoryButtonClick"/>
          </StackPanel>

          <Label Grid.Row="2" Grid.Column="0" Content="IBU:"/>
          <TextBox Grid.Row="2" Grid.Column="1" x:Name="txtIBU"/>

          <Label Grid.Row="3" Grid.Column="0" Content="Obsah alkoholu (%):"/>
          <TextBox Grid.Row="3" Grid.Column="1" x:Name="txtObsahAlkoholu"/>

          <Label Grid.Row="4" Grid.Column="0" Content="Barva:"/>
          <StackPanel Orientation="Horizontal" Grid.Row="4" Grid.Column="1">
              <ComboBox x:Name="cbBarva" Width="185"/>
              <Button x:Name="bttnAddBarva" Content="+" Width="20" Click="OnAddCategoryButtonClick"/>
          </StackPanel>


          <Label Grid.Row="5" Grid.Column="0" Content="Typ piva:"/>
          <StackPanel Orientation="Horizontal" Grid.Row="5" Grid.Column="1">
              <ComboBox  x:Name="cbTypPiva" Width="185"/>
              <Button x:Name="bttnAddTyp" Content="+" Width="20" Click="OnAddCategoryButtonClick"/>
          </StackPanel>


          <Label Grid.Row="6" Grid.Column="0" Content="Pivovar:"/>
          <ComboBox Grid.Row="6" Grid.Column="1" x:Name="cbPivovar"/>

          <Button x:Name="btnAdd" Grid.Row="8" Grid.Column="0" Grid.ColumnSpan="2" Content="Přidat pivo" Click="BtnAdd_OnClick"/>
          <Button x:Name="btnCancel" Grid.Row="9" Grid.Column="0" Grid.ColumnSpan="2" Content="Zrušit" Click="BtnCancel_OnClick"/>
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

## MainWindow.xaml.cs
Ještě je potřeba upravit funkci v hlavním okně, aby se nové okno mohlo otevřít

        private void AddBeer_OnClick(object sender, RoutedEventArgs e)
        {
            AddPivoWindow addPivoWindow = new AddPivoWindow();
            addPivoWindow.Show();
        }

