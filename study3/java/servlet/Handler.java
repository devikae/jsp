package com.study.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

public interface Handler {
public String process(HttpServletRequest req, HttpServletResponse resp)throws Exception ;

}