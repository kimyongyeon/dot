<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/directive.jsp" %>
<tiles:insertDefinition name="header.layout">

    <tiles:putAttribute name="content">
        <!-- main-container -->
        <section>
            <p class="activityA">
                <img src="resources/images/activity_img.jpg" title="주활동지역 상단 이미지"/>
            </p>

            <div class="container mb100">
                <h1>
                    주 활동지역
                    <span class="date" id="baseDt"></span>
                </h1>
                <!---지역별 모수 현황-->
                <h2>지역별 모수 현황</h2>

                <div class="detailLy2">
                    <p class="btSpace">
                        <button class="view" type="button" data-toggle="modal" data-target="#myModal">지역별 모수 현황 리스트
                        </button>
                    </p>
                    <p class="txt">[지역별 모수 현황 리스트]를 클릭 하시면 자세한 내용을 볼 수 있습니다.</p>
                    <!-- 지도 영역-->
                    <div class="layoutLR ">
                        <li class="LF">
                            <div class="round_chartArea">
                                <!--Button Korea Map-->
                                <p class="koreaBtn ">
                                    <button type="button" id="clickKoreaMap">Korea Map</button>
                                </p>
                                <p>

                                <div id="koreaMap" style="height: 600px"></div>
                                </p>
                            </div>
                        </li>
                        <!-- 막대 챠트 영역-->
                        <li class="RG">
                            <div class="round_chartArea">
                                <div id="chartContainer"></div>
                            </div>
                        </li>
                    </div>
                </div>
                <!---//지역별 모수 현황-->
                <div id="divSubData" style="display: none;">
                    <!--성연령대별 현황-->
                    <h2>성연령대별 현황</h2>

                    <div class="chartLy">
                        <ul class="chartLy_1p ">
                            <li>
                                <p class="chartTitle ">
                                    <i class="fa fa-bar-chart"></i>성연령대 현황
                                </p>

                                <div class="chartArea">
                                    <div id="chart3" style="width: 100%; height: 390px"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="chartLy  mt80">
                        <ul class="chartLy_2p ">
                            <li>
                                <p class="chartTitle ">
                                    <i class="fa fa-bar-chart"></i>성별/연령대별 현황
                                    <span id="chart2ParentTitle"></span>
                                </p>

                                <div class="chartArea">
                                    <div id="chart1" style="width: 100%; height: 390px"></div>
                                </div>
                            </li>
                            <li>
                                <p class="chartTitle ">
                                    <i class="fa fa-bar-chart"></i>성별/연령대별 현황
                                    <span id="chart2SubTitle"></span>
                                </p>

                                <div class="chartArea">
                                    <div id="chart2" style="width: 100%; height: 390px"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--//성연령대별 현황-->
                    <div class="layoutLR">
                        <!--업종 순위-->
                        <div class="floatL mt80" style="width: 33% !important">
                            <div class="rankingLy">
                                <p class="icon"></p>

                                <div class="inBox">
                                    <h3>업종 순위 (소분류)</h3>
                                    <ul id="rankGrid"></ul>
                                </div>
                            </div>
                        </div>
                        <!--//업종 순위-->
                        <!--함께 방문하는 지역 -->
                        <div class="floatR mt80 regionLy" style="width: 65% !important">
                            <p class="tit">함께 방문하는 지역</p>

                            <p class="btnSp">
                                <button class="button" type="button" data-toggle="modal" data-target="#myModa2">확대보기
                                </button>
                            </p>
                            <div class="inBox">
                                <div id="chart4" style="width:100%; height: 390px;"></div>
                            </div>
                        </div>
                        <!--//함께 방문하는 지역 -->
                    </div>
                </div>
            </div>
        </section>
        <!--// main-container-->

        <!-- Modal 지역별 모수 현황  GRID -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modalWd">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 id="myModalLabel">지역별 모수 현황</h3>
                        <!--현황지역 설명 박스-->
                        <div class="dongBox2 mb10">
                            <li class="box ">
                                <!--현황 지역-->
                                <ul>
                                    <li class="LF">현황 지역</li>
                                    <li class="RG fontBlue " id="areaDong">역삼동</li>
                                </ul>
                            </li>
                            <li class="box">
                                <!--모수-->
                                <ul>
                                    <li class="LF">모수</li>
                                    <li class="RG fontGreen " id="areaMosu">2,117,088</li>
                                </ul>
                            </li>
                            <li class="box">
                                <!--PUSH 동의-->
                                <ul>
                                    <li class="LF">PUSH 동의</li>
                                    <li class="RG fontYellow " id="areaPush">725,423</li>
                                </ul>
                            </li>
                        </div>
                        <!--//현황지역 설명 박스-->
                    </div>
                    <div class="modal-body ">
                        <table class="listTB tStriped">
                            <colgroup>
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>&nbsp;</th>
                                <th>현황지역</th>
                                <th>모수</th>
                                <th>PUSH 동의</th>
                            </tr>
                            </thead>
                            <tbody id="mosuTable"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--//Modal 지역별 모수 현황-->






