package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class Administrador extends Usuario{

    //CONSTRUCTOR
    public Administrador(int codigo, String nombre, String apellidos, LocalDate fechaNacimiento, String email, int telefono, String contraseña, LocalDateTime ultConexion, String foto) {
        super(codigo, nombre, apellidos, fechaNacimiento, email, telefono, contraseña, ultConexion, foto);
    }

    public Administrador(Usuario usuario) {
        super(usuario.getCodigo(), usuario.getNombre(), usuario.getApellidos(), usuario.getFechaNacimiento(), usuario.getEmail(), usuario.getTelefono(), usuario.getContraseña(), usuario.getUltConexion(), usuario.getFoto());
    }
    
    
}
