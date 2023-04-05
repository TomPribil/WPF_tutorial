# Část 8
## Mazání záznamů
## MainWindow.xaml
V hlavním okně si do stack panelu přidáme tlačítko pro mazání záznamů

    <StackPanel Grid.Row="0" Orientation="Horizontal">
        <TextBlock Text="Hledat:" Margin="5"/>
        <TextBox x:Name="txtFilter" Margin="5" Width="100" KeyDown="TxtFilter_OnKeyDown"/>
        <Button x:Name="AddBeer" Margin="5" Content="Přidat Pivo" Click="AddBeer_OnClick" />
        <Button x:Name="DeleteBeer" Margin="5" Content="Odebrat Pivo" Click="DeleteBeer_Click"/>
    </StackPanel>
    
## MainWindow.xaml.cs
Náš program smaže označený záznam z databáze a následně znovu načte vyfiltrovaná piva 

    private void DeleteBeer_Click(object sender, RoutedEventArgs e)
            {
                if (SelectedPivo != null)
                {
                    _context.Piva.Remove(SelectedPivo);
                    _context.SaveChanges();
                    TxtFilter_OnKeyDown(null, new KeyEventArgs(Keyboard.PrimaryDevice, Keyboard.PrimaryDevice.ActiveSource, 0, Key.Enter));
                }
            }
