# Část 7
## Vytvoření okna pro přidávání nových vlastností piv

## AddCategoryWindow.xaml

        <Grid>

            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>

            <TextBox x:Name="txtInput" Grid.Row="0" 
                     Margin="5" TextWrapping="Wrap" 
                     Height="50" VerticalContentAlignment="Center"/>

            <Button x:Name="bttnOk" Grid.Row="1" 
                    Margin="5" Content="Přidat!" Click="BttnOk_OnClick" Width="70"/>

        </Grid>

## AddCategoryWindow.xaml.cs
    
    public partial class AddCategoryWindow : Window
        {
            public string CategoryName { get; }

            public AddCategoryWindow(string categoryName)
            {
                InitializeComponent();
                CategoryName = categoryName;
            }

            private void BttnOk_OnClick(object sender, RoutedEventArgs e)
            {
                using (var context = new PivoContext())
                {
                    if (CategoryName == "Barva")
                    {
                        var newBarva = new Barva { Nazev = txtInput.Text };

                        context.Barva.Add(newBarva);
                    }
                    else if (CategoryName == "Stupnovitost")
                    {
                        if (int.TryParse(txtInput.Text, out int stupnovitostValue))
                        {
                            var newStupnovitost = new Stupnovitost { Nazev = txtInput.Text };
                            context.Stupnovitost.Add(newStupnovitost);
                        }
                        else
                        {
                            MessageBox.Show("Jako vstup jsou povolená pouze čísla!");
                        }
                    }
                    else if (CategoryName == "TypPiva")
                    {
                        var newTypPiva = new TypPiva { Nazev = txtInput.Text };

                        context.TypPiva.Add(newTypPiva);
                    }

                    context.SaveChanges();
                }

                Close();
            }
        }
        
Ještě je potřeba upravit okno pro přidávání nových piv
## AddPivoWindow.xaml

        <Label Grid.Row="0" Grid.Column="0" Content="Název:"/>
        <TextBox Grid.Row="0" Grid.Column="1" x:Name="txtNazev" VerticalContentAlignment="Center"/>
        
        
        <Label Grid.Row="1" Grid.Column="0" Content="Stupeň:"/>
        <StackPanel Orientation="Horizontal" Grid.Row="1" Grid.Column="1">
            <ComboBox  x:Name="cbStupnovitost" Width="185"/>
            <Button x:Name="bttnAddStupen" Content="+" Width="20" Click="OnAddCategoryButtonClick"/>
        </StackPanel>

        <Label Grid.Row="2" Grid.Column="0" Content="IBU:"/>
        <TextBox Grid.Row="2" Grid.Column="1" x:Name="txtIBU" VerticalContentAlignment="Center"/>

        <Label Grid.Row="3" Grid.Column="0" Content="Obsah alkoholu (%):"/>
        <TextBox Grid.Row="3" Grid.Column="1" x:Name="txtObsahAlkoholu" VerticalContentAlignment="Center"/>

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
        
## AddPivoWindow.xaml.cs

        private void OnAddCategoryButtonClick(object sender, RoutedEventArgs e)
        {
            if (sender == bttnAddStupen)
            {
                AddCategoryWindow addCategoryWindow = new AddCategoryWindow("Stupnovitost");
                addCategoryWindow.ShowDialog();
            }
            else if (sender == bttnAddBarva)
            {
                AddCategoryWindow addCategoryWindow = new AddCategoryWindow("Barva");
                addCategoryWindow.ShowDialog();
            }
            else if (sender == bttnAddTyp)
            {
                AddCategoryWindow addCategoryWindow = new AddCategoryWindow("TypPiva");
                addCategoryWindow.ShowDialog();
            }
            FillComboBoxes();
        }
