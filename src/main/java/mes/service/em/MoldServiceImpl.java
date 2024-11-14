package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.MoldVo;
import mes.persistence.em.MoldDAO;
@Service
public class MoldServiceImpl implements MoldService {

	@Inject
	private MoldDAO dao;
	
	// 금형관리 목록조회
	@Override
	public List<MoldVo> moldList(MoldVo moldVo) throws Exception {
		return dao.moldList(moldVo);
	}
	
	// 금형관리 등록
	@Override
	public String moldIns(MoldVo moldVo) throws Exception {
		return dao.moldIns(moldVo);
	}
	
	// 금형관리 수정
	@Override
	public void moldUpd(MoldVo moldVo) throws Exception {
		dao.moldUpd(moldVo);
	}
	
	// 금형관리 삭제
	@Override
	public void moldDel(MoldVo moldVo) throws Exception {
		dao.moldDel(moldVo);
	}
	
	// 금형관리 프로젝트 목록조회
	@Override
	public List<MoldVo> moldProjectList(MoldVo moldVo) throws Exception {
		return dao.moldProjectList(moldVo);
	}
	
	// 금형관리 파일 목록조회
	@Override
	public List<MoldVo> moldFileList(MoldVo moldVo) throws Exception {
		return dao.moldFileList(moldVo);
	}
	
	// 금형관리 파일 등록
	@Override
	public void moldFileIns(MoldVo moldVo) throws Exception {
		dao.moldFileIns(moldVo);
	}
	
	// 금형관리 파일 삭제
	public void moldFileDel(MoldVo moldVo) throws Exception {
		dao.moldFileDel(moldVo);
	}
}

	