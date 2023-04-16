/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Administrador;
import dto.Cliente;
import dto.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author ciclost
 */
public class ClienteDAO extends TablaDAO<Cliente> {
    
    public ClienteDAO() {
        this.tabla = "NUSKE_CLIENTE";
    }

    @Override
    public int actualizar(Cliente c) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Cliente c) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Cliente eliminar(Cliente c) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Cliente c) throws SQLException {
        return existe(c.getCodigo());
    }

    @Override
    public ArrayList<Cliente> getAll() throws SQLException {
        ArrayList<Cliente> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY COD_USUARIO";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("cod_usuario");
            Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
            String dni = resultSet.getString("dni");
            lista.add(new Cliente(usuario, dni));
        }
        return lista;
    }

    @Override
    public Cliente getByCodigo(int codigo) throws SQLException {
        Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE COD_USUARIO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String dni = resultSet.getString("dni");
            return new Cliente(usuario, dni);
        }
        return null;
    }

}
