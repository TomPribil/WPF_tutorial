# Část 3
Vytvoříme si složku tabulky, kde budou jednotlivé definice tabulek z databáze.
Pro každou tabulku je potřeba vytvořit si novou třídu.

Třída pivo
public class Pivo
    {
        [Key]
        public int Id_piva { get; set; }
        public string Nazev { get; set; }
        [ForeignKey("Stupnovitost")]
        public int Id_stupne { get; set; }
        public int? IBU { get; set; }
        public decimal? Obsah_alkoholu { get; set; }
        [ForeignKey("Barva")]
        public int Id_barvy { get; set; }
        [ForeignKey("TypPiva")]
        public int Id_typu { get; set; }
        [ForeignKey("Pivovary")]
        public int Id_pivovaru { get; set; }

        public virtual Stupnovitost Stupnovitost { get; set; }
        public virtual Barva Barva { get; set; }
        public virtual TypPiva TypPiva { get; set; }
        public virtual Pivovary Pivovary { get; set; }
    }
Třída barva
public class Barva
    {
        [Key]
        public int Id_barvy { get; set; }
        public string Nazev { get; set; }
    }
