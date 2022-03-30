package myBean;

import java.util.ArrayList;

public class DataContainer {
	private int idx;
	private String videolink;
	private String thumbnaillink;
	private String author;
	private String title;
	private String time;
	private String detail;
	public String getVideolink() {
		return videolink;
	}
	public void setVideolink(String videolink) {
		this.videolink = videolink;
				
	}
	public String getThumbnaillink() {
		return thumbnaillink;
	}
	public void setThumbnaillink(String thumbnaillink) {
		this.thumbnaillink = thumbnaillink;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
}
