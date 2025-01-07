
import com.techno4.viridi.dao.CategoryDao;
import com.techno4.viridi.entities.Category;
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

class CategoryDaoTest {

    @Mock
    private SessionFactory factory;

    @Mock
    private Session session;

    @Mock
    private Transaction transaction;

    @Mock
    private Query<Category> query;

    private CategoryDao categoryDao;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        categoryDao = new CategoryDao(factory);
        when(factory.openSession()).thenReturn(session);
        when(session.beginTransaction()).thenReturn(transaction);
    }

    @Test
    void saveCategory_Success() {
        // Arrange
        Category category = new Category();
        int expectedId = 1;
        when(session.save(any(Category.class))).thenReturn(expectedId);

        // Act
        int result = categoryDao.saveCategory(category);

        // Assert
        assertEquals(expectedId, result);
        verify(session).save(category);
        verify(transaction).commit();
        verify(session).close();
    }

 

    @Test
    void getCategories_Success() {
        // Arrange
        List<Category> expectedCategories = new ArrayList<>();
        expectedCategories.add(new Category());
        
        when(session.createQuery(anyString())).thenReturn(query);
        when(query.list()).thenReturn(expectedCategories);

        // Act
        List<Category> result = categoryDao.getCategories();

        // Assert
        assertEquals(expectedCategories, result);
        verify(session).createQuery("from Category");
    }

    @Test
    void getCategories_EmptyList() {
        // Arrange
        when(session.createQuery(anyString())).thenReturn(query);
        when(query.list()).thenReturn(new ArrayList<>());

        // Act
        List<Category> result = categoryDao.getCategories();

        // Assert
        assertTrue(result.isEmpty());
    }

    @Test
    void getCategoryById_Success() {
        // Arrange
        int categoryId = 1;
        Category expectedCategory = new Category();
        when(session.get(Category.class, categoryId)).thenReturn(expectedCategory);

        // Act
        Category result = categoryDao.getCategoryById(categoryId);

        // Assert
        assertEquals(expectedCategory, result);
        verify(session).close();
    }

    @Test
    void getCategoryById_NotFound() {
        // Arrange
        int categoryId = 1;
        when(session.get(Category.class, categoryId)).thenReturn(null);

        // Act
        Category result = categoryDao.getCategoryById(categoryId);

        // Assert
        assertNull(result);
        verify(session).close();
    }

  
    @Test
    void getCategoryCount_Success() {
        // Arrange
        long expectedCount = 5L;
        Query<Long> countQuery = mock(Query.class);
        when(session.createQuery(anyString())).thenReturn(countQuery);
        when(countQuery.getSingleResult()).thenReturn(expectedCount);

        // Act
        long result = categoryDao.getCategoryCount();

        // Assert
        assertEquals(expectedCount, result);
        verify(session).close();
    }

    @Test
    void getCategoryCount_ReturnsZeroWhenNull() {
        // Arrange
        Query<Long> countQuery = mock(Query.class);
        when(session.createQuery(anyString())).thenReturn(countQuery);
        when(countQuery.getSingleResult()).thenReturn(null);

        // Act
        long result = categoryDao.getCategoryCount();

        // Assert
        assertEquals(0, result);
        verify(session).close();
    }

  
}