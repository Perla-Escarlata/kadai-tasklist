<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<label for="title">クエストタイトル</label><br/>
<input type="text" name="title" value="${task.title}"/>
<br/><br/>

<label for="content">クエスト詳細</label><br/>
<input type="text" name="content" value="${task.content}"/>
<br/><br/>

<input type="hidden" name="_token" value="${_token}"/>
<button type="submit">登録</button>