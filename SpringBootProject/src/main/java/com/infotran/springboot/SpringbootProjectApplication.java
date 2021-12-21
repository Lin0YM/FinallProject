package com.infotran.springboot;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.servlet.Filter;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class SpringbootProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootProjectApplication.class, args);
	}
	
	@Bean 
	FilterRegistrationBean<Filter>  hiddenHttpMethodFilter(){
		FilterRegistrationBean<Filter>  filterBean = new FilterRegistrationBean<>();
		filterBean.setFilter(new HiddenHttpMethodFilter());
		return filterBean;
	}
	
//	@Autowired 
//	private DataSource dataSource;
//	
//	@Bean
//	public LocalSessionFactoryBean sessionFactory() {
//		
//		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
//		factory.setDataSource(dataSource);
//		factory.setPackagesToScan(new String[]{"com.infotran.springboot"});
//		return factory;
//	}
	
	@PersistenceContext
	private EntityManager emf;
	
	@Bean
	public Session session(EntityManager emf) {
	    return emf.unwrap(Session.class);
	}
	
}