<!--Modal 동단위 현황지역 -->
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  id="chartDongDiv">
	<div class="modal-dialog ">
        <div class="modal-content">
			<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                
                <!--현황지역 설명 박스-->
            		<div class="dongBox">
            			<li class="box ">
                        	<!--현황 지역-->
                        	<ul>
                            	<li class="LF">현황 지역</li>
                                <li class="RG fontBlue " id="dongNm">역삼동</li>
                            </ul>
                        </li>
                		<li class="box">
                        	<!--모수-->
                        	<ul>
                            	<li class="LF">모수</li>
                                <li class="RG fontGreen " id="dongMosu">2,117,088</li>
                            </ul>
                        </li>
                		<li class="box">
                        	<!--PUSH 동의-->
                        	<ul>
                            	<li class="LF">PUSH 동의</li>
                                <li class="RG fontYellow " id="dongPush">725,423</li>
                            </ul>
                        </li>
            		</div>
            		<!--//현황지역 설명 박스-->

			</div>
            <div class="modal-body">
            	<!--성연령대별 현황-->
                <div class="chartLy mt10">
                	<ul class="chartLy_3p ">
                    	<li>
                    		<p class="chartTitle "><i class="fa fa-bar-chart"></i>성별 현황</p>
                        	<div class="chartArea2" id="chartDong1" style="width: 100%; height: 230px">챠트 영역</div>
                    	</li>
                        <li>
                    		<p class="chartTitle "><i class="fa fa-bar-chart"></i>성별/연령대별 현황<span id="chartDong2SubTitle"></span></p>
                        	<div class="chartArea2" id="chartDong2" style="width: 100%; height: 230px">챠트 영역</div>
                    	</li>
                        <li>
                    		<p class="chartTitle "><i class="fa fa-bar-chart"></i>성별/연령대별 현황<span id="chartDong3SubTitle"></span></p>
                        	<div class="chartArea2" id="chartDong3" style="width: 100%; height: 230px">챠트 영역</div>
                    	</li>
                    </ul>
                </div>
				<!--//성연령대별 현황-->
                
                <div class="layoutLR mt10">
                	<!--업종 순위-->
                	<div class="floatL" style="width:33% !important">
                    	<div class="rankingLy">
                        	<p class="icon"></p>
                            <div class="inBox">
                            	<h3>업종 순위 (소분류)</h3>
                                <ul id="dongRankGrid"></ul>
							</div>
                    	</div>
                     </div>
                     <!--//업종 순위-->
                     
                     <!--함께 방문하는 지역 -->
                     <div class="floatR regionLy" style="width:65% !important">
                     	<p class="tit">함께 방문하는 지역</p>
                        <div class="inBox">
                        	챠트 영역
                            <div id="chart5" style="width:100%; height: 390px;"></div>
                        </div>
                     </div>
                     <!--//함께 방문하는 지역 -->
                </div>

			</div>
        </div>
    </div>
</div>
<!--//Modal 현황지역-->







