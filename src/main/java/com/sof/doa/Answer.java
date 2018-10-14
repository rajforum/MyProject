package com.sof.doa;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "answer")
public class Answer implements Serializable {
	private Integer answerId;
	private Integer queryId;
	private Integer userId;
	private String bodyText;
	private Integer vote;
	
	public Answer() {}
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ANSWERID")
	public Integer getAnswerId() {
		return answerId;
	}



	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}



	@Column(name = "QUERYID")
	public Integer getQueryId() {
		return queryId;
	}

	public void setQueryId(Integer queryId) {
		this.queryId = queryId;
	}
	
	@Column(name = "USERID")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	@Column(name = "BODYTEXT")
	public String getBodyText() {
		return bodyText;
	}

	public void setBodyText(String bodyText) {
		this.bodyText = bodyText;
	}
	
	@Column(name = "VOTE")
	public Integer getVote() {
		return vote;
	}

	public void setVote(Integer vote) {
		this.vote = vote;
	}
	
	
}
