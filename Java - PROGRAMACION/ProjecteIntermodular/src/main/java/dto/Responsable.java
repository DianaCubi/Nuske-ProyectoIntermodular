package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class Responsable extends Usuario{
    private final String DNI;
    
    //Constructores
    public Responsable(String DNI, int codigo, String nombre, String apellidos, LocalDate fechaNacimiento, String email, int telefono, String contraseña, LocalDateTime ultConexion, String foto) {
        super(codigo, nombre, apellidos, fechaNacimiento, email, telefono, contraseña, ultConexion, foto);
        this.DNI = DNI;
    }
    
    public Responsable (Usuario usuario, String dni){
        super(usuario.getCodigo(), usuario.getNombre(), usuario.getApellidos(), usuario.getFechaNacimiento(), usuario.getEmail(), usuario.getTelefono(), usuario.getContraseña(), usuario.getUltConexion(), usuario.getFoto());
        this.DNI = dni;
    }

    public String getDNI() {
        return DNI;
    }

    @Override
    public String toString() {
        return "Responsable{" + "DNI=" + DNI + '}';
    }

}
