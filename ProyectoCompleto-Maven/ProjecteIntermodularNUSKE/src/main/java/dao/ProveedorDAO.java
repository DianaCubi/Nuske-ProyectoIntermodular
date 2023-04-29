package dao;

import dto.Proveedor;
import dto.Usuario;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author Diana Soriano Cubí
 */
public class ProveedorDAO extends TablaDAO<Proveedor> {
    
    public ProveedorDAO() {
        this.tabla = "NUSKE_PROVEEDOR";
    }

    @Override
    public int actualizar(Proveedor p) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Proveedor p) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Proveedor eliminar(Proveedor p) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Proveedor p) throws SQLException {
        return existe(p.getCodigo());
    }

    @Override
    public ArrayList<Proveedor> getAll() throws SQLException {
        ArrayList<Proveedor> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY codigo";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            
            int codigo = resultSet.getInt("codigo");
            String nombre = resultSet.getString("nombre");
            String direccion = resultSet.getString("direccion");
            String personaContacto = resultSet.getString("persona_contacto");
            int telefono = resultSet.getInt("telefono");
            String emailProveedor = resultSet.getString("e_mail_proveedor");
            String condicionCompra = resultSet.getString("condicion_compra");
            String datosInteres = resultSet.getString("otros_datos_interes");
            
            lista.add(new Proveedor(codigo, nombre, direccion, personaContacto, telefono, emailProveedor, condicionCompra, datosInteres));
        }
        return lista;
    }

    @Override
    public Proveedor getByCodigo(int codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE CODIGO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String nombre = resultSet.getString("nombre");
            String direccion = resultSet.getString("direccion");
            String personaContacto = resultSet.getString("persona_contacto");
            int telefono = resultSet.getInt("telefono");
            String emailProveedor = resultSet.getString("e_mail_proveedor");
            String condicionCompra = resultSet.getString("condicion_compra");
            String datosInteres = resultSet.getString("otros_datos_interes");
            
            return new Proveedor(codigo, nombre, direccion, personaContacto, telefono, emailProveedor, condicionCompra, datosInteres);
        }
        
        return null;
    }
}
