package mes.service.ts;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.ts.VoiceOfCustomerVo;
import mes.persistence.ts.VoiceOfCustomerDAO;

@Service
public class VoiceOfCustomerServiceImpl implements VoiceOfCustomerService{
	
	@Inject
	private VoiceOfCustomerDAO dao;
	
	@Override
	public List<VoiceOfCustomerVo> voiceOfCustomerAdmLst(VoiceOfCustomerVo vocVo) throws Exception{
		return dao.voiceOfCustomerAdmLst(vocVo);
	}
	
	@Override
	public List<VoiceOfCustomerVo> voiceOfCustomerDtlLst(VoiceOfCustomerVo vocVo) throws Exception{
		return dao.voiceOfCustomerDtlLst(vocVo);
	}
	
	@Override
	public String getAsNo() throws Exception {
		return dao.getAsNo();
	}
	
	@Override
	public void vocAdmIns(VoiceOfCustomerVo vocVo) throws Exception{
		dao.vocAdmIns(vocVo);
	}
	
	@Override
	public void vocAdmUpd(VoiceOfCustomerVo vocVo) throws Exception{
		dao.vocAdmUpd(vocVo);
	}
	
	@Override
	public void vocAdmDel(VoiceOfCustomerVo vocVo) throws Exception{
		dao.vocAdmDel(vocVo);
	}
	
	@Override
	public void vocDtlIns(VoiceOfCustomerVo vocVo) throws Exception{
		dao.vocDtlIns(vocVo);
	}
	
	@Override
	public void vocDtlUpd(VoiceOfCustomerVo vocVo) throws Exception{
		dao.vocDtlUpd(vocVo);
	}
	
	@Override
	public void vocDtlDel(VoiceOfCustomerVo vocVo) throws Exception{
		dao.vocDtlDel(vocVo);
	}
}
