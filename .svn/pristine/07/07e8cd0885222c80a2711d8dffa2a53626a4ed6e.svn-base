package com.lnmj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.lnmj.backManage.**", /*"com.lnmj.auth.**",*/"com.lnmj.common.**"})
@EnableFeignClients(basePackages = {"com.lnmj.backManage.serviceProxy", "com.lnmj.auth"})
@EnableAuthorizationServer
@EnableTransactionManagement
@EnableScheduling
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class BackManageApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(BackManageApplication.class, args);
    }

    @Override//为了打包springboot项目
    protected SpringApplicationBuilder configure(
            SpringApplicationBuilder builder) {
        return builder.sources(this.getClass());
    }
}
