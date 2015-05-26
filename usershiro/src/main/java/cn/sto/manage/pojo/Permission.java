package cn.sto.manage.pojo;

public class Permission {

	private Integer id;
	private Integer pid;
	private String name;
	private String type;
	private Integer sort;
	private String url;
	private String permCode;
	private String icon;
	private String state;
	private String description;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPermCode() {
		return permCode;
	}
	public void setPermCode(String permCode) {
		this.permCode = permCode;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Permission() {
	}
	public Permission(Integer id, Integer pid, String name, String type,
			Integer sort, String url, String permCode, String icon,
			String state, String description) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.type = type;
		this.sort = sort;
		this.url = url;
		this.permCode = permCode;
		this.icon = icon;
		this.state = state;
		this.description = description;
	}
}
