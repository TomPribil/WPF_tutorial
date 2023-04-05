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

            // Rest of the class code
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
