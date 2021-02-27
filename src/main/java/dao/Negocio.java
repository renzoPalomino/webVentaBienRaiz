package dao;

import java.sql.*;
import util.MySQLConexion;
import beans.*;
import java.util.ArrayList;
import java.util.List;

public class Negocio {

    public int IdInmueble() {
        int nro = 0;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "select ifnull(max(idinmu),0)+1 from inmueble";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                nro = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return nro;
    }

    public int GuardarTerreno(Inmueble obj) {
        int res = 0;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call insert_terreno(?,?,?,?,?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, obj.getIdInmueble());
            cs.setString(2, obj.getTitulo());
            cs.setString(3, obj.getDireccion());
            cs.setDouble(4, obj.getArea());
            cs.setString(5, obj.getDescripcion());
            cs.setDouble(6, obj.getPrecio());
            cs.setInt(7, obj.getTipo());
            cs.setString(8, obj.getImg());
            res = cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return res;
    }

    public int GuardarOficina(Inmueble obj) {
        int res = 0;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call insert_oficina(?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, obj.getIdInmueble());
            cs.setString(2, obj.getTitulo());
            cs.setString(3, obj.getDireccion());
            cs.setDouble(4, obj.getArea());
            cs.setString(5, obj.getDescripcion());
            cs.setDouble(6, obj.getPrecio());
            cs.setInt(7, obj.getTipo());
            cs.setInt(8, obj.getNumBanio());
            cs.setInt(9, obj.getNumGarage());
            cs.setInt(10, obj.getAnioConst());
            cs.setString(11, obj.getImg());
            res = cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return res;
    }

    public int GuardarLocal(Inmueble obj) {
        int res = 0;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call insert_local(?,?,?,?,?,?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, obj.getIdInmueble());
            cs.setString(2, obj.getTitulo());
            cs.setString(3, obj.getDireccion());
            cs.setDouble(4, obj.getArea());
            cs.setString(5, obj.getDescripcion());
            cs.setDouble(6, obj.getPrecio());
            cs.setInt(7, obj.getTipo());
            cs.setInt(8, obj.getAnioConst());
            cs.setString(9, obj.getImg());
            res = cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return res;
    }

    public int GuardarDepartamento(Inmueble obj) {
        int res = 0;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call insert_departamento(?,?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, obj.getIdInmueble());
            cs.setString(2, obj.getTitulo());
            cs.setString(3, obj.getDireccion());
            cs.setDouble(4, obj.getArea());
            cs.setString(5, obj.getDescripcion());
            cs.setDouble(6, obj.getPrecio());
            cs.setInt(7, obj.getTipo());
            cs.setInt(8, obj.getNumHab());
            cs.setInt(9, obj.getNumBanio());
            cs.setInt(10, obj.getNumGarage());
            cs.setInt(11, obj.getAnioConst());
            cs.setString(12, obj.getImg());
            res = cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return res;
    }

      public int GuardarCasa(Inmueble obj) {
        int res = 0;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call insert_casa(?,?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, obj.getIdInmueble());
            cs.setString(2, obj.getTitulo());
            cs.setString(3, obj.getDireccion());
            cs.setDouble(4, obj.getArea());
            cs.setString(5, obj.getDescripcion());
            cs.setDouble(6, obj.getPrecio());
            cs.setInt(7, obj.getTipo());
            cs.setInt(8, obj.getNumHab());
            cs.setInt(9, obj.getNumBanio());
            cs.setInt(10, obj.getNumGarage());
            cs.setInt(11, obj.getAnioConst());
            cs.setString(12, obj.getImg());
            res = cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return res;
    }
      
