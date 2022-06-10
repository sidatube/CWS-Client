package com.example.cwsclient.Service;

import com.example.cwsclient.entity.Employee;
import retrofit2.Call;
import retrofit2.http.*;

import java.util.List;

public interface EmployeeService {
    @GET("api/v1/employees")
    Call<List<Employee>> getProducts();

    @GET("api/v1/employees/{id}")
    Call<Employee> findById(@Path("id") int id);

    @POST("api/v1/employees")
    Call<Employee> save(@Body Employee employee);

    @PUT("api/v1/employees/{id}")
    Call<Boolean> update(@Path("id") int id, @Body Employee employee);

    @DELETE("api/v1/employees/{id}")
    Call<Boolean> delete(@Path("id") int id);


}
