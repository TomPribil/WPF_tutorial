# Část 2
V projektu si připravíme okno pro zobrazení databáze piv

'''
<Grid>
                <Grid.RowDefinitions>
                        <RowDefinition Height="Auto" />
                        <RowDefinition Height="Auto" />
                        <RowDefinition Height="*" />
                </Grid.RowDefinitions>

                <StackPanel Grid.Row="0" Orientation="Horizontal">
                        <TextBox x:Name="txtFilter" Margin="5" Width="150" KeyDown="TxtFilter_OnKeyDown"/>
                        <Button x:Name="AddBeer" Content="Přidat Pivo" Margin="5" Click="AddBeer_OnClick" />
                </StackPanel>

                <Border Grid.Row="1" BorderThickness="0,0,0,1" BorderBrush="DarkGray" />

                <ScrollViewer Grid.Row="2" HorizontalScrollBarVisibility="Auto" VerticalScrollBarVisibility="Auto">
                        <DataGrid x:Name="dgPiva" AutoGenerateColumns="False" CanUserAddRows="False" ItemsSource="{Binding FilteredPiva}" Margin="10">
                                <DataGrid.Columns>
                                        <DataGridTextColumn Header="Název" Binding="{Binding Nazev}" />
                                        <DataGridTextColumn Header="Stupeň" Binding="{Binding Stupnovitost.Nazev}" />
                                        <DataGridTextColumn Header="IBU" Binding="{Binding IBU}" />
                                        <DataGridTextColumn Header="Obsah Alkoholu" Binding="{Binding Obsah_alkoholu}" />
                                        <DataGridTextColumn Header="Barva" Binding="{Binding Barva.Nazev}" />
                                        <DataGridTextColumn Header="Typ" Binding="{Binding TypPiva.Nazev}" />
                                        <DataGridTextColumn Header="Pivovar" Binding="{Binding Pivovary.Nazev}" />
                                </DataGrid.Columns>
                        </DataGrid>
                </ScrollViewer>
        </Grid>
'''