      //listado de Casas
    public List<Inmueble> listCasa() {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM inmueble i NATURAL JOIN casa c where i.idinmu=c.idinmu";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(2));
                a.setDireccion(rs.getString(3));
                a.setArea(rs.getDouble(4));
                a.setImg(rs.getString(5));
                a.setDescripcion(rs.getString(6));
                a.setPrecio(rs.getDouble(7));
                a.setTipo(rs.getInt(8));
                a.setEstado(rs.getInt(9));
                a.setNumHab(rs.getInt(10));
                a.setNumBanio(rs.getInt(11));
                a.setNumGarage(rs.getInt(12));
                a.setAnioConst(rs.getInt(13));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Departamento
    public List<Inmueble> listDepartamento() {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT i.*, d.* FROM inmueble i NATURAL JOIN departamento d where i.idinmu=d.idinmu";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble b = new Inmueble();
                b.setIdInmueble(rs.getInt(1));
                b.setTitulo(rs.getString(2));
                b.setDireccion(rs.getString(3));
                b.setArea(rs.getDouble(4));
                b.setImg(rs.getString(5));
                b.setDescripcion(rs.getString(6));
                b.setPrecio(rs.getDouble(7));
                b.setTipo(rs.getInt(8));
                b.setEstado(rs.getInt(9));
                b.setNumHab(rs.getInt(10));
                b.setNumBanio(rs.getInt(11));
                b.setNumGarage(rs.getInt(12));
                b.setAnioConst(rs.getInt(13));
	        lis.add(b);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Oficina
    public List<Inmueble> listOficina() {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT i.*, o.* FROM inmueble i NATURAL JOIN oficina o where i.idinmu=o.idinmu";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble c = new Inmueble();
                c.setIdInmueble(rs.getInt(1));
                c.setTitulo(rs.getString(2));
                c.setDireccion(rs.getString(3));
                c.setArea(rs.getDouble(4));
                c.setImg(rs.getString(5));
                c.setDescripcion(rs.getString(6));
                c.setPrecio(rs.getDouble(7));
                c.setTipo(rs.getInt(8));
                c.setEstado(rs.getInt(9));
                c.setNumBanio(rs.getInt(10));
                c.setNumGarage(rs.getInt(11));
                c.setAnioConst(rs.getInt(12));
	        lis.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Local
    public List<Inmueble> listLocal() {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT i.*, l.* FROM inmueble i NATURAL JOIN local l where i.idinmu=l.idinmu";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble d = new Inmueble();
                d.setIdInmueble(rs.getInt(1));
                d.setTitulo(rs.getString(2));
                d.setDireccion(rs.getString(3));
                d.setArea(rs.getDouble(4));
                d.setImg(rs.getString(5));
                d.setDescripcion(rs.getString(6));
                d.setPrecio(rs.getDouble(7));
                d.setTipo(rs.getInt(8));
                d.setEstado(rs.getInt(9));
                d.setAnioConst(rs.getInt(10));
	        lis.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Terreno
    public List<Inmueble> listTerreno() {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT i.*, t.* FROM inmueble i NATURAL JOIN terreno t where i.idinmu=t.idinmu";
            PreparedStatement st = conn.prepareStatement(sql);
            //st.setString(1, cad);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble e = new Inmueble();
                e.setIdInmueble(rs.getInt(1));
                e.setTitulo(rs.getString(2));
                e.setDireccion(rs.getString(3));
                e.setArea(rs.getDouble(4));
                e.setImg(rs.getString(5));
                e.setDescripcion(rs.getString(6));
                e.setPrecio(rs.getDouble(7));
                e.setTipo(rs.getInt(8));
                e.setEstado(rs.getInt(9));
	        lis.add(e);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Casas de un cliente
    public List<Inmueble> cliListCasa(int idcli) {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM comprainmu com NATURAL JOIN inmueble i NATURAL JOIN casa ca WHERE com.idinmu=i.idinmu and i.idinmu=ca.idinmu and com.idcli=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idcli);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(6));
                a.setDireccion(rs.getString(7));
                a.setArea(rs.getDouble(8));
                a.setImg(rs.getString(9));
                a.setDescripcion(rs.getString(10));
                a.setPrecio(rs.getDouble(11));
                a.setTipo(rs.getInt(12));
                a.setEstado(rs.getInt(13));
                a.setNumHab(rs.getInt(14));
                a.setNumBanio(rs.getInt(15));
                a.setNumGarage(rs.getInt(16));
                a.setAnioConst(rs.getInt(17));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de departamentos de un cliente
    public List<Inmueble> cliListDepartamento(int idcli) {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM comprainmu com NATURAL JOIN inmueble i NATURAL JOIN departamento d WHERE com.idinmu=i.idinmu and i.idinmu=d.idinmu and com.idcli=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idcli);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(6));
                a.setDireccion(rs.getString(7));
                a.setArea(rs.getDouble(8));
                a.setImg(rs.getString(9));
                a.setDescripcion(rs.getString(10));
                a.setPrecio(rs.getDouble(11));
                a.setTipo(rs.getInt(12));
                a.setEstado(rs.getInt(13));
                a.setNumHab(rs.getInt(14));
                a.setNumBanio(rs.getInt(15));
                a.setNumGarage(rs.getInt(16));
                a.setAnioConst(rs.getInt(17));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Oficina
    public List<Inmueble> cliListOficina(int idcli) {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM comprainmu com NATURAL JOIN inmueble i NATURAL JOIN oficina o WHERE com.idinmu=i.idinmu and i.idinmu=o.idinmu and com.idcli=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idcli);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(6));
                a.setDireccion(rs.getString(7));
                a.setArea(rs.getDouble(8));
                a.setImg(rs.getString(9));
                a.setDescripcion(rs.getString(10));
                a.setPrecio(rs.getDouble(11));
                a.setTipo(rs.getInt(12));
                a.setEstado(rs.getInt(13));
                a.setNumBanio(rs.getInt(14));
                a.setNumGarage(rs.getInt(15));
                a.setAnioConst(rs.getInt(16));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Local
    public List<Inmueble> cliListLocal(int idcli) {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM comprainmu com NATURAL JOIN inmueble i NATURAL JOIN local l WHERE com.idinmu=i.idinmu and i.idinmu=l.idinmu and com.idcli=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idcli);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(6));
                a.setDireccion(rs.getString(7));
                a.setArea(rs.getDouble(8));
                a.setImg(rs.getString(9));
                a.setDescripcion(rs.getString(10));
                a.setPrecio(rs.getDouble(11));
                a.setTipo(rs.getInt(12));
                a.setEstado(rs.getInt(13));
                a.setAnioConst(rs.getInt(14));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //listado de Terreno
    public List<Inmueble> cliListTerreno(int idcli) {
        List<Inmueble> lis = new ArrayList<>();
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM comprainmu com NATURAL JOIN inmueble i NATURAL JOIN terreno t WHERE com.idinmu=i.idinmu and i.idinmu=t.idinmu and com.idcli=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idcli);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(6));
                a.setDireccion(rs.getString(7));
                a.setArea(rs.getDouble(8));
                a.setImg(rs.getString(9));
                a.setDescripcion(rs.getString(10));
                a.setPrecio(rs.getDouble(11));
                a.setTipo(rs.getInt(12));
                a.setEstado(rs.getInt(13));
	        lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    //eliminar una casa
    public void delCasa(int id){
        int codigo ;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from casa where idinmu=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            String sql2 = "Delete from inmueble where idinmu=?";
            PreparedStatement st2 = conn.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       
    }
    
