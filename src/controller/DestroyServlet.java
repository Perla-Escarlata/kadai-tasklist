package controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Task;
import utils.DBUtil;

@WebServlet("/destroy")
public class DestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DestroyServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            //セッションスコープからタスクIDを取得して
            //該当の1件をDBから取得
            Task t = em.find(Task.class, (Integer)(request.getSession().getAttribute("task_id")));

            //削除実行
            em.getTransaction().begin();
            em.remove(t);
            em.getTransaction().commit();
            request.getSession().setAttribute("flush", "削除完了！");
            em.close();

            //セッションスコープの中身を削除
            request.getSession().removeAttribute("task_id");

            //indexページへリダイレクト
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

}
