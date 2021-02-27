package beans;

public class Local {
    private int idInmu;
    private String titulo;
    private String direccion;
    private double area;
    private String img;
    private String descrip;
    private double precio;
    private int tipo;
    private int estado;
    private int aniocost;
    
    public Local(){
    }

    public Local(int idInmu, String titulo, String direccion, double area, String img, String descrip, double precio, int tipo, int estado, int aniocost) {
        this.idInmu = idInmu;
        this.titulo = titulo;
        this.direccion = direccion;
        this.area = area;
        this.img = img;
        this.descrip = descrip;
        this.precio = precio;
        this.tipo = tipo;
        this.estado = estado;
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
}