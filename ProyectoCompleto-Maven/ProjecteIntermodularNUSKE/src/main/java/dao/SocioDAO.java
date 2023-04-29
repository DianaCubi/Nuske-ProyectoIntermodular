/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Responsable;
import dto.Socio;
import dto.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ciclost
 */
public class SocioDAO extends TablaDAO<Socio> {
    
    public SocioDAO() {
        this.tabla = "NUSKE_SOCIO";
    }

    @Override
    public int actualizar(Socio s) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Socio s) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Socio eliminar(Socio s) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Socio s) throws SQLException {
        return existe(s.getCodigo());
    }

    @Override
    public ArrayList<Socio> getAll() throws SQLException {
        ArrayList<Socio> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY COD_USUARIO";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("cod_usuario");
            Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
            String nombreEntidad = resultSet.getString("nombre_entidad");
            int telefonoEntidad = resultSet.getInt("telefono_entidad");
            String correoEmpresa = resultSet.getString("correo_empresa");
            lista.add(new Socio(usuario, nombreEntidad, telefonoEntidad, correoEmpresa));
        }
        return lista;
    }

    @Override
    public Socio getByCodigo(int codigo) throws SQLException {
        Usuario usuario = new UsuarioDAO().getByCodigo(codigo);
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE cod_usuario=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String nombreEntidad = resultSet.getString("nombre_entidad");
            int telefonoEntidad = resultSet.getInt("telefono_entidad");
            String correoEmpresa = resultSet.getString("correo_empresa");
            
            return new Socio(usuario, nombreEntidad, telefonoEntidad, correoEmpresa);
        }
        return null;
    }
}