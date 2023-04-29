package dto;

import java.util.Objects;

public class LineaArticulo {
    //ATRIBUTOS
    private final Articulo articulo;
    private final Cesta cesta;
    private final int unidades;
    
    private final double pvp;
//    Precio de un articulo unitario porque luego se calculará el subtotal
    private final int iva;
    
    
    //CONSTRUCTOR
    public LineaArticulo(Articulo articulo, Cesta cesta, int unidades) {
        this.articulo = articulo;
        this.cesta = cesta;
        this.unidades = unidades;
        this.pvp = articulo.getPvp();
        this.iva = articulo.getIva();
    }
    
    //MÉTODOS
    public Articulo getArticulo() {
        return articulo;
    }

    public int getUnidades() {
        return unidades;
    }

    public double getPvp() {
        return pvp;
    }

    public int getIva() {
        return iva;
    }

    public Cesta getCesta() {
        return cesta;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.articulo);
        return hash;
    }

    @Override
    public String toString() {
        return "LineaArticulo{" + "articulo=" + articulo + ", cesta=" + cesta + ", unidades=" + unidades + ", pvp=" + pvp + ", iva=" + iva + '}';
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
        final LineaArticulo other = (LineaArticulo) obj;
        return Objects.equals(this.articulo, other.articulo);
    }

    public double calcularSubtotalLinea(){
        return this.unidades * this.articulo.getPvp();
    }
}
