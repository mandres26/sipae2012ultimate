package Utilidades; // coloca la clase compilada en tpvlibre/conexiones
import java.sql.*;  // libreria para trabajar con bases de datos desde java
import java.util.logging.*;// libreria para trabajar con logger
/*author John Carlos Arrieta Arrieta */


public class ManejadorBaseDatos {
    private Connection conexion; // Abtrae una conexion a la base de datos
    private String usuario = " isc_ceim "; // usuario con permisos para conectarse a BD
    private String password = "/*S1p43BD*/"; // contrase�a del usuario que se puede conectar
    private String driver = "com.mysql.jdbc.Driver"; // Clase del Driver de jConnector
    //cadena de conxion a la base de datos por defecto
    private String basedatos = "jdbc:mysql://iscsas.net:3306/isc_sipae";
    private static ManejadorBaseDatos instancia; // patron de dise�o singleton
    private Logger log = Logger.getLogger(Utilidades.ManejadorBaseDatos.
                                          class.getName());
  /* Patron de dise�o singleton que impide que existan al mismo tiemp dos o mas 
     instancias del obejeto ManejadorBaseDatos dentro del sistema   */
// cosntructor por defecto, le da valores por defecto a los atributos de la clase
    public static  ManejadorBaseDatos getInstancia() {
        if(ManejadorBaseDatos.instancia == null){
            ManejadorBaseDatos.instancia = new ManejadorBaseDatos();
        }
        return instancia;
    }
// metodo que establece una conexin a la base de datos
  public void conectar() throws Exception{
         if(this.getConexion() != null){ 
           if(!this.getConexion().isClosed()){
                return; // si hay una coexion previa no se conecta
           }
        }
        try{
             Class.forName(this.getDriver()) ; // obtine una istancia de la clase Diver
// establece la conexion con el Diver jconector y este a su vez con la base de datos
             System.out.println(this.getBasedatos()+" "+this.getUsuario()+" "+this.getPassword());
             this.setConexion(DriverManager.getConnection(this.getBasedatos(), this.getUsuario(), this.getPassword()));
        }
        catch(ClassNotFoundException er1 ){ // si ocurre un error crea un Log 
            getLog().log(Level.SEVERE, "Error al registar el driver Jconnector", er1);
            throw new Exception("Error al Conectarse a la Base de Datos"); 
        }
        catch( SQLException er2 ){ // si ocurre un error crea un Log 
           getLog().log(Level.SEVERE, "Error al obtener la conexion ", er2);
           throw new Exception("Error al Conectarse a la Base de Datos"); 
        }
    }
    // metodo para ejecutar sentencias del tipo INSERT, UPDATE o DELETE
   
   

  public void desconectar(ResultSet respuesta){
           Statement sentencia =null;
        try{
            if(respuesta != null){
                sentencia = respuesta.getStatement();
                if(respuesta != null){
                    respuesta.close();
                }
                if(sentencia!= null){
                    sentencia.close();
                }
            }
            if(this.getConexion() != null){
                this.getConexion().close();
            }
        }
        catch(Exception er4){
            respuesta = null;
            sentencia = null;
            this.setConexion(null);
        }
        finally{
            respuesta = null;
            sentencia = null;
            this.setConexion(null);
        }
    }
    
  public void limpiarResultados(ResultSet respuesta){
         Statement sentencia =null;
        try{
             sentencia = respuesta.getStatement();
            if(respuesta != null){
                respuesta.close();
            }
            if(sentencia!= null){
                sentencia.close();
            }
        }
        catch(Exception er4){
            respuesta = null;
            sentencia = null;
          
        }
        finally{
            respuesta = null;
            sentencia = null;
        }
    }
    
  public Connection getConexion() {
        return conexion;
    }

  public String getDriver() {
        return driver;
    }

  public String getPassword() {
        return password;
    }

  public String getUsuario() {
        return usuario;
    }

  public void setBasedatos(String basedatos) {
        this.basedatos = basedatos;
    }

  public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

  public void setDriver(String driver) {
        this.driver = driver;
    }

  public void setPassword(String password) {
        this.password = password;
    }

  public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
 
  private  ManejadorBaseDatos() {
        
    }
   
  public String getBasedatos() {
        return basedatos;
    }

    public static void setInstancia(ManejadorBaseDatos aInstancia) {
        instancia = aInstancia;
    }

    public Logger getLog() {
        return log;
    }

    public void setLog(Logger log) {
        this.log = log;
    }
  
  
}

    
