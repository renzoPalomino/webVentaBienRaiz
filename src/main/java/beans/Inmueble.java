
package beans;


public class Inmueble {
    private int idInmueble;
    private String titulo;
    private String direccion;
    private double area;
    private String img;
    private String descripcion;
    private double precio;
    private int tipo; //0=venta, 1=alquiler
    private int estado;//0=no adquirido, 1=adquirido
    private int numHab;
    private int numBanio;
    private int numGarage;
    private int anioConst;//Año de construcción

    @Override
    public String toString() {
        return "Inmueble{" + "idInmueble=" + idInmueble + ", titulo=" + titulo + ", direccion=" + direccion + ", area=" + area + ", img=" + img + ", descripcion=" + descripcion + ", precio=" + precio + ", tipo=" + tipo + ", estado=" + estado + ", numHab=" + numHab + ", numBanio=" + numBanio + ", numGarage=" + numGarage + ", anioConst=" + anioConst + '}';
    }
    
    public String getDscTipo(){
        String dscTipo="";
        if(tipo==0){
            dscTipo="Venta";
        }else{
            dscTipo="Alquiler";
        }
        return dscTipo;
    }
    
    public String getDscEstado(){
        String dscEstado="";
        if(estado==0){
            dscEstado="No adquirido";
        }else{
            dscEstado="Adquirido";
        }
        return dscEstado;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getNumHab() {
        return numHab;
    }

    public void setNumHab(int numHab) {
        this.numHab = numHab;
    }

    public int getNumBanio() {
        return numBanio;
    }

    public void setNumBanio(int numBanio) {
        this.numBanio = numBanio;
    }

    public int getNumGarage() {
        return numGarage;
    }

    public void setNumGarage(int numGarage) {
        this.numGarage = numGarage;
    }

    public int getAnioConst() {
        return anioConst;
    }

    public void setAnioConst(int anioConst) {
        this.anioConst = anioConst;
    }

    public int getIdInmueble() {
        return idInmueble;
    }

    public void setIdInmueble(int idInmueble) {
        this.idInmueble = idInmueble;
    }
    
    
            
}
