package controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Task;
import utils.DBUtil;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            //セッションスコープからタスクIDを取得し
            //該当のタスク1件をDBから取得
            Task t = em.find(Task.class, Integer.parseInt(request.getParameter("id")));

            //フォームの内容を各フィールドに上書き
            String title = request.getParameter("title");
            t.setTitle(title);

            String content = request.getParameter("content");
            t.setContent(content);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            t.setUpdated_at(currentTime);

            //DBを更新
            em.getTransaction().begin();
            em.getTransaction().commit();
            em.close();

            //セッションスコープの不要になったIDを削除
            request.getSession().removeAttribute("task_id");

            //indexへリダイレクト
            response.sendRedirect(request.getContextPath() + "/index");
        }


    }

}
