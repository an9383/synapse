package mes.web.tm;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.stock.StockPaymentAdmVo;
import mes.domain.stock.StockSummaryAdmVo;
import mes.domain.tm.InventoryMoveVo;
import mes.service.stock.StockPaymentAdmService;
import mes.service.stock.StockSummaryAdmService;
import mes.service.tm.InventoryMoveService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class InventoryMoveController {
	
	@Inject
	private InventoryMoveService inventoryMoveService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	@Inject
	private StockSummaryAdmService stockSummaryAdmService;

	
	private static final Logger logger = LoggerFactory.getLogger(InventoryMoveController.class);
	
	// wmsc0100
	@RequestMapping(value = "/tm/tmsc0080", method = RequestMethod.GET)
	public ModelAndView wmsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /tm/tmsc0080");
		mav.setViewName("/tm/tmsc0080");
		return mav;
	}
	
	//재고이동 목록조회
	@RequestMapping(value = "tm/inventoryMoveAdmLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inventoryMoveAdmLst(InventoryMoveVo inventoryMoveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("재고이동 내역 조회 : " + inventoryMoveVo);
		try {
			List<InventoryMoveVo> inventoryMoveList = inventoryMoveService.InventoryMoveAdmLst(inventoryMoveVo);
			jsonData.put("data", inventoryMoveList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//재고이동 등록
	@RequestMapping(value = "tm/inventoryMoveAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inventoryMoveAdmIns(InventoryMoveVo inventoryMoveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			StockSummaryAdmVo stockSummaryAdmVo = new StockSummaryAdmVo();
			

			
			String spNo = stockPaymentAdmService.stockPaymentAdmGetSpNo(stockPaymentAdmVo);
			inventoryMoveVo.setSpNo(spNo);
			inventoryMoveVo.setSpSeq("1");
			for(int i = 1; i<=2; i++) {
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(Integer.toString(i));
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpType("이동");
				stockPaymentAdmVo.setSpIdx(inventoryMoveVo.getItemCd());
				if(i==1) {
					stockPaymentAdmVo.setSpType2("이동출고");
					stockPaymentAdmVo.setSpQty("-"+inventoryMoveVo.getMoveQty());
					stockPaymentAdmVo.setSpWhsIdx(inventoryMoveVo.getBeforeWarehouse());
				} else {
					stockPaymentAdmVo.setSpType2("이동입고");
					stockPaymentAdmVo.setSpQty(inventoryMoveVo.getMoveQty());
					stockPaymentAdmVo.setSpWhsIdx(inventoryMoveVo.getAfterWarehouse());
				}
				stockPaymentAdmVo.setSpDate(inventoryMoveVo.getMoveDate());
				stockPaymentAdmVo.setSpLotNo(inventoryMoveVo.getLotNo());
				stockPaymentAdmVo.setSpSourceNo(spNo+"-0000"+i);
				stockPaymentAdmVo.setSpWhsGubun("001");
				stockPaymentAdmVo.setSpLocIdx("0");
				stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
				stockPaymentAdmVo.setRegDate(DateUtil.getCurrentDateTime());
				
				stockPaymentAdmService.stockPaymentAdmIns2(stockPaymentAdmVo);
				
				stockSummaryAdmVo.setSsItemIdx(inventoryMoveVo.getItemCd());
				stockSummaryAdmVo.setSsWhsGubun("001");
				stockSummaryAdmVo.setRegIdx(Utils.getUserIdx());
				stockSummaryAdmVo.setSsLocIdx("0");
				if(i==1) {
					stockSummaryAdmVo.setSsWhsIdx(inventoryMoveVo.getBeforeWarehouse());
					stockSummaryAdmVo.setSsQty("-"+inventoryMoveVo.getMoveQty());
				} else {
					stockSummaryAdmVo.setSsWhsIdx(inventoryMoveVo.getAfterWarehouse());
					stockSummaryAdmVo.setSsQty(inventoryMoveVo.getMoveQty());
				}
				
				stockSummaryAdmService.stockSummaryAdmIns(stockSummaryAdmVo);
			}
			inventoryMoveVo.setRegIdx(Utils.getUserIdx());
			inventoryMoveVo.setRegDate(DateUtil.getCurrentDateTime());
			inventoryMoveService.InventoryMoveAdmIns(inventoryMoveVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//재고이동 수정
	@RequestMapping(value = "tm/inventoryMoveAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inventoryMoveAdmUpd(InventoryMoveVo inventoryMoveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			StockSummaryAdmVo stockSummaryAdmVo = new StockSummaryAdmVo();

			String spNo = inventoryMoveVo.getSpNo();
			for(int i = 1; i<=2; i++) {
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(Integer.toString(i));
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpType("이동");
				stockPaymentAdmVo.setSpIdx(inventoryMoveVo.getItemCd());
				if(i==1) {
					stockPaymentAdmVo.setSpType2("이동출고");
					stockPaymentAdmVo.setSpQty("-"+inventoryMoveVo.getMoveQty());
					stockPaymentAdmVo.setSpWhsIdx(inventoryMoveVo.getBeforeWarehouse());
				} else {
					stockPaymentAdmVo.setSpType2("이동입고");
					stockPaymentAdmVo.setSpQty(inventoryMoveVo.getMoveQty());
					stockPaymentAdmVo.setSpWhsIdx(inventoryMoveVo.getAfterWarehouse());
				}
				stockPaymentAdmVo.setSpDate(inventoryMoveVo.getMoveDate());
				stockPaymentAdmVo.setSpLotNo(inventoryMoveVo.getLotNo());
				stockPaymentAdmVo.setSpSourceNo(spNo+"-0000"+i);
				stockPaymentAdmVo.setSpWhsGubun("001");
				stockPaymentAdmVo.setSpLocIdx("0");
				stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
				stockPaymentAdmVo.setRegDate(DateUtil.getCurrentDateTime());
				
				stockPaymentAdmService.stockPaymentAdmDel2(stockPaymentAdmVo);
				stockPaymentAdmService.stockPaymentAdmIns2(stockPaymentAdmVo);
				
				stockSummaryAdmVo.setSsItemIdx(inventoryMoveVo.getItemCd());
				stockSummaryAdmVo.setSsWhsGubun("001");
				stockSummaryAdmVo.setRegIdx(Utils.getUserIdx());
				stockSummaryAdmVo.setSsLocIdx("0");
				if(i==1) {
					stockSummaryAdmVo.setSsWhsIdx(inventoryMoveVo.getBeforeWarehouse());
					stockSummaryAdmVo.setSsQty("-"+inventoryMoveVo.getMoveQty());
				} else {
					stockSummaryAdmVo.setSsWhsIdx(inventoryMoveVo.getAfterWarehouse());
					stockSummaryAdmVo.setSsQty(inventoryMoveVo.getMoveQty());
				}
				
				stockSummaryAdmService.stockSummaryAdmIns(stockSummaryAdmVo);

			}
			inventoryMoveVo.setUpdIdx(Utils.getUserIdx());
			inventoryMoveVo.setUpdDate(DateUtil.getCurrentDateTime());
			inventoryMoveService.InventoryMoveAdmUpd(inventoryMoveVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	//재고이동 삭제
	@RequestMapping(value = "tm/inventoryMoveAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inventoryMoveAdmDel(InventoryMoveVo inventoryMoveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inventoryMoveService.InventoryMoveAdmDel(inventoryMoveVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}
