from domain.dao.fund_dao import FundDAO
from domain.dao.fund_manager_dao import FundManagerDAO
from domain.dao.fund_company_dao import FundCompanyDAO
from domain.dao.fund_nav_dao import FundNAVDAO
from domain.dao.fund_extra_info_dao import FundExtraInfoDAO
from domain.dao.fund_invest_dao import FundInvestDAO
from domain.dao.fund_charge_dao import FundChargeDAO
from domain.dao.fund_roi_dao import FundROIDAO

fund_dao = FundDAO()
fund_manager_dao = FundManagerDAO()
fund_company_dao = FundCompanyDAO()
fund_nav_dao = FundNAVDAO()
fund_extra_info_dao = FundExtraInfoDAO()
fund_invest_dao = FundInvestDAO()
fund_charge_dao = FundChargeDAO()
fund_roi_dao = FundROIDAO()
