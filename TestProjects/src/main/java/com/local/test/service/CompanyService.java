package com.local.test.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.local.test.domain.CompanyVo;
import com.local.test.mapper.CompanyMapper;

@Service("companyService")
public class CompanyService {
	
	@Resource(name="companyMapper")
	//@Resource("companyDao")
	private CompanyMapper mapper;
	//private CompanyMapper dao;
	
	public List<CompanyVo> getCompanyList() {
		return mapper.getCompanyList();
	}
	
}