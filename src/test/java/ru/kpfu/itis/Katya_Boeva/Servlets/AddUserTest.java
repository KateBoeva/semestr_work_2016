package ru.kpfu.itis.Katya_Boeva.Servlets;

import org.junit.Before;
import org.junit.Test;
import ru.kpfu.itis.Katya_Boeva.DataBase.DataBase;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 * Created by katemrrr on 22.11.16.
 */
public class AddUserTest {

    private HttpServletRequest request;
    private HttpServletResponse response;

    @Before
    public void setUp() throws Exception {
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
    }

    @Test
    public void testEmailWarning() throws ServletException, Exception {

        when(request.getParameter("name")).thenReturn("testuser");
        when(request.getParameter("email")).thenReturn("mail");
        when(request.getParameter("password")).thenReturn("password");
        when(request.getParameter("password_2")).thenReturn("password");

        new AddUser().doPost(request, response);

        verify(request).getParameter("password");
        verify(request).getParameter("password_2");
        verify(request).getParameter("email");
        verifyNoMoreInteractions(request);

    }

    @Test
    public void testPasswordsWarning() throws ServletException, Exception {

        when(request.getParameter("name")).thenReturn("testuser");
        when(request.getParameter("email")).thenReturn("admin@mail.ru");
        when(request.getParameter("password")).thenReturn("password2");
        when(request.getParameter("password_2")).thenReturn("password");

        new AddUser().doPost(request, response);

        verify(request).getParameter("password");
        verify(request).getParameter("password_2");
        verifyNoMoreInteractions(request);

    }

}