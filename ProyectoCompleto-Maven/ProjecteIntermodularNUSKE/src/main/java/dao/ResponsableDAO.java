/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Cliente;
import dto.Responsable;
import dto.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ciclost
 */
public class ResponsableDAO extends TablaDAO<Responsable> {
    
    public ResponsableDAO() {
        this.tabla = "NUSKE_RESPONSABLE";
    }

    @Override
    public int actualizar(Responsable r) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Responsable r) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Responsable eliminar(Responsable r) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Responsable r) throws SQLException {
        return existe(r.getCodigo());
    }

    @Override
    public ArrayList<Responsable> getAll() throws SQLException {
        ArrayList<Responsable> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY COD_USUARIO";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("cod_usuario");
            Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
            String dni = resultSet.getString("dni");
            lista.add(new Responsable(usuario, dni));
        }
        
        return lista;
    }

    @Override
    public Responsable getByCodigo(int codigo) throws SQLException {
        Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE COD_USUARIO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String dni = resultSet.getString("dni");
            return new Responsable(usuario, dni);
        }
        return null;
    }
}
