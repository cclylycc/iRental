<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp" %>
<%--搜索界面--%>
<div class="image-cover hero_banner" style="background: #334ACA url('/assets/img/bg4001.jpg') no-repeat;"
     data-overlay="1">
    <div class="container">
        <h1 class="big-header-capt mb-0">美好生活 从爱租房出发</h1>
        <p class="text-center mb-5">立即搜索您所在城市的房屋类型</p>
        <div class="full_search_box nexio_search lightanic_search hero_search-radius modern">
            <div class="search_hero_wrapping">
                <form action="/house">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>目的地、城市或景点</label>
                                <div class="input-with-icon">
                                    <input type="text" id="address" name="address" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>城市名称</label>
                                <div class="input-with-icon">
                                    <select name="city" id="city" class="form-control">
                                        <option value="">不限</option>
                                        <option value="北京">北京</option>
                                        <option value="天津">天津</option>
                                        <option value="河北">河北</option>
                                        <option value="山西">山西</option>
                                        <option value="内蒙古">内蒙古</option>
                                        <option value="辽宁">辽宁</option>
                                        <option value="吉林">吉林</option>
                                        <option value="黑龙江">黑龙江</option>
                                        <option value="上海">上海</option>
                                        <option value="江苏">江苏</option>
                                        <option value="浙江">浙江</option>
                                        <option value="安徽">安徽</option>
                                        <option value="福建">福建</option>
                                        <option value="江西">江西</option>
                                        <option value="山东">山东</option>
                                        <option value="河南">河南</option>
                                        <option value="湖北">湖北</option>
                                        <option value="湖南">湖南</option>
                                        <option value="广东">广东</option>
                                        <option value="广西">广西</option>
                                        <option value="海南">海南</option>
                                        <option value="重庆">重庆</option>
                                        <option value="四川">四川</option>
                                        <option value="贵州">贵州</option>
                                        <option value="云南">云南</option>
                                        <option value="西藏">西藏</option>
                                        <option value="陕西">陕西</option>
                                        <option value="甘肃">甘肃</option>
                                        <option value="青海">青海</option>
                                        <option value="宁夏">宁夏</option>
                                        <option value="新疆">新疆</option>
                                        <option value="香港">香港</option>
                                        <option value="澳门">澳门</option>
                                        <option value="台湾">台湾</option>
                                        <option value="英国">英国</option>
                                        <option value="美国">美国</option>
                                        <option value="西班牙">西班牙</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>租房类型</label>
                                <div class="input-with-icon">
                                    <select name="rentType" id="selectRentType" class="form-control">
                                        <option value="">不限</option>
                                        <option value="whole">整租</option>
                                        <option value="share">合租</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>月租金范围</label>
                                <div class="input-with-icon">
                                    <select name="priceRange" id="price" class="form-control">
                                        <option value="">不限</option>
                                        <option value="0;999">1000以内</option>
                                        <option value="1000;1999">1000-1999</option>
                                        <option value="2000;3999">2000-3999</option>
                                        <option value="4000;5999">4000-5999</option>
                                        <option value="6000;7999">6000-7999</option>
                                        <option value="8000;9999">8000-9999</option>
                                        <option value="10000;14999">10000-14999</option>
                                        <option value="15000;19999">15000-19999</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 small-padd">
                            <div class="form-group none">
                                <button type="submit" class="btn search-btn">搜索</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--//搜索界面 完--%>
<script type="text/javascript">
    function text() {
        var json = jsonContent
        json = eval(json.options)
        for (var i = 0; i < json.length; i++) {
            alert(json[i].text + " " + json[i].value)
        }
    }
</script>
<%--根据用户地址推荐房屋--%>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="sec-heading center">
                <%--根据用户IP获取位置--%>
                <script type="text/javascript"
                        src="http://api.map.baidu.com/api?v=2.0&ak=hVcoW3dblL1f6u6lyYfWi5mdxjIuBIhu"></script>
                <!--加载鼠标绘制工具-->
                <script type="text/javascript"
                        src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
                <script type="text/javascript">
                    //百度地图API功能
                    var map = new BMap.Map('map');
                    //获得当前城市
                    var myCity = new BMap.LocalCity();
                    myCity.get(myFun);

                    function myFun(result) {
                        var cityName = result.name;
                        var realCityName = cityName.replace("市", "");
                        var toRealCityName = realCityName.replace("省", "");
                        var a = toRealCityName + "优质房源";
                        cityLocation.innerHTML = a;
                    }
                </script>
                <%--//根据用户IP获取位置 完--%>
                <input id="locationCity" type="hidden"/>
                <h2 id="cityLocation"></h2>
                <p><i class="ti-location-pin"></i>根据您的位置推荐的优质房源</p>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${locationHouseList}" var="c">
                <c:choose>
                    <c:when test="${locationHouseList != null}">
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">
                                <div class="listing_thumb_wrapper">
                                    <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}"
                                                                         class="img-fluid mx-auto"></a>
                                </div>
                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1"><a
                                                    href="/house/detail/${c.id}">${c.title}</a>
                                            </h4>
                                            <div class="listing-location-name">
                                                <a href="/house/detail/${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span
                                                    class="price_status">/月 - ￥${c.monthRent/30}/日</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bed.svg"></span>${c.bedroomNum}间卧室
                                            </li>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bath.svg"></span>${c.toiletNum}间卫生间
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse"
                                           onclick="submitMark(${c.id})">收藏</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h2>当前位置暂无推荐房屋</h2>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>
    </div>