    //eliminar un departamento
    public void delDepartamento(int id){
        int codigo ;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from departamento where idinmu=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            String sql2 = "Delete from inmueble where idinmu=?";
            PreparedStatement st2 = conn.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       
    }
    
    //eliminar una oficina
    public void delOficina(int id){
        int codigo ;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from oficina where idinmu=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            String sql2 = "Delete from inmueble where idinmu=?";
            PreparedStatement st2 = conn.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       
    }
    
    //eliminar un local
    public void delLocal(int id){
        int codigo ;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from local where idinmu=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            String sql2 = "Delete from inmueble where idinmu=?";
            PreparedStatement st2 = conn.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       
    }
    
    //eliminar un terreno
    public void delTerreno(int id){
        int codigo ;
        Connection conn = null;
   try {
            conn = MySQLConexion.getConexion();
            //invocando a un procedure
            String sql = "Delete from terreno where idinmu=?";
            //PreparedStatement st2=conn.prepareStatement("insert into alumno(?,?,?,?,?)");
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
            String sql2 = "Delete from inmueble where idinmu=?";
            PreparedStatement st2 = conn.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
       
    }
    
    //buscar un inmueble
    public List<Inmueble> searchInmueble(int inmu, int tipo){
        List<Inmueble> lis = new ArrayList<>();

            switch(inmu){
                case 1:
                    lis=searchCasa(tipo);
                    break;
                case 2:
                    lis=searchDep(tipo);
                    break;
                case 3:
                    lis=searchOficina(tipo);
                    break;
                case 4:
                    lis=searchLocal(tipo);
                    break;
                case 5:
                    lis=searchTerreno(tipo);
                    break;
            }
        return lis;
    }
    
    public List<Inmueble> searchCasa(int tipo){
        List<Inmueble> lis = new ArrayList<>();
        String sql="";
        PreparedStatement st =null;
        Connection conn = null;
    try {
        conn = MySQLConexion.getConexion();
        sql = "SELECT * from inmueble i NATURAL JOIN casa c WHERE i.idinmu=c.idinmu and i.estado=0 and i.tipo=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, tipo);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(2));
                a.setDireccion(rs.getString(3));
                a.setArea(rs.getDouble(4));
                a.setImg(rs.getString(5));
                a.setDescripcion(rs.getString(6));
                a.setPrecio(rs.getDouble(7));
                a.setTipo(rs.getInt(8));
                a.setEstado(rs.getInt(9));
                a.setNumHab(rs.getInt(10));
                a.setNumBanio(rs.getInt(11));
                a.setNumGarage(rs.getInt(12));
                a.setAnioConst(rs.getInt(13));
	        lis.add(a);
            }
    } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    public List<Inmueble> searchDep(int tipo){
        List<Inmueble> lis = new ArrayList<>();
        String sql="";
        PreparedStatement st =null;
        Connection conn = null;
    try {
        conn = MySQLConexion.getConexion();
        sql = "SELECT * from inmueble i NATURAL JOIN departamento d WHERE i.idinmu=d.idinmu and i.estado=0 and i.tipo=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, tipo);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(2));
                a.setDireccion(rs.getString(3));
                a.setArea(rs.getDouble(4));
                a.setImg(rs.getString(5));
                a.setDescripcion(rs.getString(6));
                a.setPrecio(rs.getDouble(7));
                a.setTipo(rs.getInt(8));
                a.setEstado(rs.getInt(9));
                a.setNumHab(rs.getInt(10));
                a.setNumBanio(rs.getInt(11));
                a.setNumGarage(rs.getInt(12));
                a.setAnioConst(rs.getInt(13));
	        lis.add(a);
            }
    } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    public List<Inmueble> searchOficina(int tipo){
        List<Inmueble> lis = new ArrayList<>();
        String sql="";
        PreparedStatement st =null;
        Connection conn = null;
    try {
        conn = MySQLConexion.getConexion();
        sql = "SELECT * from inmueble i NATURAL JOIN oficina o WHERE i.idinmu=o.idinmu and i.estado=0 and i.tipo=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, tipo);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(2));
                a.setDireccion(rs.getString(3));
                a.setArea(rs.getDouble(4));
                a.setImg(rs.getString(5));
                a.setDescripcion(rs.getString(6));
                a.setPrecio(rs.getDouble(7));
                a.setTipo(rs.getInt(8));
                a.setEstado(rs.getInt(9));
                a.setNumBanio(rs.getInt(10));
                a.setNumGarage(rs.getInt(11));
                a.setAnioConst(rs.getInt(12));
	        lis.add(a);
            }
    } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    public List<Inmueble> searchLocal(int tipo){
        List<Inmueble> lis = new ArrayList<>();
        String sql="";
        PreparedStatement st =null;
        Connection conn = null;
    try {
        conn = MySQLConexion.getConexion();
        sql = "SELECT * from inmueble i NATURAL JOIN local l WHERE i.idinmu=l.idinmu and i.estado=0 and i.tipo=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, tipo);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(2));
                a.setDireccion(rs.getString(3));
                a.setArea(rs.getDouble(4));
                a.setImg(rs.getString(5));
                a.setDescripcion(rs.getString(6));
                a.setPrecio(rs.getDouble(7));
                a.setTipo(rs.getInt(8));
                a.setEstado(rs.getInt(9));
                a.setAnioConst(rs.getInt(10));
	        lis.add(a);
            }
    } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    public List<Inmueble> searchTerreno(int tipo){
        List<Inmueble> lis = new ArrayList<>();
        String sql="";
        PreparedStatement st =null;
        Connection conn = null;
    try {
        conn = MySQLConexion.getConexion();
        sql = "SELECT * from inmueble i NATURAL JOIN terreno t WHERE i.idinmu=t.idinmu and i.estado=0 and i.tipo=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, tipo);
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Inmueble a = new Inmueble();
                a.setIdInmueble(rs.getInt(1));
                a.setTitulo(rs.getString(2));
                a.setDireccion(rs.getString(3));
                a.setArea(rs.getDouble(4));
                a.setImg(rs.getString(5));
                a.setDescripcion(rs.getString(6));
                a.setPrecio(rs.getDouble(7));
                a.setTipo(rs.getInt(8));
                a.setEstado(rs.getInt(9));
	        lis.add(a);
            }
    } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
    
    
    
    //Actualizar Datos de una Casa
    public Casa buscaInmu(int id) {
        Casa c=null;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select * from inmueble i NATURAL JOIN casa c WHERE i.idinmu=c.idinmu and c.idinmu=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                c = new Casa();
                c.setIdInmu(rs.getInt(1));
                c.setTitulo(rs.getString(2));
                c.setDireccion(rs.getString(3));
                c.setArea(rs.getDouble(4));
                c.setImg(rs.getString(5));
                c.setDescrip(rs.getString(6));
                c.setPrecio(rs.getDouble(7));
                c.setTipo(rs.getInt(8));
                c.setEstado(rs.getInt(9));
                c.setNumhab(rs.getInt(10));
                c.setNumbanio(rs.getInt(11));
                c.setNumgarage(rs.getInt(12));
                c.setAniocost(rs.getInt(13));
	     }
        }
        catch(Exception ex){ex.printStackTrace();}
        finally{try{if(conn != null){conn.close();}}catch(Exception e2){}}
        return c;
    }
    
    public void Actua_Casa(Casa c){
          Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call update_casa(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setInt(1, c.getIdInmu());
            st.setString(2, c.getTitulo());
            st.setString(3, c.getDireccion());
            st.setDouble(4, c.getArea());
            st.setString(5, c.getDescrip());
            st.setDouble(6, c.getPrecio());
            st.setInt(7, c.getTipo());
            st.setInt(8, c.getEstado());
            st.setInt(9, c.getNumhab());
            st.setInt(10, c.getNumbanio());
            st.setInt(11, c.getNumgarage());
            st.setInt(12, c.getAniocost());
            st.setString(13, c.getImg());
            st.executeUpdate();
        }
        catch (Exception ex) {ex.printStackTrace();}
        finally {try {if(conn != null){conn.close();}}catch (Exception e2){}}
    }
    public Departamento buscaDepa(int id) {
        Departamento d=null;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select * from inmueble i NATURAL JOIN departamento d WHERE i.idinmu=d.idinmu and d.idinmu=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                d = new Departamento();
                d.setIdInmu(rs.getInt(1));
                d.setTitulo(rs.getString(2));
                d.setDireccion(rs.getString(3));
                d.setArea(rs.getDouble(4));
                d.setImg(rs.getString(5));
                d.setDescrip(rs.getString(6));
                d.setPrecio(rs.getDouble(7));
                d.setTipo(rs.getInt(8));
                d.setEstado(rs.getInt(9));
                d.setNumhab(rs.getInt(10));
                d.setNumbanio(rs.getInt(11));
                d.setNumgarage(rs.getInt(12));
                d.setAniocost(rs.getInt(13));
	     }
        }
        catch(Exception ex){ex.printStackTrace();}
        finally{try{if(conn != null){conn.close();}}catch(Exception e2){}}
        return d;
    }
    public void Actua_Depa(Departamento d){
          Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call update_departamento(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setInt(1, d.getIdInmu());
            st.setString(2, d.getTitulo());
            st.setString(3, d.getDireccion());
            st.setDouble(4, d.getArea());
            st.setString(5, d.getDescrip());
            st.setDouble(6, d.getPrecio());
            st.setInt(7, d.getTipo());
            st.setInt(8, d.getEstado());
            st.setInt(9, d.getNumhab());
            st.setInt(10, d.getNumbanio());
            st.setInt(11, d.getNumgarage());
            st.setInt(12, d.getAniocost());
            st.setString(13, d.getImg());
            st.executeUpdate();
        }
        catch (Exception ex) {ex.printStackTrace();}
        finally {try {if(conn != null){conn.close();}}catch (Exception e2){}}
    }
    public Local buscaLocal(int id) {
        Local l=null;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select * from inmueble i NATURAL JOIN local l WHERE i.idinmu=l.idinmu and l.idinmu=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                l = new Local();
                l.setIdInmu(rs.getInt(1));
                l.setTitulo(rs.getString(2));
                l.setDireccion(rs.getString(3));
                l.setArea(rs.getDouble(4));
                l.setImg(rs.getString(5));
                l.setDescrip(rs.getString(6));
                l.setPrecio(rs.getDouble(7));
                l.setTipo(rs.getInt(8));
                l.setEstado(rs.getInt(9));
                l.setAniocost(rs.getInt(10));
	     }
        }
        catch(Exception ex){ex.printStackTrace();}
        finally{try{if(conn != null){conn.close();}}catch(Exception e2){}}
        return l;
    }
    public void Actua_Local(Local l){
          Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call update_local(?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setInt(1, l.getIdInmu());
            st.setString(2, l.getTitulo());
            st.setString(3, l.getDireccion());
            st.setDouble(4, l.getArea());
            st.setString(5, l.getDescrip());
            st.setDouble(6, l.getPrecio());
            st.setInt(7, l.getTipo());
            st.setInt(8, l.getEstado());
            st.setInt(9, l.getAniocost());
            st.setString(10, l.getImg());
            st.executeUpdate();
        }
        catch (Exception ex) {ex.printStackTrace();}
        finally {try {if(conn != null){conn.close();}}catch (Exception e2){}}
    }
    public Oficina buscaOfi(int id) {
        Oficina o=null;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select * from inmueble i NATURAL JOIN oficina o WHERE i.idinmu=o.idinmu and o.idinmu=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                o = new Oficina();
                o.setIdInmu(rs.getInt(1));
                o.setTitulo(rs.getString(2));
                o.setDireccion(rs.getString(3));
                o.setArea(rs.getDouble(4));
                o.setImg(rs.getString(5));
                o.setDescrip(rs.getString(6));
                o.setPrecio(rs.getDouble(7));
                o.setTipo(rs.getInt(8));
                o.setEstado(rs.getInt(9));
                o.setNumbanio(rs.getInt(10));
                o.setNumgarage(rs.getInt(11));
                o.setAniocost(rs.getInt(12));
	     }
        }
        catch(Exception ex){ex.printStackTrace();}
        finally{try{if(conn != null){conn.close();}}catch(Exception e2){}}
        return o;
    }
    public void Actua_Ofi(Oficina o){
          Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call update_oficina(?,?,?,?,?,?,?,?,?,?,?,?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setInt(1, o.getIdInmu());
            st.setString(2, o.getTitulo());
            st.setString(3, o.getDireccion());
            st.setDouble(4, o.getArea());
            st.setString(5, o.getDescrip());
            st.setDouble(6, o.getPrecio());
            st.setInt(7, o.getTipo());
            st.setInt(8, o.getEstado());
            st.setInt(9, o.getNumbanio());
            st.setInt(10, o.getNumgarage());
            st.setInt(11, o.getAniocost());
            st.setString(12, o.getImg());
            st.executeUpdate();
        }
        catch (Exception ex) {ex.printStackTrace();}
        finally {try {if(conn != null){conn.close();}}catch (Exception e2){}}
    }
    public Terreno buscaTerre(int id) {
        Terreno t=null;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select * from inmueble i NATURAL JOIN terreno t WHERE i.idinmu=t.idinmu and t.idinmu=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                t = new Terreno();
                t.setIdInmu(rs.getInt(1));
                t.setTitulo(rs.getString(2));
                t.setDireccion(rs.getString(3));
                t.setArea(rs.getDouble(4));
                t.setImg(rs.getString(5));
                t.setDescrip(rs.getString(6));
                t.setPrecio(rs.getDouble(7));
                t.setTipo(rs.getInt(8));
                t.setEstado(rs.getInt(9));
	     }
        }
        catch(Exception ex){ex.printStackTrace();}
        finally{try{if(conn != null){conn.close();}}catch(Exception e2){}}
        return t;
    }
    public void Actua_Terre(Terreno t){
          Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call update_terreno(?,?,?,?,?,?,?,?,?)}";
            CallableStatement st = conn.prepareCall(sql);
            st.setInt(1, t.getIdInmu());
            st.setString(2, t.getTitulo());
            st.setString(3, t.getDireccion());
            st.setDouble(4, t.getArea());
            st.setString(5, t.getDescrip());
            st.setDouble(6, t.getPrecio());
            st.setInt(7, t.getTipo());
            st.setInt(8, t.getEstado());
            st.setString(9, t.getImg());
            st.executeUpdate();
        }
        catch (Exception ex) {ex.printStackTrace();}
        finally {try {if(conn != null){conn.close();}}catch (Exception e2){}}
    }
    
    public int numCasaT(){
        int num=0;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(*) FROM casa";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return num;
    }
    
    public int numDepT(){
        int num=0;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(*) FROM departamento";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return num;
    }
    
    public int numOfiT(){
        int num=0;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(*) FROM oficina";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return num;
    }
    
    public int numLocT(){
        int num=0;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(*) FROM local";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return num;
    }
    
    public int numTerrT(){
        int num=0;
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(*) FROM terreno";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return num;
    }
    
    public void Registrar(Cliente cli) {
        
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call registrarCli(?,?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, cli.getNomcli());
            cs.setString(2, cli.getApecli());
            cs.setString(3, cli.getEmailcli());
            cs.setString(4, cli.getCelcli());
            cs.setString(5, cli.getPasscli());
            cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
    }
    
    public Cliente busCli(String email) {
        int nivel=0;//0=admin, 1=user
        Cliente cli=null;
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT c.idcliente, c.nomcli, c.emailcli, c.passcli FROM cliente c where c.emailcli=?";
            String sql2="SELECT * FROM admin a where a.useradmin=?" ;
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            
            PreparedStatement st2 = conn.prepareStatement(sql2);
            st2.setString(1, email);
            ResultSet rs2 = st2.executeQuery();

            if (rs.next()) {
                
                    cli = new Cliente();
                    cli.setIdcli(rs.getInt(1));
                    cli.setNomcli(rs.getString(2));
                    cli.setEmailcli(rs.getString(3));
                    cli.setPasscli(rs.getString(4));
                    nivel=1;
                    cli.setNivel(nivel);
                           
                
            }
            
            if(rs2.next()){
                
                    cli = new Cliente();
                    cli.setIdcli(rs2.getInt(1));
                    cli.setNomcli(rs2.getString(2));
                    cli.setPasscli(rs2.getString(3));
                    cli.setNivel(nivel);
                
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return cli;
    }
    
    public void compra(int idcli, int idinmu, double total) {
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "{call insert_compra(?,?,?,?)}";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, idcli);
            cs.setInt(2, idinmu);
            cs.setInt(3, 1);
            cs.setDouble(4, total);
            cs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
    }
}
