package bdd.model;

import java.util.List;

public class Publication {
    private String url;
    private String title;
    private String date;
    private String description;
    private Stream stream;
    private List<Comment> comments;
    private boolean red;

    public Stream getStream() {
	return stream;
    }

    public void setStream(Stream stream) {
	this.stream = stream;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    public String getTitle() {
	return title;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public String getDate() {
	return date;
    }

    public void setDate(String date) {
	this.date = date;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public void setRed(boolean red) {
	this.red = red;
    }

    public boolean isRed() {
	return red;
    }
}
