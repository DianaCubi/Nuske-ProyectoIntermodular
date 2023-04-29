/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Direccion;
import dto.ListaProvincias;
import dto.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ciclost
 */
public class DireccionDAO extends TablaDAO<Direccion> {

    public DireccionDAO() {
        this.tabla = "NUSKE_DIRECCION";
    }

    @Override
    public int actualizar(Direccion d) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    //TERMINADO
    @Override
    public int anyadir(Direccion d) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?,?,?,?,?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        
        prepared.setInt(1, d.getNum());
        
        prepared.setInt(2, d.getUsuario().getCodigo());
        
        prepared.setString(3, d.getDireccion());
        
        prepared.setString(4, d.getPoblacion());
        
        prepared.setString(5, d.getProvincia().toString());
        
        prepared.setInt(6, d.getCp());
        
        prepared.setString(7, d.getTipo());

        return prepared.executeUpdate();
    }

    @Override
    public Direccion eliminar(Direccion d) throws SQLException {
        if (d == null) {
            return null;
        } else {
        Direccion aux = this.getByCodigo(d.getNum(), d.getUsuario());
        if(aux==null){
            return null;
        }
        String sentenciaSQL = "DELETE FROM " + tabla + " WHERE num_direccion=? AND cod_usuario=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, d.getNum());
        prepared.setInt(2, d.getUsuario().getCodigo());
        prepared.executeUpdate();
        return aux;
        }
    }

    @Override
    public boolean existe(Direccion d) throws SQLException {
        return getByCodigo(d.getNum(), d.getUsuario()) != null;
    }

    @Override
    public ArrayList<Direccion> getAll() throws SQLException {
        ArrayList<Direccion> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY NUM_DIRECCION";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int num = resultSet.getInt("NUM_DIRECCION");
            Usuario usuario = new UsuarioDAO().getByCodigo(resultSet.getInt("COD_USUARIO"));
            String direccion = resultSet.getString("DIRECCION");
            String poblacion = resultSet.getString("POBLACION");
            ListaProvincias provincia = ListaProvincias.valueOf(resultSet.getString("PROVINCIA").toUpperCase());
            int cp = resultSet.getInt("CP");
            String tipo = resultSet.getString("TIPO");
            lista.add(new Direccion(num, usuario, direccion, poblacion, provincia, cp, tipo));
        }
        return lista;
    }

    @Override
    public Direccion getByCodigo(int num) throws SQLException {
        //EN NUESTRO PROYECTO, UN USUARIO PUEDE TENER MÁS DE UNA DIRECCIÓN POR LO QUE ESTE GetByCodigo NO NOS SERVIRÍA
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE num_direccion=?";;
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, num);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Usuario usuario = new UsuarioDAO().getByCodigo(resultSet.getInt("cod_usuario"));
            String direccion = resultSet.getString("DIRECCION");
            String poblacion = resultSet.getString("POBLACION");
            ListaProvincias provincia = ListaProvincias.valueOf(resultSet.getString("PROVINCIA").toUpperCase());
            int cp = resultSet.getInt("CP");
            String tipo = resultSet.getString("TIPO");
            return new Direccion(num, usuario, direccion, poblacion, provincia, cp, tipo);
        }
        return null;
    }
    
    public <T extends Usuario> Direccion getByCodigo(int num, T usuario) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE num_direccion=? AND cod_usuario=?";;
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, num);
        prepared.setInt(2, usuario.getCodigo());
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String direccion = resultSet.getString("DIRECCION");
            String poblacion = resultSet.getString("POBLACION");
            ListaProvincias provincia = ListaProvincias.valueOf(resultSet.getString("PROVINCIA").toUpperCase());
            int cp = resultSet.getInt("CP");
            String tipo = resultSet.getString("TIPO");
            return new Direccion(num, usuario, direccion, poblacion, provincia, cp, tipo);
        }
        return null;
    }

    
    public <T extends Usuario> ArrayList<Direccion> getDireccionesDe(T u) throws SQLException {
        ArrayList<Direccion> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE COD_USUARIO=? ORDER BY NUM_DIRECCION";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, u.getCodigo());
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("NUM_DIRECCION");
            String direccion = resultSet.getString("DIRECCION");
            String poblacion = resultSet.getString("POBLACION");
            ListaProvincias provincia = ListaProvincias.valueOf(resultSet.getString("PROVINCIA").toUpperCase());
            int cp = resultSet.getInt("CP");
            String tipo = resultSet.getString("TIPO");
            lista.add(new Direccion(codigo, u, direccion, poblacion, provincia, cp, tipo));
        }
        return lista;
    }
}
