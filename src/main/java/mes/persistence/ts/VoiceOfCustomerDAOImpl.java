package mes.persistence.ts;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.ts.VoiceOfCustomerVo;

@Repository
public class VoiceOfCustomerDAOImpl implements VoiceOfCustomerDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.ts.voiceOfCustomerMapper";
	
	@Override
	public List<VoiceOfCustomerVo> voiceOfCustomerAdmLst(VoiceOfCustomerVo vocVo) throws Exception{
		return session.selectList(namespace + ".voiceOfCustomerAdmLst", vocVo);
	}
	
	@Override
	public List<VoiceOfCustomerVo> voiceOfCustomerDtlLst(VoiceOfCustomerVo vocVo) throws Exception{
		return session.selectList(namespace + ".voiceOfCustomerDtlLst", vocVo);
	}
	
	
	@Override
	public String getAsNo() throws Exception {
		return session.selectOne(namespace+".getAsNo");
	}
	
	@Override
	public void vocAdmIns(VoiceOfCustomerVo vocVo) throws Exception{
		session.insert(namespace + ".vocAdmIns", vocVo);
	}
	
	@Override
	public void vocAdmUpd(VoiceOfCustomerVo vocVo) throws Exception{
		session.update(namespace + ".vocAdmUpd", vocVo);
	}
	
	@Override
	public void vocAdmDel(VoiceOfCustomerVo vocVo) throws Exception{
		session.delete(namespace + ".vocAdmDel", vocVo);
	}
	
	@Override
	public void vocDtlIns(VoiceOfCustomerVo vocVo) throws Exception{
		session.insert(namespace + ".vocDtlIns", vocVo);
	}
	
	@Override
	public void vocDtlUpd(VoiceOfCustomerVo vocVo) throws Exception{
		session.update(namespace + ".vocDtlUpd", vocVo);
	}
	
	@Override
	public void vocDtlDel(VoiceOfCustomerVo vocVo) throws Exception{
		session.delete(namespace + ".vocDtlDel", vocVo);
	}

}