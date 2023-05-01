package dto;

import java.time.LocalDateTime;

public class Factura {
    //ATRIBUTOS
    private final int numeroFactura;
    private final LocalDateTime fechaFactura;
    private final Pedido pedido;
    private final Direccion facturacion;
    
    //CONSTRUCTOR
    public Factura(int numeroFactura, LocalDateTime fechaFactura, Pedido pedido, Direccion facturacion) {
        this.numeroFactura = numeroFactura;
        this.fechaFactura = fechaFactura;
        this.pedido = pedido;
        this.facturacion = facturacion;
    }
    
    //MÉTODOS
    public int getNumeroFactura() {
        return numeroFactura;
    }

    public LocalDateTime getFechaFactura() {
        return fechaFactura;
    }
    
     
    public Pedido getPedido() {
        return pedido;
    }

    public Direccion getFacturacion() {
        return facturacion;
    }

    @Override
        public String toString() {
        return "Factura{" + "numeroFactura=" + numeroFactura + ", fechaFactura=" + fechaFactura + ", pedido=" + pedido + ", facturacion=" + facturacion + '}';
    }
    
        
//    public double calcularSubTotal() {
//        return pedido.calcularSubTotal();
//    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + this.numeroFactura;
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
        final Factura other = (Factura) obj;
        return this.numeroFactura == other.numeroFactura;
    }
    
    
}
