import java.io.*;
import com.csvreader.CsvReader;
import java.util.*;

public class Consulta {
	public static void main(String[] args) {
		try {
        CsvReader mi_csv = new CsvReader("/media/Dropbox/Ciencias de la Computación/FBD/Practicas/Practica01/src/P1.csv"); //Cambien a la ruta de su archivo
        mi_csv.readHeaders(); // Leemos las Cabeceras, las cuales nos dan informacion de cada campo
        
        LinkedList<Cliente> clientes = new LinkedList();

        while (mi_csv.readRecord()){
        	clientes.add(new Cliente(mi_csv));
        }

        int resultado1 = busca1(clientes);
        LinkedList<String> resultado2 = busca2(clientes);
        LinkedList<String> resultado3 = busca3(clientes);
        LinkedList<String> resultado4 = busca4(clientes);
        LinkedList<String> resultado5 = busca5(clientes);
        LinkedList<String> resultado6 = busca6(clientes);
        LinkedList resultado7 = busca7(clientes);

        FileWriter fichero = new FileWriter("/media/Dropbox/Ciencias de la Computación/FBD/Practicas/Practica01/src/resultados.txt");
        PrintWriter pw = new PrintWriter(fichero);
        pw.println(resultado1);
        pw.println(resultado2);
        pw.println(resultado3);
        pw.println(resultado4);
        pw.println(resultado5);

        fichero.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

	}

	public static int busca1(LinkedList<Cliente> clientes) {
		LinkedList resultado = new LinkedList();
		for (Cliente cliente :  clientes) {
			if (Double.parseDouble(cliente.m2) < 200 && Double.parseDouble(cliente.val_prop) >= 50000 && Double.parseDouble(cliente.val_prop) <= 500000) {
				resultado.add(cliente);
			}
		}

		return resultado.size();
	}

	public static LinkedList<String> busca2(LinkedList<Cliente> clientes) {
		LinkedList<String> resultado = new LinkedList();
		Cliente [] clss = new Cliente[clientes.size()];
		clss = clientes.toArray(clss);
		String nombre;

		for (int i = 0; i < clss.length; i++) {
			nombre = clss[i].nombre;
			if (resultado.contains(nombre))
				continue;
			for (int j = i + 1; j < clss.length; j++) {
				if (clss[j].nombre.equals(nombre))
					resultado.add(nombre);
			}
		}

		return resultado;
	}

	public static LinkedList<String> busca3(LinkedList<Cliente> clientes) {
		LinkedList<String> resultado = new LinkedList();
		LinkedList<Double> valProp = new LinkedList();
		for (Cliente cliente : clientes) {
			valProp.add(Double.parseDouble(cliente.val_prop));
		}
			Collections.sort(valProp);

		for (int i = 0; i < 10 ; i++) {
			for (Cliente cliente : clientes) {
				if (Double.parseDouble(cliente.val_prop) == valProp.get(i))
					resultado.add(cliente.direccion);
			}
		}

		return resultado;
	}

	public static LinkedList<String> busca4(LinkedList<Cliente> clientes) {
		LinkedList<String> resultado = new LinkedList();
		LinkedList<Double> valProp = new LinkedList();
		for (Cliente cliente : clientes) {
			valProp.add(Double.parseDouble(cliente.val_prop));
		}
			Comparator<Double> comparador = Collections.reverseOrder();
			Collections.sort(valProp, comparador);

		for (int i = 0; i < 5 ; i++) {
			for (Cliente cliente : clientes) {
				if (Double.parseDouble(cliente.val_prop) == valProp.get(i))
					resultado.add(cliente.direccion);
			}
		}

		return resultado;
	}

	public static LinkedList<String> busca5(LinkedList<Cliente> clientes) {
		LinkedList<String> resultado = new LinkedList();
		LinkedList<Double> valProp = new LinkedList();
		for (Cliente cliente : clientes) {
			valProp.add(Double.parseDouble(cliente.val_prop) - Double.parseDouble(cliente.val_venta));
		}
			Comparator<Double> comparador = Collections.reverseOrder();
			Collections.sort(valProp, comparador);

		for (int i = 0; i < 5 ; i++) {
			for (Cliente cliente : clientes) {
				if ((Double.parseDouble(cliente.val_prop) - Double.parseDouble(cliente.val_venta)) == valProp.get(i))
					resultado.add(cliente.direccion);
			}
		}

		return resultado;
	}

	public static LinkedList busca6(LinkedList clientes) {
		LinkedList resultado = new LinkedList();
		return resultado;
	}

	public static LinkedList busca7(LinkedList clientes) {
		LinkedList resultado = new LinkedList();
		return resultado;
	}
}