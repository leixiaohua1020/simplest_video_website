package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Configure entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "configure", catalog = "svw")
public class Configure implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String val;
	private String remark;

	// Constructors

	/** default constructor */
	public Configure() {
	}

	/** full constructor */
	public Configure(String name, String val, String remark) {
		this.name = name;
		this.val = val;
		this.remark = remark;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
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

	@Column(name = "val")
	public String getVal() {
		return this.val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}