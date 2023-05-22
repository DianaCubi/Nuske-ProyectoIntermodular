package dto;

import java.time.LocalDateTime;


public class Pedido {

    //ATRIBUTOS
    private final int codigo;
    private final EstadoPedido estadoPedido;
    private final LocalDateTime fechaPedido;
    private final Cesta cesta;
    private final Direccion direccionPedido;
    private final Cliente cliente;
    private final double descuento;
    private final boolean facturado;

    //CONSTRUCTOR
    public Pedido(int codigo, EstadoPedido estadoPedido, LocalDateTime fechaPedido, Cesta cesta, Direccion direccionPedido, Cliente cliente, double descuento, boolean facturado) {
            this.codigo = codigo;
            this.estadoPedido = estadoPedido;
            this.fechaPedido = fechaPedido;
            this.cesta = cesta;
            this.direccionPedido = direccionPedido;
            this.cliente = cliente;
            this.descuento = descuento;
            
            this.facturado = facturado;
    }

    //MÉTODOS
    public int getCodigo() {
        return codigo;
    }

    public EstadoPedido getEstadoPedido() {
        return estadoPedido;
    }

    public LocalDateTime getFechaPedido() {
        return fechaPedido;
    }

    public Cesta getCesta() {
        return cesta;
    }

    public Direccion getDireccionPedido() {
        return direccionPedido;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public double getDescuento() {
        return descuento;
    }

    public boolean isFacturado() {
        return facturado;
    }
    

//    public double calcularSubTotal() {
//        return cesta.calcularSubTotal();
//    }

    @Override
    public String toString() {
        return "Pedido{" + "codigo=" + codigo + ", estadoPedido=" + estadoPedido + ", fechaPedido=" + fechaPedido + ", cesta=" + cesta + ", direccionPedido=" + direccionPedido + ", cliente=" + cliente + ", descuento=" + descuento + '}';
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + this.codigo;
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
        final Pedido other = (Pedido) obj;
        return this.codigo == other.codigo;
    }
    
    
    public boolean perteneceAUsuario(Usuario u){
        return this.getCliente().equals(u);
    }
    
}
