package bean;

public class DocBean {
	private String href; 
	private String text;
	private int campaignId; 
	/**
	 * @return the campaignId
	 */
	public int getCampaignId() {
		return campaignId;
	}
	/**
	 * @param campaignId the campaignId to set
	 */
	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}
	/**
	 * @return the href
	 */
	public String getHref() {
		return href;
	}
	/**
	 * @param href the href to set
	 */
	public void setHref(String href) {
		this.href = href;
	}
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	} 
}
