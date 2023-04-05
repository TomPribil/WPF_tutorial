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
