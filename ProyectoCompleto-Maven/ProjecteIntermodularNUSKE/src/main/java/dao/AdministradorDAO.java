/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Administrador;
import dto.Direccion;
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
public class AdministradorDAO extends TablaDAO<Administrador> {

    public AdministradorDAO() {
        this.tabla = "NUSKE_ADMINISTRADOR";
    }
    
    @Override
    public int actualizar(Administrador a) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Administrador a) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Administrador eliminar(Administrador a) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Administrador a) throws SQLException {
        return existe(a.getCodigo());
    }

    @Override
    public ArrayList<Administrador> getAll() throws SQLException {
        ArrayList<Administrador> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY COD_USUARIO";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("cod_usuario");
            Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
            lista.add(new Administrador(usuario));
        }
        

        return lista;
    }

    @Override
    public Administrador getByCodigo(int codigo) throws SQLException {
        Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
        
        if(usuario==null){
            return null;
        }
        return new Administrador(usuario);
    }
    
    
}
