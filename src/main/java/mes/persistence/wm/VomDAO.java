package mes.persistence.wm;

import java.util.List;

import mes.domain.wm.VomVo;

public interface VomDAO {
	public List<VomVo> vomList(VomVo vomVo) throws Exception;
	
	public void vomIns(VomVo vomVo) throws Exception;
	
	public void vomUpd(VomVo vomVo) throws Exception;
	
	public void vomDel(VomVo vomVo) throws Exception;
	
	
	public List<VomVo> vomFileList(VomVo vomVo) throws Exception;
	
	public void vomFileIns(VomVo vomVo) throws Exception;
	
	public void vomFileUpd(VomVo vomVo) throws Exception;
	
	public void vomFileDel(VomVo vomVo) throws Exception;
	
	public VomVo vomImgFileSel(VomVo vomVo) throws Exception;
	
	public void vomImgFileIns(VomVo vomVo) throws Exception;
	
	public void vomImgFileUpd(VomVo vomVo) throws Exception;
}
