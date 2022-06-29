package com.study.attach.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.attach.dao.IAttachDao;
import com.study.attach.vo.AttachVO;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;

@Service
public class AttachServiceImpl implements IAttachService{

	@Inject
	IAttachDao attachDao;
	
	@Override
	public AttachVO getAttach(int atchNo) throws BizException {
		AttachVO atch = attachDao.getAttach(atchNo);
		if(atch == null) {
			throw new BizNotFoundException();
		}
				
		return atch;
	}

	@Override
	public void increaseDownHit(int atchNo) throws BizException {
		int cnt = attachDao.increaseDownHit(atchNo);
		if(cnt == 0) {
			throw new BizNotEffectedException();
		}
		
	}

}
