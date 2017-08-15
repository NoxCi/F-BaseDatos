import java.io.FileNotFoundException;
import java.io.IOException;
import com.csvreader.CsvReader;
//import com.csvreader.CsvReader;

public class Cliente {

    public String nombre;
    public String tel;
    public String direccion;
    public String correo;
    public String m2;
    public String val_prop;
    public String val_venta;

    public Cliente(CsvReader mi_csv) {
      try {
          nombre = mi_csv.get(0);
          tel = mi_csv.get(1);
          direccion = mi_csv.get(2);
          correo = mi_csv.get(3);
          m2 = mi_csv.get(4);
          val_prop = mi_csv.get(5);
          val_venta = mi_csv.get(6);
        
        } catch (IOException e) { e.printStackTrace(); }

    }
}
