package com.example.CoffeeLounge.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private double total;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "order")
    List<OrderDetail> orderDetails;

    @NotBlank(message = "You must input your First name!!!")
    @Size(max = 100, message = "Input box cannot exceed 100 characters.")
    private String firstName;

    @NotBlank(message = "You must input your First name!!!")
    @Size(max = 100, message = "Input box cannot exceed 100 characters.")
    private String lastName;

    @NotBlank(message = "You must choose your country!!!")
    private String country;

    @NotBlank(message = "You must input your street address!!!")
    @Size(max = 255, message = "Input box cannot exceed 255 characters.")
    private String street;

    @NotBlank(message = "You must input your town address!!!")
    @Size(max = 255, message = "Input box cannot exceed 255 characters.")
    private String town;

    @NotBlank(message = "You must input your country postcode !!!")
    @Size(max = 255, message = "Input box cannot exceed 255 characters.")
    private String postcode;

    @NotBlank(message = "You must input your phone!!!")
    @Size(max = 255, message = "Input box cannot exceed 255 characters.")
    private String phone;

    @NotBlank(message = "You must input your email address!!!")
    @Size(max = 255, message = "Input box cannot exceed 255 characters.")
    private String email;
    private String notes;

    private String status;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Order [id=" + id + ", total=" + total + ", user=" + user + ", orderDetails=" + orderDetails
                + ", firstName=" + firstName + ", lastName=" + lastName + ", country=" + country + ", street=" + street
                + ", town=" + town + ", postCode=" + postcode + ", phone=" + phone + ", email=" + email + ", notes="
                + notes + "]";
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