</section>
<%--整租--%>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="sec-heading center">
                <h2>最新整租</h2>
                <p>为您推荐最新发布的整租房屋信息</p>
            </div>
        </div>

        <div class="row">
            <c:choose>
                <c:when test="${recentWholeHouseList !=null}">
                    <c:forEach items="${recentWholeHouseList}" var="c">
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">
                                <div class="listing_thumb_wrapper">
                                    <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}"
                                                                         class="img-fluid mx-auto"></a>
                                </div>
                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1"><a
                                                    href="/house/detail/${c.id}">${c.title}</a>
                                            </h4>
                                            <div class="listing-location-name">
                                                <a href="/house/detail/${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span
                                                    class="price_status">/月 - ￥${c.monthRent/30}/日</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bed.svg"></span>${c.bedroomNum}间卧室
                                            </li>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bath.svg"></span>${c.toiletNum}间卫生间
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse"
                                           onclick="submitMark(${c.id})">收藏</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <h2>当前位置暂无推荐房屋</h2>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=whole" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>
    </div>
</section>
<%--整租完--%>

<%--合租 开始--%>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="sec-heading center">
                <h2>最新合租</h2>
                <p>为您推荐最新发布的合租房屋信息</p>
            </div>
        </div>
        <div class="row">
            <c:choose>
                <c:when test="${recentShareHouseList !=null}">
                    <c:forEach items="${recentShareHouseList}" var="c">
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">
                                <div class="listing_thumb_wrapper">
                                    <a href="/house/detail/${c.id}"><img src="${c.thumbnailUrl}"
                                                                         class="img-fluid mx-auto"></a>
                                </div>
                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1"><a
                                                    href="/house/detail/${c.id}">${c.title}</a>
                                            </h4>
                                            <div class="listing-location-name">
                                                <a href="/house/detail/${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/house/detail/${c.id}" class="cl-blue">￥${c.monthRent}<span
                                                    class="price_status">/月 - ￥${c.monthRent/30}/日</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bed.svg"></span>${c.bedroomNum}间卧室
                                            </li>
                                            <li>
                                                <span class="flatcons"><img
                                                        src="/assets/img/bath.svg"></span>${c.toiletNum}间卫生间
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse"
                                           onclick="submitMark(${c.id})">收藏</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <h2>当前位置暂无推荐房屋</h2>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=share" class="btn btn-theme arrow-btn bg-2">查看更多
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>
    </div>
</section>
<%--合租 结束--%>

<%--旅游胜地推荐 开始--%>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="sec-heading center">
                <h2>旅游胜地</h2>
                <p>发现更多出行灵感</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="single_property_style property_style_2 modern">
                    <div class="listing_thumb_wrapper">
                        <a href="/house?city=重庆"><img src="/assets/img/attraction/chongqing.jpg"
                                                      class="img-fluid mx-auto"></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="single_property_style property_style_2 modern">
                    <div class="listing_thumb_wrapper">
                        <a href="/house?city=四川"><img src="/assets/img/attraction/chengdu.jpg"
                                                      class="img-fluid mx-auto"></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="single_property_style property_style_2 modern">
                    <div class="listing_thumb_wrapper">
                        <a href="/house?city=上海"><img src="/assets/img/attraction/shanghai.jpg"
                                                      class="img-fluid mx-auto"></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="single_property_style property_style_2 modern">
                    <div class="listing_thumb_wrapper">
                        <a href="/house?city=广东"><img src="/assets/img/attraction/guangzhou.jpg"
                                                      class="img-fluid mx-auto"></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="single_property_style property_style_2 modern">
                    <div class="listing_thumb_wrapper">
                        <a href="/house?city=浙江"><img src="/assets/img/attraction/hangzhou.jpg"
                                                      class="img-fluid mx-auto"></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="single_property_style property_style_2 modern">
                    <div class="listing_thumb_wrapper">
                        <a href="/house?city=湖南"><img src="/assets/img/attraction/changsha.jpg"
                                                      class="img-fluid mx-auto"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--旅游胜地推荐 结束--%>
<section class="gray-simple">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2>旅行安全保证</h2>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <img src="https://z1.muscache.cn/airbnb/static/packages/IndicatorHostGuarantee.20c37f9e.svg"
                     class="big-header-capt mb-0">
                <span class="text-center mb-5">安心房源保障 人工审核房源 入住更放心</span>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <img src="https://z1.muscache.cn/airbnb/static/packages/IndicatorExperienceInsurance.903112a9.svg"
                     class="img-fluid mx-auto">
                <span>旅行安全保障 多重风险控制 保障居住安全</span>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <img src="https://z1.muscache.cn/airbnb/static/packages/IndicatorCXinsurance.32cdc2f5.svg"
                     class="img-fluid mx-auto">
                <span>专业中文客服 +86 4008208820</span>
            </div>
        </div>
    </div>
</section>
<%@ include file="../common/footer.jsp" %>

