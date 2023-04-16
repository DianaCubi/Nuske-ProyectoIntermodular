
package dto;


public class Mascota {
    
    private final int numIdentificacion;
    private final String nombre;
    private final String raza;
    private final String descripcion;
    private final String foto;
    private final String camada;
    private final String color;
    private final Responsable ultResponsable;
    private final Socio ultSocio;
    private final EstadoMascota estadoMascota;
    private final String datosInternos;
    private final String razonEstado;
    private final String ultUbicacion;

    //CONSTRUCTOR
    public Mascota(int numIdentificacion, String nombre, String raza, String descripcion, String foto, String camada, String color, Responsable ultResponsable, Socio ultSocio, EstadoMascota estadoMascota, String datosInternos, String razonEstado, String ultUbicacion) {
        this.numIdentificacion = numIdentificacion;
        this.nombre = nombre;
        this.raza = raza;
        this.descripcion = descripcion;
        this.foto = foto;
        this.camada = camada;
        this.color = color;
        this.ultResponsable = ultResponsable;
        this.ultSocio = ultSocio;
        this.estadoMascota = estadoMascota;
        this.datosInternos = datosInternos;
        this.razonEstado = razonEstado;
        this.ultUbicacion = ultUbicacion;
    }
    
    //Métodos Get y Set
    public int getNumIdentificacion() {
        return numIdentificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public String getRaza() {
        return raza;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public String getCamada() {
        return camada;
    }

    public String getColor() {
        return color;
    }

    public Responsable getUltResponsable() {
        return ultResponsable;
    }

    public Socio getUltSocio() {
        return ultSocio;
    }

    public EstadoMascota getEstadoMascota() {
        return estadoMascota;
    }

    public String getDatosInternos() {
        return datosInternos;
    }

    public String getRazonEstado() {
        return razonEstado;
    }

    public String getDireccion() {
        return ultUbicacion;
    }

    
    // Método para imprimir los datos de una mascota.
    @Override
    public String toString() {
        return "Mascota{" + "numIdentificacion=" + numIdentificacion + ", nombre=" + nombre + ", raza=" + raza + ", descripcion=" + descripcion + ", foto=" + foto + ", camada=" + camada + ", color=" + color + ", ultResponsable=" + ultResponsable + ", ultSocio=" + ultSocio + ", estadoMascota=" + estadoMascota + ", datosInternos=" + datosInternos + ", razonEstado=" + razonEstado + ", direccion=" + ultUbicacion + '}';
    }
    
    // Método para comprobar si la mascota, o los datos de la mascota, ya está introducido. De esta manera no podrán duplicarse datos. 

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.numIdentificacion;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Mascota other = (Mascota) obj;
        return true;
    }
    
}
