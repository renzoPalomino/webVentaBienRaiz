
package beans;


public class Casa {
    private int idInmu;
    private String titulo;
    private String direccion;
    private double area;
    private String img;
    private String descrip;
    private double precio;
    private int tipo;
    private int estado;
    private int numhab;
    private int numbanio;
    private int numgarage;
    private int aniocost;
    
    public Casa(){
    }

    public Casa(int idInmu, String titulo, String direccion, double area, String img, String descrip, double precio, int tipo, int estado, int numhab, int numbanio, int numgarage, int aniocost) {
        this.idInmu = idInmu;
        this.titulo = titulo;
        this.direccion = direccion;
        this.area = area;
        this.img = img;
        this.descrip = descrip;
        this.precio = precio;
        this.tipo = tipo;
        this.estado = estado;
        this.numhab = numhab;
        this.numbanio = numbanio;
        this.numgarage = numgarage;
        this.aniocost = aniocost;
    }

    public int getAniocost() {
        return aniocost;
    }

    public void setAniocost(int aniocost) {
        this.aniocost = aniocost;
    }

    public int getIdInmu() {
        return idInmu;
    }

    public void setIdInmu(int idInmu) {
        this.idInmu = idInmu;
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

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
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

    public int getNumhab() {
        return numhab;
    }

    public void setNumhab(int numhab) {
        this.numhab = numhab;
    }

    public int getNumbanio() {
        return numbanio;
    }

    public void setNumbanio(int numbanio) {
        this.numbanio = numbanio;
    }

    public int getNumgarage() {
        return numgarage;
    }

    public void setNumgarage(int numgarage) {
        this.numgarage = numgarage;
    }
    
}
