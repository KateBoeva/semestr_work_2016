package ru.kpfu.itis.Katya_Boeva.Servlets;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import ru.kpfu.itis.Katya_Boeva.DataBase.DataBase;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static org.junit.Assert.*;

/**
 * Created by katemrrr on 22.11.16.
 */
public class AuthTest extends Mockito {

    private HttpServletRequest request;
    private HttpServletResponse response;

    @Before
    public void setUp(){
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
        when(request.getParameter("isRemember")).thenReturn("on");
    }

    @Test
    public void testAuthRightUser() throws ServletException, IOException {

        when(request.getParameter("email")).thenReturn("admin");
        when(request.getParameter("password")).thenReturn("admin");

        new Auth().doPost(request, response);

        verify(request).getParameter("email");
        verify(request).getParameter("password");
        verify(request).getParameter("isRemember");

    }

    @Test
    public void testAuthWarningUser() throws ServletException, IOException {

        when(request.getParameter("email")).thenReturn("admin1");
        when(request.getParameter("password")).thenReturn("admin1");

        new Auth().doPost(request, response);

        verify(request).getParameter("email");
        verify(request).getParameter("password");
        verifyNoMoreInteractions(request);

    }

}