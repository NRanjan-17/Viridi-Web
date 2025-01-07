
import com.techno4.viridi.dao.UserDao;
import com.techno4.viridi.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class UserDaoTest {

    @Mock
    private SessionFactory factory;

    @Mock
    private Session session;

    @Mock
    private Query<User> query;

    private UserDao userDao;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        userDao = new UserDao(factory);
        when(factory.openSession()).thenReturn(session);
    }

    @Test
    void getUserCount_Success() {
        // Arrange
        long expectedCount = 5L;
        Query<Long> countQuery = mock(Query.class);
        when(session.createQuery(anyString())).thenReturn(countQuery);
        when(countQuery.getSingleResult()).thenReturn(expectedCount);

        // Act
        long result = userDao.getUserCount();

        // Assert
        assertEquals(expectedCount, result);
        verify(session).close();
    }

    @Test
    void getUserCount_ReturnsZeroWhenNull() {
        // Arrange
        Query<Long> countQuery = mock(Query.class);
        when(session.createQuery(anyString())).thenReturn(countQuery);
        when(countQuery.getSingleResult()).thenReturn(null);

        // Act
        long result = userDao.getUserCount();

        // Assert
        assertEquals(0, result);
        verify(session).close();
    }

    

    @Test
    void getUserByPhoneAndPassword_Success() {
        // Arrange
        String phone = "1234567890";
        String password = "password123";
        User expectedUser = new User();
        
        when(session.createQuery(anyString())).thenReturn(query);
        when(query.setParameter("e", phone)).thenReturn(query);
        when(query.setParameter("p", password)).thenReturn(query);
        when(query.uniqueResult()).thenReturn(expectedUser);

        // Act
        User result = userDao.getUserByPhoneAndPassword(phone, password);

        // Assert
        assertNotNull(result);
        assertEquals(expectedUser, result);
        verify(query).setParameter("e", phone);
        verify(query).setParameter("p", password);
        verify(session).close();
    }

    @Test
    void getUserByPhoneAndPassword_UserNotFound() {
        // Arrange
        String phone = "1234567890";
        String password = "password123";
        
        when(session.createQuery(anyString())).thenReturn(query);
        when(query.setParameter("e", phone)).thenReturn(query);
        when(query.setParameter("p", password)).thenReturn(query);
        when(query.uniqueResult()).thenReturn(null);

        // Act
        User result = userDao.getUserByPhoneAndPassword(phone, password);

        // Assert
        assertNull(result);
        verify(session).close();
    }

  

    @Test
    void getUserByPhoneAndPassword_WithEmptyCredentials() {
        // Arrange
        String phone = "";
        String password = "";
        
        when(session.createQuery(anyString())).thenReturn(query);
        when(query.setParameter("e", phone)).thenReturn(query);
        when(query.setParameter("p", password)).thenReturn(query);
        when(query.uniqueResult()).thenReturn(null);

        // Act
        User result = userDao.getUserByPhoneAndPassword(phone, password);

        // Assert
        assertNull(result);
        verify(session).close();
    }
}