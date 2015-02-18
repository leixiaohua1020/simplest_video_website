package bean;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Videostate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "videostate", catalog = "svw")
public class Videostate implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer order;
	private String cssstyle;
	private String remark;
	private Set<Video> videos = new HashSet<Video>(0);

	// Constructors

	/** default constructor */
	public Videostate() {
	}

	/** minimal constructor */
	public Videostate(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Videostate(Integer id, String name, Integer order, String cssstyle,
			String remark, Set<Video> videos) {
		this.id = id;
		this.name = name;
		this.order = order;
		this.cssstyle = cssstyle;
		this.remark = remark;
		this.videos = videos;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "order")
	public Integer getOrder() {
		return this.order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	@Column(name = "cssstyle")
	public String getCssstyle() {
		return this.cssstyle;
	}

	public void setCssstyle(String cssstyle) {
		this.cssstyle = cssstyle;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "videostate")
	public Set<Video> getVideos() {
		return this.videos;
	}

	public void setVideos(Set<Video> videos) {
		this.videos = videos;
	}

}