<!-- Modal 함께 방문하는 지역  네트웍차트 -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog ">

        <div class="modal-content" style="width:100% !important;">
			<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h3 id="myModalLabel">함께 방문하는 지역</h3>
			</div>

            <div class="modal-body">
            
				<!--Search-->
                <div class="searchConts mb10" style="min-width:auto !important">
                	<table style="margin-top:-5px;">
                    	<colgroup>
                            <col width="50px">
                            <col width="220px">
                             <col width="50px">
                            <col width="220px">
                             <col width="50px">
                            <col width="*">
                        </colgroup>
    					<tbody>
        					<tr>
        					    <th>시</th>
        					    <td>
                                	<select  name="size" id="sel_si" title="시선택" style="width:160px">
                                        <option value="00">전체</option>
                                        <option value="11">서울특별시</option>
                                        <option value="26">부산광역시</option>
                                        <option value="27">대구광역시</option>
                                        <option value="28">인천광역시</option>
                                        <option value="29">광주광역시</option>
                                        <option value="30">대전광역시</option>
                                        <option value="31">울산광역시</option>
                                        <option value="36">세종특별자치시</option>
                                        <option value="41">경기도</option>
                                        <option value="42">강원도</option>
                                        <option value="43">충청북도</option>
                                        <option value="44">충청남도</option>
                                        <option value="45">전라북도</option>
                                        <option value="46">전라남도</option>
                                        <option value="47">경상북도</option>
                                        <option value="48">경상남도</option>
                                        <option value="50">제주특별자치도</option>
							    	</select>
                                  </td>
                                     <th>구</th>
        					    <td>
                                    <select  style="width:150px"  name="size" id="sel_gu" disabled="disabled" title="구선택">
                                 		<option value="">구</option>
							    	</select>
                                    </td>
                                     <th>동</th>
        					    <td>
                                    <select style="width:150px" name="size" id="sel_dong" disabled="disabled" title="동선택">
                                 		<option value="">동</option>
							    	</select>
                                </td>
        					</tr>
       					</tbody>
					</table>
                    <!--Btn_search-->
                    <p class="btnSrc_sm_modal"><button  name="btnSearch" id="btnSearch" type="button">검색버튼</button></p>
                     <!--//Btn_search-->
				</div>
                <!--//Search-->
                <div class=" modalChartLy">
                    <p class="chartIcon">챠트 확대 축소<br>아이콘 영역</p>
                    <div id="chart6" style="width:1024px !important; height:500px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Modal 함께 방문하는 지역-->  


    </tiles:putAttribute>
    <tiles:putAttribute name="javascript.footer">
        <%-- <link href="<c:url value="/resources/vis/vis.css"/>" rel="stylesheet">
        <script type="text/javascript" src="<c:url value=" /resources/vis/vis.js "/>"></script> --%>
        <%-- <script type="text/javascript" src="<c:url value=" /resources/echart/echarts.js "/>"></script> --%>
        <script src="<c:url value=" /resources/geo/geo.js "/>"></script>
        <!--modal Tab-->
        <script type="text/javascript" src="<c:url value=" /resources/bootstrap/js/jasny-bootstrap.js "/>"></script>

        <script type="text/javascript">
            $(document).ready(function () {
            	var chartWidth = (($(document).width() - 240)/100*98/3)-40;    // screen.availWidth
                $('#chartDong1').width(chartWidth);    $('#chartDong2').width(chartWidth); $('#chartDong3').width(chartWidth);
                
            	callAjaxMainActivityArea("", "", "getCallBack");

                $("#clickKoreaMap").click(function () {
                    callAjaxMainActivityArea("", "", "getCallBack");
                });
                
            });
            
            function _getNetworkChartOption(dataList) {
                
                var nodeList = [];
                var linkList = [];
                var categoriesList = [];
                var categoryIdx = 0;
                // category[0] : 시,구,동
                // category[1] : 상위지역
                var cityName = $("#chart2ParentTitle").text();
                var subCityName = $("#chart2SubTitle").text();
                categoriesList[0] = {name: '삼성1동'};
                categoriesList[1] = {name: ''};

                for(var i=0; i<dataList.length; i++) {

                    if(dataList[i].mainAdmDong == categoriesList[0].name) {
                        categoryIdx = 0;
                    } else {
                        categoryIdx = 1;
                    }

                    nodeList[i] = {
                        category: categoryIdx,
                        name: dataList[i].mainAdmDong,
                        value: dataList[i].mainMbrCnt,
                        label: dataList[i].mainAdmDong,
                        draggable: (categoryIdx === 0) ? true : false ,
                        itemStyle: {
                            normal: {
                                label: {
                                    position: 'right',
                                    textStyle: {
                                        color: 'black'
                                    }
                                }
                                /*color: 'rgba(252,206,16,1)'*/
                            }
                        }
                    }

                    linkList[i] = {
                        source: dataList[i].mainAdmDong,
                        target: dataList[i].crossAdmDong,
                        weight: 1,
                        name: dataList[i].mainAdmDong,
                        itemStyle: {
                            normal: {
                                width: (Number(dataList[i].confidence) * 10),
                                color: (i % 2 === 0) ? GV_GENDER_COLOR.male(1) : GV_GENDER_COLOR.female(1),
                                type: (i===0) ? 'line' : 'curve'
                            }
                        }
                    }

                }

                var option = {
                        tooltip: {
                            trigger: 'item',
                            formatter: '{b}'
                        },
                        /*legend: {
                            x: 'left',
                            data: [
                                categoriesList[0].name, categoriesList[1].name
                            ]
                        },*/
                        series: [
                            {
                                type: 'force',
                                ribbonType: true,
                                categories: categoriesList,
                                linkSymbol: 'arrow',
                                width: '100%',
                                itemStyle: {
                                    normal: {
                                        label: {
                                            show: true,
                                            textStyle: {
                                                color: '#333'
                                            },
                                            position: 'right'
                                        },
                                        nodeStyle: {
                                            brushType: 'both',
                                            borderColor: 'rgba(255,215,0,0.4)',
                                            borderWidth: 10
                                        },
                                        lineStyle : {
                                            type: 'curve'
                                        }
                                    }
                                },
                                useWorker: true,
                                minRadius: 10, // 노드 최소 크기
                                maxRadius: 25, // 노드 최대 크기
                                gravity: 2,
                                scaling: 2, // 노드 간격
                                roam: 'scale', // scale, move
                                steps: 10,
                                coolDown: 0.9,
                                nodes: nodeList,
                                links: linkList
                            }
                        ]
                    };
                
                return option;
            }
            
            
            
            function getNetworkChart(chartName, dataList) {
                var myChart = echarts.init(document.getElementById(chartName));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getNetworkChartOption(dataList));
            }



            function openDongView(cityName, cityCd){
				callAjaxMainActivityArea(cityName, cityCd, function(data, cityName, cityCd ){
					// 타이틀
					if(data.mosuTableList.length > 0){
						var dongVO = data.mosuTableList[0];
						$("#dongNm").text((GV_PARENT_CITY_NM == "전국" ? "" : GV_PARENT_CITY_NM)+" "+GV_CITY_NM+" "+dongVO.mainAcvtDongNm); // GV_CITY_NM
						$("#dongMosu").text(String(dongVO.mosu).addComma());
						$("#dongPush").text(String(dongVO.push).addComma());
						$("#chartDong2SubTitle").text(GV_CITY_NM);
						$("#chartDong3SubTitle").text(cityName);
					}
					// 업종순위
					var rankTxt = "";
					var rankList = data.rankTableList;
					for(var i=0, len=rankList.length; i<len; i++){
						if(i==0){	rankTxt = rankTxt + ' <li class="wdh100"><span class="high">'+(i+1)+'</span><span class="txtHigh">'+rankList[i].ctgNm+'</span></li>';	}
						else{	rankTxt = rankTxt + ' <li class="wdh100"><span class="low">'+(i+1)+'</span>'+rankList[i].ctgNm+'</li>';	}
					}
					$("#dongRankGrid").empty();	$("#dongRankGrid").html(rankTxt);
					// Chart 
					GV_CITY_NM = cityName;
					getSexAgePieChart('chartDong2', 'chartDong3', data.sexBarList, data.ageBarList);
					getSexAgeBarChart('chartDong1', data.sexAgeBarList);
				});
			}
			
            function callAjaxMainActivityArea(cityName, cityCd, callbackFun) {
                if ((cityName != null && cityName != '') && (cityCd == null || cityCd == 'undefined' || cityCd == '')) {
                    if (chartDataList != null && chartDataList.length != 0) {
                        var selectedData = chartDataList.getDataByKey("mainAcvtDongNm", cityName);
                        if (selectedData != null) {
                            cityCd = selectedData.mainAcvtAdmDongCd;
                        }
                    }
                }
                
                $.ajax({
                    url: "/mainMosuList.do",
                    type: "POST",
                    dataType: "json",
                    data: {
                        "cityName": cityName,
                        "cityCd": cityCd
                    },
                    success: function (data) {
                      
                        // callback
                        if (callbackFun != null && callbackFun != 'undefined' && callbackFun != '') {
                            if ($.isFunction(callbackFun)) {
                                callbackFun(data, cityName, cityCd);
                            } else if (typeof(callbackFun) == "string") {
                                eval(callbackFun + "(data, cityName, cityCd);");
                            }
                        }
                    }
                });
            }

            var chartDataList = [];
            var GV_CITY_CD, GV_CITY_NM, GV_PARENT_CITY_NM;

            function getCallBack(data, cityName, cityCd) {
                GV_CITY_CD = cityCd;
                GV_CITY_NM = cityName;
                $('#chart2SubTitle').text(GV_CITY_NM);
                
                $("#baseDt").text("데이터 기준일 : "+data.baseDt);

                chartDataList = data.mosuTableList;
                getAreaMosuStackChart(data.mosuTableList); // 지역별 모수 현황 차트
                getAreaMosuTable(data.mosuTableList);
                if (cityCd == "" || cityCd == "00") {
                    $('#divSubData').hide();

                } else {
                    $('#divSubData').show();
                    getSexAgePieChart('chart1', 'chart2', data.sexBarList, data.ageBarList);
                    getSexAgeBarChart('chart3', data.sexAgeBarList);
                    getRankTable(data.rankTableList);
                    getTogatherAreaTable(data.TogatherAreaTableList);
                    getNetworkChart("chart4", data.arPocNetworkList);
                    getNetworkChart("chart5", data.arPocNetworkList); // 동 팝업 네트워크 차트
                    getNetworkChart("chart6", data.arPocNetworkList); // 확대/축소 팝업 네트워크 차트
                }

                if (cityName == "") {
                    getGeoMapMaker(); // 지도 호출
                }

            }


            // 지역별 모수 현황
            function getAreaMosuTable(list) {
                var contentTxt = "";
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        if (i == 0) {
                            $("#areaDong").text(list[i].mainAcvtDongNm);
                            $("#areaMosu").text(String(list[i].mosu).addComma());
                            $("#areaPush").text(String(list[i].push).addComma());
                        } else {
                            contentTxt += '      <tr> ';
                            if (list[i].mainAcvtAdmDongCd.length > 5) {
                                contentTxt += '        <td class="txtC"><a href="#" onclick="openDongView(\''+list[i].mainAcvtDongNm+'\', \''+list[i].mainAcvtAdmDongCd+'\'); return false;" data-target="#myModa3" data-toggle="modal" id="inputTest_'+list[i].mainAcvtAdmDongCd+'">' + list[i].mainAcvtDongNm + '<span class="floatR"><i class="fa fa-chevron-right"></i></span></a></td> ';
                            } else {
                                contentTxt += '        <td class="txtC">' + list[i].mainAcvtDongNm + '</td> ';
                            }    
                            contentTxt += '        <td>' + String(list[i].mosu).addComma() + '</td> ';
                            contentTxt += '        <td>' + String(list[i].push).addComma() + '</td> ';
                            contentTxt += '      </tr> ';
                        }
                    }
                } else {
                    contentTxt += '      <tr>  ';
                    contentTxt += '        <td colspan="3" class="noData"><i class="fa fa-file-text-o"></i>데이터가 없습니다.</td>  ';
                    contentTxt += '      </tr>  ';
                }
                $("#mosuTable").empty();
                $("#mosuTable").append(contentTxt);
            }

            // 업종 순위
            function getRankTable(list) {
                var contentTxt = "";
                for (var i = 0; i < list.length; i++) {
                    if (i == 0) {
                        contentTxt += '<li class="wdh100"><span class="high">' + (i + 1) + '</span><span class="txtHigh">' + list[i].ctgNm + '</span></li>';
                    } else {
                        contentTxt += '<li class="wdh100"><span class="low">' + (i + 1) + '</span>' + list[i].ctgNm + '</li>';
                    }
                }
                $("#rankGrid").empty();
                $("#rankGrid").append(contentTxt);
            }

            // 함께 방문하는 지역
            function getTogatherAreaTable(list) {

            }


            /**
             * ##############  지역별 모수 현황 차트 START  ##############
             */
            //
            var areaMosuStackChart;

            function getAreaMosuStackChart(dataList) {
                var dataSize = dataList.length;
                if (dataSize > 30) {
                    $('#chartContainer').height('800px');
                } else if (dataSize > 25) {
                    $('#chartContainer').height('700px');
                } else if (dataSize > 15) {
                    $('#chartContainer').height('600px');
                } else {
                    $('#chartContainer').height('500px');
                }

                var myChart = echarts.init(document.getElementById('chartContainer'));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getAreaMosuStackOption(dataList));

                myChart.on(echarts.config.EVENT.CLICK, function (param) {
                    var selectedData = dataList.getDataByKey("mainAcvtDongNm", param.name);
                    if (selectedData != null) {
                        var cityCd = selectedData.mainAcvtAdmDongCd;
                        if (cityCd.length > 5) {
                            $("#inputTest_"+cityCd).trigger("click");
                        } else {
                            var cityName = param.name;
                            if(cityName == "세종특별자치시") {
                                $("#inputTest_"+cityCd).trigger("click");
                            }
                        }
                    }
                });
            }


            // Chart의 Option 정보
            function _getAreaMosuStackOption(dataList) {
                var chartDatas = _getAreaMosuStackChartData(dataList);
                var option = {
                    grid: {
                        x: 100
                    },
                    dataZoom: {
                        x: '850',
                        show: true
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        },
                        formatter: function (params) {
                            return params[0].name + '<br/>' + params[0].seriesName + ' : ' + String(params[0].value).addComma() + '<br/>' + params[1].seriesName + ' : ' + String(params[1].value).addComma();
                        }
                    },
                    legend: {
                        selectedMode: false,
                        x: 'right',
                        data: ['모수-PUSH', 'PUSH']
                    },
                    calculable: true,
                    yAxis: [{
                        type: 'category',
                        axisLine: {
                            lineStyle: {
                                width: 1
                            }
                        },
                        axisLabel: 
                        {
                            clickable: (GV_CITY_NM != "세종특별자치시") ? (GV_CITY_CD.length >= 5) : (GV_CITY_CD.length >= 1), 
                            textStyle: {
                                color: ((GV_CITY_NM != "세종특별자치시") ? (GV_CITY_CD.length >= 5) : (GV_CITY_CD.length >= 1)) ? 'rgba(0, 0, 255, 1)' : 'rgba(0, 0, 0, 1)'
                            }
                        },
                        data: chartDatas[1]
                    }],
                    xAxis: [{
                        type: 'value',
                        axisLine: {
                            show: false,
                            lineStyle: {
                                width: 1
                            }
                        },
                        boundaryGap: [0, 0.01]
                    }],
                    series: chartDatas[0]
                };

                return option;
            }

            // Chart Data로 parsing
            function _getAreaMosuStackChartData(dataList) {
                var chartData = [],
                        categoryData = [];
                var data = [];
                data['모수-PUSH'] = [];
                data['PUSH'] = [];
                for (var status = 1, dataSize = dataList.length; status < dataSize; status++) {
                    if (status < 6) {
                        data['모수-PUSH'][dataSize - status - 1] = {
                            value: dataList[status].mosu,
                            itemStyle: {
                                normal: {
                                    color: GV_GENDER_COLOR.female(0.65),
                                    barBorderColor: GV_GENDER_COLOR.female(0.75)
                                }
                            }
                        };
                        data['PUSH'][dataSize - status - 1] = {
                            value: dataList[status].push,
                            itemStyle: {
                                normal: {
                                    barBorderColor: GV_GENDER_COLOR.female(0.75),
                                    label: {
                                        textStyle: {
                                            color: GV_GENDER_COLOR.female(0.75)
                                        }
                                    }
                                }
                            }
                        };
                    } else {
                        data['모수-PUSH'][dataSize - status - 1] = {	value: dataList[status].mosu	};
                        data['PUSH'][dataSize - status - 1] = {	value: dataList[status].push	};
                    }
                    categoryData[dataSize - status - 1] = dataList[status].mainAcvtDongNm;
                }
                
                
                
                
                chartData.push({
                    name: '모수-PUSH',
                    type: 'bar',
                    stack: 'sum',
                    barCategoryGap: '40%',
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.male(0.65),
                            barBorderColor: GV_GENDER_COLOR.male(0.75),
                            barBorderWidth: 2,
                            barBorderRadius: 0,
                            label: {
                                show: false,
                                position: 'insideBottom'
                            }
                        }
                    },
                    data: data['모수-PUSH']
                });
                chartData.push({
                    name: 'PUSH',
                    type: 'bar',
                    stack: 'sum',
                    itemStyle: {
                        normal: {
                            color: '#fff',
                            barBorderColor: GV_GENDER_COLOR.male(0.75),
                            barBorderWidth: 2,
                            barBorderRadius: 0,
                            label: {
                                show: true,
                                position: 'right',
                                textStyle: {
                                    color: GV_GENDER_COLOR.male(0.95),	fontStyle: 'italic', fontWeight : 'lighter'
                                },
                                formatter: function (params) {
                                    for (var i = 0, l = categoryData.length; i < l; i++) {
                                        return String(parseInt(data['모수-PUSH'][i].value) + parseInt(params.value)).addComma();
                                    }
                                }
                            }
                        }
                    },
                    data: data['PUSH']
                });
                return [chartData, categoryData];
            }

            /**
             * ##############  지역별 모수 현황 차트 END  ##############
             */

            /**
             * ##############  성별/연령대별 차트 START  ##############
             */
             var sexMap = {
            	        'F' : '여성',
            	        'M' : '남성'
            	    }
             var ageRangeMap = {
                     '0009' : '10세 미만',
                     '1019' : '10대',
                     '2029' : '20대',
                     '3039' : '30대',
                     '4049' : '40대',
                     '5099' : '50세 이상',
                     'ZZZZ' : '기타(연령)'
                 }
            function getSexAgePieChart(allChartId, chartId, sexList, ageList) {
            	var isMain = allChartId.indexOf('Dong') < 0;
                var datas = _getSexAgePieChartData(isMain, sexList, ageList);
                var myChart = echarts.init(document.getElementById(allChartId));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getSexAgePieOptions(isMain, datas[0], datas[1]));

                myChart = echarts.init(document.getElementById(chartId));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getSexAgePieOptions(isMain, datas[2], datas[3]));
            }

            // Chart의 Option 정보
            function _getSexAgePieOptions(isMain, sexData, ageData) {
                var option = {
                    tooltip: {
                        trigger: 'item',
                        formatter: "{b} : {c} ({d}%)" //{a} <br/>
                    },
                    legend: {
                        orient: 'vertical', x: 'right', // x: 'center',  y : 'bottom',
                        data: $.map(ageRangeMap, function(val, i){ return val; }) 
                        , show:isMain
                    },
                    calculable: false,
                    series: [{
                        name: '성별',
                        type: 'pie',
                        selectedMode: 'single',
                        radius: isMain ? [0, 90] : [0, 45],
                        x: '20%',
                        width: '40%',
                        funnelAlign: 'right',
                        itemStyle: {
                            normal: {
                                label: {
                                    position: 'inner'
                                },
                                labelLine: {
                                    show: false
                                }
                            }
                        },
                        data: sexData
                    }, {
                        name: '연령별',
                        type: 'pie',
                        radius: isMain ? [105, 140] : [55, 70],
                        x: '60%',
                        width: '35%',
                        funnelAlign: 'left',
                        data: ageData
                    }]
                };
                return option;
            }

            // Chart Data로 parsing
            function _getSexAgePieChartData(isMain, sexList, ageList) {
                var sexAllData = [],
                        sexData = [],
                        ageAllData = [],
                        ageData = [];
                for (var status = 0, dataSize = sexList.length; status < dataSize; status++) {
                    if (sexList[status].admDongNm != GV_CITY_NM) {
                        if(isMain){
                        	GV_PARENT_CITY_NM = sexList[status].admDongNm;
                            $('#chart2ParentTitle').text(GV_PARENT_CITY_NM);	
                        }
                        sexAllData.push({
                            name: sexMap[sexList[status].sexCd],
                            value: sexList[status].totMbrCnt,
                            itemStyle: {
                                normal: {
                                    color: (sexList[status].sexCd == "M" ? GV_GENDER_COLOR.male(0.95) : GV_GENDER_COLOR.female(0.95))
                                }
                            }
                        });
                    } else {
                        sexData.push({
                            name: sexMap[sexList[status].sexCd],
                            value: sexList[status].totMbrCnt,
                            itemStyle: {
                                normal: {
                                    color: (sexList[status].sexCd == "M" ? GV_GENDER_COLOR.male(0.95) : GV_GENDER_COLOR.female(0.95))
                                }
                            }
                        });
                    }
                }
                for (var status = 0, dataSize = ageList.length; status < dataSize; status++) {
                	ageList[status].ageRngNm =ageRangeMap[ageList[status].ageRngCd]; 
                    if (ageList[status].admDongNm != GV_CITY_NM) {
                        //GV_PARENT_CITY_NM = ageList[status].admDongNm;
                        ageAllData.push({
                            name: ageList[status].ageRngNm,
                            value: ageList[status].totMbrCnt
                        });
                    } else {
                        ageData.push({
                            name: ageList[status].ageRngNm,
                            value: ageList[status].totMbrCnt
                        });
                    }
                }
                return [sexAllData, ageAllData, sexData, ageData];
            }

            /**
             * ##############  성별/연령대별 차트 END  ##############
             */

            /**
             * ##############  성연령대별 차트 START  ##############
             */
            //
            function getSexAgeBarChart(chartId, dataList) {
                var myChart = echarts.init(document.getElementById(chartId));
                myChart.setTheme(GV_CHART_THEME);
                myChart.setOption(_getSexAgeBarOptions(chartId.indexOf('Dong') < 0, dataList));
            }

            // Chart의 Option 정보
            function _getSexAgeBarOptions(isMain, dataList) {
                var chartDatas = _getSexAgeBarChartData(dataList);
                var chartDatas = _getSexAgeBarChartData(dataList);
                
                var option = {
                	grid : {}, 
                    tooltip: {
                        trigger: 'axis'
                    },
                    calculable: true,
                    legend: {
                        data: [GV_CITY_NM + '(남)', GV_CITY_NM + '(여)', GV_PARENT_CITY_NM + '(남)', GV_PARENT_CITY_NM + '(여)']
                        , show:isMain
                    },
                    xAxis: [{
                        type: 'category',
                        data: ['0~9세', '10~19세', '20~29세', '30~39세', '40~49세', '50세이상', '기타(연령)']
                    }],
                    yAxis: [{
                        type: 'value',
                        min: 0,
                        max: chartDatas[0],
                        axisLabel: {
                            formatter: function(value){	return isMain ? Math.round(value) +' %' : Math.round(value); }
                        }
                    }, {
                        type: 'value',
                        min: 0,
                        max: chartDatas[0],
                        axisLine: {
                            show: false
                        },
                        axisLabel: {
                            show: false,
                            formatter: '{value}'// %
                        }
                    }],
                    series: chartDatas[1]
                };
                if(!isMain){option.grid = {x:30, y:20, width:'90%', height:'70%'}; }
                return option;
            }

            // Chart Data로 parsing
            function _getSexAgeBarChartData(dataList) {
                var sexMAllData = [],
                        sexFAllData = [],
                        sexMData = [],
                        sexFData = [];
                for (var status = 0, dataSize = dataList.length; status < dataSize; status++) {
                    if (dataList[status].admDongNm != GV_CITY_NM) {
                        GV_PARENT_CITY_NM = dataList[status].admDongNm;
                        if (dataList[status].sexCd == 'M') {
                            sexMAllData.push(dataList[status].totMbrCnt);
                        } else {
                            sexFAllData.push(dataList[status].totMbrCnt); //sexFAllData.push(parseFloat(dataList[status].totMbrCnt)*-1);
                        }

                    } else {
                        if (dataList[status].sexCd == 'M') {
                            sexMData.push(dataList[status].totMbrCnt);
                        } else {
                            sexFData.push(dataList[status].totMbrCnt);
                        }
                    }
                }
                /*
                 return [sexMAllData, sexFAllData, sexMData, sexFData];
                 */
                var max = Math.max.apply(null, sexMAllData);
                var subMax = Math.max.apply(null, sexFAllData);
                if (max < subMax) {
                    max = subMax;
                }
                subMax = Math.max.apply(null, sexMData);
                if (max < subMax) {
                    max = subMax;
                }
                subMax = Math.max.apply(null, sexFData);
                if (max < subMax) {
                    max = subMax;
                }

                var chartData = [{
                    name: GV_PARENT_CITY_NM + '(남)',
                    type: 'bar',
                    data: sexMAllData,
                    barCategoryGap: '50%',
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.male(0.4)
                        }
                    }
                }, {
                    name: GV_PARENT_CITY_NM + '(여)',
                    type: 'bar',
                    data: sexFAllData,
                    barCategoryGap: '50%',
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.female(0.4)
                        }
                    }
                }, {
                    name: GV_CITY_NM + '(남)',
                    type: 'line',
                    yAxisIndex: 1,
                    data: sexMData,
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.male(0.95)
                        }
                    }
                }, {
                    name: GV_CITY_NM + '(여)',
                    type: 'line',
                    yAxisIndex: 1,
                    data: sexFData,
                    itemStyle: {
                        normal: {
                            color: GV_GENDER_COLOR.female(0.95)
                        }
                    }
                }];
                return [max, chartData];
            }

            /**
             * ##############  성연령대별 차트 END  ##############
             */
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>