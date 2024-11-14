package mes.persistence.em;

import java.util.List;

import mes.domain.em.MoldVo;

public interface MoldDAO {

	// 금형관리 목록조회
	public List<MoldVo> moldList(MoldVo moldVo) throws Exception;
	
	// 금형관리 등록
	public String moldIns(MoldVo moldVo) throws Exception;
	
	// 금형관리 수정
	public void moldUpd(MoldVo moldVo) throws Exception;
	
	// 금형관리 삭제
	public void moldDel(MoldVo moldVo) throws Exception;
	
	// 금형관리 프로젝트 목록조회
	public List<MoldVo> moldProjectList(MoldVo moldVo) throws Exception;
	
	// 금형관리 파일 목록조회
	public List<MoldVo> moldFileList(MoldVo moldVo) throws Exception;
	
	// 금형관리 파일 등록
	public void moldFileIns(MoldVo moldVo) throws Exception;
	
	// 금형관리 파일 삭제
	public void moldFileDel(MoldVo moldVo) throws Exception;
}
