package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.VomVo;

@Repository
public class VomDAOImpl implements VomDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.vomMapper";
	
	@Override
	public List<VomVo> vomList(VomVo vomVo) throws Exception{
		return session.selectList(namespace + ".vomList", vomVo);
	}
	
	@Override
	public void vomIns(VomVo vomVo) throws Exception{
		session.insert(namespace + ".vomIns", vomVo);
	}
	
	@Override
	public void vomUpd(VomVo vomVo) throws Exception{
		session.update(namespace + ".vomUpd", vomVo);
	}
	
	@Override
	public void vomDel(VomVo vomVo) throws Exception{
		session.delete(namespace + ".vomDel", vomVo);
	}
	
	
	@Override
	public List<VomVo> vomFileList(VomVo vomVo) throws Exception{
		return session.selectList(namespace + ".vomFileList", vomVo);
	}
	
	@Override
	public void vomFileIns(VomVo vomVo) throws Exception{
		session.insert(namespace + ".vomFileIns", vomVo);
	}
	
	@Override
	public void vomFileUpd(VomVo vomVo) throws Exception{
		session.update(namespace + ".vomFileUpd", vomVo);
	}
	
	@Override
	public void vomFileDel(VomVo vomVo) throws Exception{
		session.delete(namespace + ".vomFileDel", vomVo);
	}
	
	@Override
	public VomVo vomImgFileSel(VomVo vomVo) throws Exception{
		return session.selectOne(namespace + ".vomImgFileSel", vomVo);
	}
	
	@Override
	public void vomImgFileIns(VomVo vomVo) throws Exception{
		session.insert(namespace + ".vomImgFileIns", vomVo);
	}
	
	@Override
	public void vomImgFileUpd(VomVo vomVo) throws Exception{
		session.update(namespace + ".vomImgFileUpd", vomVo);
	}


}
