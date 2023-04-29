package dto;

import java.time.LocalDateTime;

public class Comentario {
    //ATRIBUTOS
    private final int numero;
    private final Articulo articulo;
    private final String pseudonimoUsuario;
    private final int valoracion;
    private final CalidadPrecio calidadPrecio;
    private final LocalDateTime fecha;
    private final String descripcion;
    private final String ventajas;
    private final String inconvenientes;
    
    //CONSTRUCTOR
    public Comentario(int numero, Articulo articulo, String pseudonimoUsuario, int valoracion, CalidadPrecio calidadPrecio, LocalDateTime fecha, String descripcion, String ventajas, String inconvenientes) {
        this.numero = numero;
        this.articulo=articulo;
        this.pseudonimoUsuario = pseudonimoUsuario;
        this.valoracion = valoracion;
        this.calidadPrecio = calidadPrecio;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.ventajas = ventajas;
        this.inconvenientes = inconvenientes;
    }
    
    //MÉTODOS
    public int getNumero() {
        return numero;
    }

    public String getPseudonimoUsuario() {
        return pseudonimoUsuario;
    }

    public int getValoracion() {
        return valoracion;
    }

    public CalidadPrecio getCalidadPrecio() {
        return calidadPrecio;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getVentajas() {
        return ventajas;
    }

    public String getInconvenientes() {
        return inconvenientes;
    }

    public Articulo getArticulo() {
        return articulo;
    }

    @Override
    public String toString() {
        return "Comentario{" + "numero=" + numero + ", articulo=" + articulo + ", pseudonimoUsuario=" + pseudonimoUsuario + ", valoracion=" + valoracion + ", calidadPrecio=" + calidadPrecio + ", fecha=" + fecha + ", descripcion=" + descripcion + ", ventajas=" + ventajas + ", inconvenientes=" + inconvenientes + '}';
    }
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.numero;
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
        final Comentario other = (Comentario) obj;
        return this.numero == other.numero;
    }
    
    
}
