<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.main.utils.CommonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.demo.main.vo.BorrowingVo" %>
<%@ page import="com.demo.main.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Users Management Page</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/public.css">
    <style>
        .query-box {
            margin-bottom: 30px;

        }
    </style>
</head>
<body>
<%
    // public
    String username = (String) request.getSession().getAttribute("username");
    String identity = CommonUtil.getIdentity();
    List<String[]> permissions = (List<String[]>) request.getAttribute("permissions");
    // private
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container-fluid">
    <div class="top-nav">
        <div class="top-nav-container">
            <div class="left-box">
                <p>图书管理系统</p>
            </div>
            <div class="right-box">
                <p class="top-nav-username" style="margin-right: 10px">用户：<%=username%>
                </p>
                <p class="top-nav-identity">类型：<%=identity.equals("user") ? "用户" : "管理员"%>
                </p>
            </div>
        </div>
    </div>
    <div class="non-top-nav">
        <div class="sidebar">
            <ul class="sidebar-ul">
                <c:forEach var="item" items="<%=permissions%>">
                    <li><a href="${item[1]}">${item[0]}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="main">
            <div class="main-container">
                <div class="query-box">
                    <form action="/user" class="query-form clearfix">
                        <div class="form-group row" style="margin: 0">
                            <input type="hidden" name="method" value="condition">
                            <input type="text" name="username" class="form-control col-3" placeholder="用户名"/>
                            <input type="submit" value="查询" class="btn btn-primary col-1 offset-1">
                        </div>
                    </form>
                </div>
                <div class="table-box">
                    <table class="table table-striped table-bordered table-hover" style="margin: 0 auto">
                        <thead>
                        <tr>
                            <td>用户ID</td>
                            <td>用户名</td>
                            <td>手机号</td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="<%=users%>">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.username}</td>
                                <td>${user.phone}</td>
                                <td style="width: 149px">
                                    <a href="/user?method=delete&id=${user.id}">
                                        <button class="btn btn-danger btn-sm">删除</button>
                                    </a>
                                    <a href="/router?page=admin_user_update&id=${user.id}">
                                        <button class="btn btn-primary btn-sm">修改</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
