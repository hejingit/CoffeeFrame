package com.coffee.modules.coffeebean.service;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.coffee.api.intf.DemoService;

public class Test {

    public static void main(String[] args) {
//        String request = "{'addClassPro':[{'classNo':'0010','name':'学历考试类','serialNo':'sd','status':'1'},{'classNo':'0020','name':'会计财经类','serialNo':'sd','status':'1'}],'opraterType':'2'}";
//        JSONObject jsonObject = JSONObject.parseObject(request);
//        JSONArray jsonArray = JSONObject.parseArray(jsonObject.getString("addClassPro"));
//        for(int i =0;i< jsonArray.size();i++){
//            JSONObject obj = (JSONObject) jsonArray.get(i);
//            System.out.println(obj.getString("name"));
//        }
        /*Map<String,Object> requestMap = JSONObject.parseObject(request, Map.class);
        JSONArray array = JSONArray.*/
    	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
                new String[]{"spring-dubbo.xml"});
        context.start();
        // obtain proxy object for remote invocation
        DemoService demoService = (DemoService) context.getBean("demoService");
        // execute remote invocation
        String hello = demoService.sayHello("world");
    }
}
