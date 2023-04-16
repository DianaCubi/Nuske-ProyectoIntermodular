package dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class Articulo {
    //ATRIBUTOS
    private final String codigo;
    //private final ArrayList<Comentario> comentarios;
    private final String foto;
    private final String nombre;
    private final String descripcion;
    private final Categoria categoria;
    private final Subcategoria subcategoria;
    private final TipoArticulo tipoArticulo;
    private final int stockActual;
    private final int stockMinimo;
    private final int unidades;
    private final int iva;
    private final double pvp;
    private final LocalDateTime fechaCreacion;
    private final Administrador creador;
    private final ArrayList<Proveedor> proveedores; //CONSULTA TABLA PROVEEDORES CON FILTRO DE COD ARTICULO
    private final HashMap<Socio, String> socioRecomendaciones;
    private final HashMap<Socio, Double> socioVentas;

    //CONSTRUCTOR

    public Articulo(String codigo, String foto, String nombre, String descripcion, Categoria categoria, Subcategoria subcategoria, TipoArticulo tipoArticulo, int stockActual, int stockMinimo, int unidades, int iva, double pvp, LocalDateTime fechaCreacion, Administrador creador, ArrayList<Proveedor> proveedores, HashMap<Socio, String> socioRecomendaciones, HashMap<Socio, Double> socioVentas) {
        this.codigo = codigo;
        //this.comentarios = new ArrayList<>();
        this.foto = foto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.categoria = categoria;
        this.subcategoria = subcategoria;
        this.tipoArticulo = tipoArticulo;
        this.stockActual = stockActual;
        this.stockMinimo = stockMinimo;
        this.unidades = unidades;
        this.iva = iva;
        this.pvp = pvp;
        this.fechaCreacion = LocalDateTime.now();
        this.creador = creador;
        this.proveedores = proveedores;
        this.socioRecomendaciones = socioRecomendaciones;
        this.socioVentas = socioVentas;
    }

    //MÉTODOS
    public String getCodigo() {
        return codigo;
    }

//    public ArrayList<Comentario> getComentarios() {
//        return comentarios;
//    }

    public String getFoto() {
        return foto;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public Subcategoria getSubcategoria() {
        return subcategoria;
    }

    public TipoArticulo getTipoArticulo() {
        return tipoArticulo;
    }

    public int getStockActual() {
        return stockActual;
    }

    public int getStockMinimo() {
        return stockMinimo;
    }

    public int getUnidades() {
        return unidades;
    }

    public int getIva() {
        return iva;
    }

    public double getPvp() {
        return pvp;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public Administrador getCreador() {
        return creador;
    }

    public ArrayList<Proveedor> getProveedor() {
        return proveedores;
    }

    public HashMap<Socio, String> getSocioRecomendaciones() {
        return socioRecomendaciones;
    }

    public HashMap<Socio, Double> getSocioVentas() {
        return socioVentas;
    }

    @Override
    public String toString() {
        return "Articulo{" + "codigo=" + codigo + ", foto=" + foto + ", nombre=" + nombre + ", descripcion=" + descripcion + ", categoria=" + categoria + ", subcategoria=" + subcategoria + ", tipoArticulo=" + tipoArticulo + ", stockActual=" + stockActual + ", stockMinimo=" + stockMinimo + ", unidades=" + unidades + ", iva=" + iva + ", pvp=" + pvp + ", fechaCreacion=" + fechaCreacion + ", creador=" + creador + ", proveedores=" + proveedores + ", socioRecomendaciones=" + socioRecomendaciones + ", socioVentas=" + socioVentas + '}';
    }
        

//    public void añadirComentario(Comentario com) {
//        if(!comentarios.contains(com)){
//            comentarios.add(com);
//        }
//    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.codigo);
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
        final Articulo other = (Articulo) obj;
        return Objects.equals(this.codigo, other.codigo);
    }
    
}
