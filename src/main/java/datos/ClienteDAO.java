package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;

/**
 *
 * @author Gisell L
 */

public class ClienteDAO {

    // CRUD -Create - Read - Update - Delete
    private static final String SQL_SELECT = "SELECT id_cliente, nombre, apellido, email, movil, saldo FROM clientes";
    private static final String SQL_INSERT = "INSERT INTO clientes(nombre, apellido, email, movil, saldo) VALUES(?, ?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT id_cliente, nombre, apellido, email, movil, saldo FROM clientes WHERE id_cliente = ?";
    private static final String SQL_UPDATE = "UPDATE clientes SET nombre=?, apellido=?, email=?, movil=?, saldo=? WHERE id_cliente=?";
    private static final String SQL_DELETE = "DELETE FROM clientes WHERE id_cliente =?";

    public List<Cliente> listar() {
        List<Cliente> clientes = new ArrayList<>();
        try (Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_SELECT); ResultSet rs = stmt.executeQuery()) {
            // Iterar los clientes de la bd
            while (rs.next()) {
                Cliente cliente = new Cliente(
                        rs.getInt("id_cliente"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("email"),
                        rs.getString("movil"),
                        rs.getDouble("saldo")
                );
                clientes.add(cliente);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return clientes;
    }

    public int insertar(Cliente cliente) {
        int rows = 0;
        try (Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_INSERT)) {
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getApellido());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getMovil());
            stmt.setDouble(5, cliente.getSaldo());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return rows;
    }

    public Cliente encontrarCliente(Cliente cliente) {
        try (Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID)) {
            stmt.setInt(1, cliente.getIdCliente());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    cliente.setNombre(rs.getString("nombre"));
                    cliente.setApellido(rs.getString("apellido"));
                    cliente.setEmail(rs.getString("email"));
                    cliente.setMovil(rs.getString("movil"));
                    cliente.setSaldo(rs.getDouble("saldo"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return cliente;
    }

    public int actualizar(Cliente cliente) {
        int rows = 0;
        try (Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE)) {
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getApellido());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getMovil());
            stmt.setDouble(5, cliente.getSaldo());
            stmt.setInt(6, cliente.getIdCliente());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return rows;
    }

    public int eliminar(Cliente cliente) {
        int rows = 0;
        try (Connection conn = Conexion.getConnection(); 
                PreparedStatement stmt = conn.prepareStatement(SQL_DELETE)) {
            stmt.setInt(1, cliente.getIdCliente());
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return rows;
    }
}
