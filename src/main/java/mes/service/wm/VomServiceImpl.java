package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.VomVo;
import mes.persistence.wm.VomDAO;

@Service
public class VomServiceImpl implements VomService{
	
	@Inject
	private VomDAO dao;
	
	@Override
	public List<VomVo> vomList(VomVo vomVo) throws Exception{
		return dao.vomList(vomVo);
	}
	
	@Override
	public void vomIns(VomVo vomVo) throws Exception{
		dao.vomIns(vomVo);
	}
	
	@Override
	public void vomUpd(VomVo vomVo) throws Exception{
		dao.vomUpd(vomVo);
	}
	
	@Override
	public void vomDel(VomVo vomVo) throws Exception{
		dao.vomDel(vomVo);
	}
	
	
	@Override
	public List<VomVo> vomFileList(VomVo vomVo) throws Exception{
		return dao.vomFileList(vomVo);
	}
	
	@Override
	public void vomFileIns(VomVo vomVo) throws Exception{
		dao.vomFileIns(vomVo);
	}
	
	@Override
	public void vomFileUpd(VomVo vomVo) throws Exception{
		dao.vomFileUpd(vomVo);
	}
	
	@Override
	public void vomFileDel(VomVo vomVo) throws Exception{
		dao.vomFileDel(vomVo);
	}
	
	@Override
	public VomVo vomImgFileSel(VomVo vomVo) throws Exception{
		return dao.vomImgFileSel(vomVo);
	}
	
	@Override
	public void vomImgFileIns(VomVo vomVo) throws Exception{
		dao.vomImgFileIns(vomVo);
	}
	
	@Override
	public void vomImgFileUpd(VomVo vomVo) throws Exception{
		dao.vomImgFileUpd(vomVo);
	}
}
