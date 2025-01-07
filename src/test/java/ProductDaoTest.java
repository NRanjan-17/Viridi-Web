
import com.techno4.viridi.dao.ProductDao;
import com.techno4.viridi.entities.Product;
import com.techno4.viridi.entities.Category;
import com.techno4.viridi.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class ProductDaoTest {

    @Mock
    private SessionFactory sessionFactory;

    @Mock
    private Session session;

    @Mock
    private Transaction transaction;

    @Mock
    private Query<Product> query;

    private ProductDao productDao;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        productDao = new ProductDao(sessionFactory);
        when(sessionFactory.openSession()).thenReturn(session);
        when(session.beginTransaction()).thenReturn(transaction);
    }

    @Test
    void saveProduct_Success() {
        // Arrange
        Product product = new Product();
        when(session.save(any(Product.class))).thenReturn(1);

        // Act
        boolean result = productDao.saveProduct(product);

        // Assert
        assertTrue(result);
        verify(session).save(product);
        verify(transaction).commit();
    }

    @Test
    void saveProduct_Failure() {
        // Arrange
        Product product = new Product();
        doThrow(new RuntimeException("DB Error")).when(session).save(any(Product.class));

        // Act
        boolean result = productDao.saveProduct(product);

        // Assert
        assertFalse(result);
        verify(transaction).rollback();
    }

    @Test
    void getAllProducts_Success() {
        // Arrange
        List<Product> expectedProducts = new ArrayList<>();
        expectedProducts.add(new Product());
        when(session.createQuery(anyString(), eq(Product.class))).thenReturn(query);
        when(query.list()).thenReturn(expectedProducts);

        // Act
        List<Product> result = productDao.getAllProducts();

        // Assert
        assertEquals(expectedProducts, result);
        verify(session).createQuery("from Product", Product.class);
    }

    @Test
    void getAllProductsById_Success() {
        // Arrange
        int categoryId = 1;
        List<Product> expectedProducts = new ArrayList<>();
        when(session.createQuery(anyString(), eq(Product.class))).thenReturn(query);
        when(query.setParameter(anyString(), any())).thenReturn(query);
        when(query.list()).thenReturn(expectedProducts);

        // Act
        List<Product> result = productDao.getAllProductsById(categoryId);

        // Assert
        assertEquals(expectedProducts, result);
        verify(query).setParameter("id", categoryId);
    }

    @Test
    void getAllProductsByFarmerId_Success() {
        // Arrange
        int farmerId = 1;
        List<Product> expectedProducts = new ArrayList<>();
        when(session.createQuery(anyString(), eq(Product.class))).thenReturn(query);
        when(query.setParameter(anyString(), any())).thenReturn(query);
        when(query.list()).thenReturn(expectedProducts);

        // Act
        List<Product> result = productDao.getAllProductsByFarmerId(farmerId);

        // Assert
        assertEquals(expectedProducts, result);
        verify(query).setParameter("farmerId", farmerId);
    }

    @Test
    void getProductById_Success() {
        // Arrange
        int productId = 1;
        Product expectedProduct = new Product();
        when(session.get(Product.class, productId)).thenReturn(expectedProduct);

        // Act
        Product result = productDao.getProductById(productId);

        // Assert
        assertEquals(expectedProduct, result);
    }

    @Test
    void getProductCount_Success() {
        // Arrange
        long expectedCount = 5L;
        Query<Long> countQuery = mock(Query.class);
        when(session.createQuery(anyString())).thenReturn(countQuery);
        when(countQuery.getSingleResult()).thenReturn(expectedCount);

        // Act
        long result = productDao.getProductCount();

        // Assert
        assertEquals(expectedCount, result);
    }

    @Test
    void updateProduct_Success() {
        // Arrange
        Product product = new Product();

        // Act
        boolean result = productDao.updateProduct(product);

        // Assert
        assertTrue(result);
        verify(session).update(product);
        verify(transaction).commit();
    }

    @Test
    void updateProduct_Failure() {
        // Arrange
        Product product = new Product();
        doThrow(new RuntimeException("DB Error")).when(session).update(any(Product.class));

        // Act
        boolean result = productDao.updateProduct(product);

        // Assert
        assertFalse(result);
        verify(transaction).rollback();
    }

    @Test
    void deleteProduct_Success() {
        // Arrange
        int productId = 1;
        Product product = new Product();
        when(session.get(Product.class, productId)).thenReturn(product);

        // Act
        boolean result = productDao.deleteProduct(productId);

        // Assert
        assertTrue(result);
        verify(session).delete(product);
        verify(transaction).commit();
    }

    @Test
    void deleteProduct_NotFound() {
        // Arrange
        int productId = 1;
        when(session.get(Product.class, productId)).thenReturn(null);

        // Act
        boolean result = productDao.deleteProduct(productId);

        // Assert
        assertFalse(result);
        verify(session, never()).delete(any());
        verify(transaction).commit();
    }

    @Test
    void deleteProduct_Failure() {
        // Arrange
        int productId = 1;
        Product product = new Product();
        when(session.get(Product.class, productId)).thenReturn(product);
        doThrow(new RuntimeException("DB Error")).when(session).delete(any(Product.class));

        // Act
        boolean result = productDao.deleteProduct(productId);

        // Assert
        assertFalse(result);
        verify(transaction).rollback();
    }
}