/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Direccion;
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
 * @author ciclost
 */
public class UsuarioDAO  extends TablaDAO<Usuario> {
    
    public UsuarioDAO() {
        this.tabla = "NUSKE_USUARIO";
    }

    @Override
    public int actualizar(Usuario u) throws SQLException {
        String sentenciaSQL = "UPDATE " + tabla + " SET E_MAIL=?, CONTRASENA=?, NOMBRE=?, APELLIDOS=?, FECHA_NAC=?, TELEFONO=?, FOTO=?, ULTIMA_CONEXION=? WHERE CODIGO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, u.getEmail());
        prepared.setString(2, u.getContraseña());
        prepared.setString(3, u.getNombre());
        prepared.setString(4, u.getApellidos());
        prepared.setDate(5, Date.valueOf(u.getFechaNacimiento()));
        prepared.setInt(6, u.getTelefono());
        prepared.setString(7, u.getFoto());
        prepared.setTimestamp(8, Timestamp.valueOf(u.getUltConexion()));
        prepared.setInt(9, u.getCodigo());
        
        return prepared.executeUpdate();
    }
    
    public int actualizarUltimaConexion(int codigoUsuario, LocalDateTime ultimaConexion) throws SQLException {
        String sentenciaSQL = "UPDATE " + tabla + " SET ULTIMA_CONEXION=? WHERE CODIGO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setTimestamp(1, Timestamp.valueOf(ultimaConexion));
        prepared.setInt(2, codigoUsuario);
        
        return prepared.executeUpdate();
    }

    @Override
    public int anyadir(Usuario objeto) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Usuario eliminar(Usuario objeto) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Usuario u) throws SQLException {
        return existe(u.getCodigo());
    }

    @Override
    public ArrayList<Usuario> getAll() throws SQLException {
        ArrayList<Usuario> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY codigo";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            int codigo = resultSet.getInt("codigo");
            String email = resultSet.getString("e_mail");
            String contrasenya = resultSet.getString("contrasena");
            String nombre = resultSet.getString("nombre");
            String apellidos = resultSet.getString("apellidos");
            Date fechaNacimientoTS = resultSet.getDate("FECHA_NAC");
            LocalDate fechaNacimiento = fechaNacimientoTS == null ? null : fechaNacimientoTS.toLocalDate();
            int telefono = resultSet.getInt("telefono");
            String foto = resultSet.getString("foto");
            LocalDateTime ultConexion = resultSet.getTimestamp("ULTIMA_CONEXION").toLocalDateTime();
            
            lista.add(new Usuario(codigo, nombre, apellidos, fechaNacimiento, email, telefono, contrasenya, ultConexion, foto));
        }

        return lista;
    }

    @Override
    public Usuario getByCodigo(int codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE CODIGO=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String email = resultSet.getString("e_mail");
            String contrasenya = resultSet.getString("contrasena");
            String nombre = resultSet.getString("nombre");
            String apellidos = resultSet.getString("apellidos");
            Date fechaNacimientoTS = resultSet.getDate("FECHA_NAC");
            LocalDate fechaNacimiento = fechaNacimientoTS == null ? null : fechaNacimientoTS.toLocalDate();
            int telefono = resultSet.getInt("telefono");
            String foto = resultSet.getString("foto");
            LocalDateTime ultConexion = resultSet.getTimestamp("ULTIMA_CONEXION").toLocalDateTime();
            
            return new Usuario(codigo, nombre, apellidos, fechaNacimiento, email, telefono, contrasenya, ultConexion, foto);
        }
        
        return null;
    }
    
    public Usuario getUsuario(String email, String contrasenya) throws SQLException{
        String sentenciaSQL = "SELECT * FROM NUSKE_USUARIO WHERE E_MAIL LIKE ? AND CONTRASENA LIKE ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, email);
        prepared.setString(2, contrasenya);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            int codigo = resultSet.getInt("codigo");
            String nombre = resultSet.getString("nombre");
            String apellidos = resultSet.getString("apellidos");
            Date fechaNacimientoTS = resultSet.getDate("FECHA_NAC");
            LocalDate fechaNacimiento = fechaNacimientoTS == null ? null : fechaNacimientoTS.toLocalDate();
            int telefono = resultSet.getInt("telefono");
            String foto = resultSet.getString("foto");
            LocalDateTime ultConexion = resultSet.getTimestamp("ULTIMA_CONEXION").toLocalDateTime();
            return new Usuario(codigo, nombre, apellidos, fechaNacimiento, email, telefono, contrasenya, ultConexion, foto);
        }
        
        return null;
    }
    
    public static Usuario tipoUsuario(int codigo) throws SQLException{
        if(new ClienteDAO().getByCodigo(codigo)!= null){
            return new ClienteDAO().getByCodigo(codigo);
        }
        else if(new SocioDAO().getByCodigo(codigo)!=null){
            return new SocioDAO().getByCodigo(codigo);
        }
        else if(new ResponsableDAO().getByCodigo(codigo)!= null){
            return new ResponsableDAO().getByCodigo(codigo);
        }
        else if(new AdministradorDAO().getByCodigo(codigo)!=null){
            return new AdministradorDAO().getByCodigo(codigo);
        }
        else{
            return null;
        }
    }
    
}
