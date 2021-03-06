package tul.ppj.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import tul.ppj.entities.Likes;

import java.util.List;

/**
 * Created by Marek on 12.05.2016.
 */
@Component
public class LikesDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public LikesDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public LikesDAO() {

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Transactional
    public void insert(Likes likes) {

        Session session = getSessionFactory().getCurrentSession();

        session.save(likes);


    }
    @Transactional
    public int getCountLikes(int id){
        List<Likes> myList = sessionFactory.getCurrentSession().createQuery("from Likes where ID_images ='" + id + " 'and Result=1").list();
        if (myList.isEmpty()) {
            return 0;
        } else {
            return myList.size();
        }
    }
    @Transactional
    public int getCountDisLikes(int id){
        List<Likes> myList = sessionFactory.getCurrentSession().createQuery("from Likes where ID_images ='" + id + "' and Result=-1").list();
        if (myList.isEmpty()) {
            return 0;
        } else {
            return myList.size();
        }
    }
}
