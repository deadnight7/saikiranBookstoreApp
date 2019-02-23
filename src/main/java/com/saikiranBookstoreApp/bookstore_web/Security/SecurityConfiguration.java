package com.saikiranBookstoreApp.bookstore_web.Security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import java.util.ArrayList;
import java.util.List;

class SecurityConfiguration{
    
}
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration  extends WebSecurityConfigurerAdapter
//{
//
////
////    @Override
////    protected UserDetailsService userDetailsService() {
////        //return super.userDetailsService();
////        List<UserDetails> users = new ArrayList<>();
////        users.add(User.withDefaultPasswordEncoder().username("cpandit").password("password").roles("USER", "ADMIN").build());
////        users.add(User.withDefaultPasswordEncoder().username("fpmoley").password("password").roles("USER").build());
////        users.add(User.withDefaultPasswordEncoder().username("hpandit").password("password").roles("USER").build());
////
////        return new InMemoryUserDetailsManager(users);
////    }
//
//    protected void configure(HttpSecurity http) throws Exception {
//
//        System.out.println("Using default configure(HttpSecurity). If subclassed this will potentially override subclass configure(HttpSecurity).");
//        //((HttpSecurity)((HttpSecurity)((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl)
//        http
//                .csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/","/index", "/css/*", "/js/*").permitAll()
//                .anyRequest().authenticated()
//        .and().httpBasic();
//
//
//               //.authorizeRequests()
//                //.anyRequest()
//                //.authenticated()
//                //.and()
//                //.formLogin().and()
//                //.httpBasic();
//
//
//    }
//
//
//}/*
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@EnableWebSecurity
//public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
////
////    @Autowired
////    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
////        auth
////                .inMemoryAuthentication()
////                .withUser("user").password("password").roles("USER");
////    }
//
//
//
//    @Autowired
//    public void configureGlobal (AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
//
//        authenticationManagerBuilder
//                .inMemoryAuthentication()
//                .withUser("admin")
//                .password("{noop}password")
//                .roles("ADMIN", "USER")
//                .and()
//                .withUser("user")
//                .password("{noop}password")
//                .roles("USER");
//    }
//}
//*/