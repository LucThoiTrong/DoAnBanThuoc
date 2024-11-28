package Model.DatabaseModels;

import java.util.Set;

public interface IDAO <T>{
    public boolean insert(T obj);
    public boolean update(T obj);
    public boolean delete(T obj);
    public Set<T> SelectAll();
    public T SelectById(int id);
    public Set<T> SelectByID(int id);
}
