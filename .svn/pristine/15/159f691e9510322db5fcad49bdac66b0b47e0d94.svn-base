//查询赋值
function query(form,data){
    //省市区
    provinceChange(form,data.provinceId,data.cityId,data.countyId);
}

/**
 * 初始化省
 */
function provinceChange(form,provinceValue,cityValue,countyValue){
/*
    debugger
    if (provinceValue != "110000" && provinceValue != "120000" && provinceValue != "310000" && provinceValue != "500000") {
        $("#countyAdd").attr("style","display:none;");
    }else{
        $("#countyAdd").attr("style","display:block;");
    }
*/




    var ChineseDistricts=districts();
    var provinces=ChineseDistricts["86"];
    var province=$('.province');
    province.empty();
    province.append('<option value="'+""+'">'+"请选择省"+'</option>');
    for(key in provinces){
        if(key==provinceValue){
            province.append('<option selected value="'+key+'">'+provinces[key]+'</option>');
        }else{
            province.append('<option value="'+key+'">'+provinces[key]+'</option>');
        }
    }
    form.render('select');
    cityChange(form,provinceValue,cityValue,countyValue);

}

/**
 * 初始化市
 */
function cityChange(form,provinceValue,cityValue,countyValue){
    //改变市
    var ChineseDistricts=districts();
    var citys=ChineseDistricts[provinceValue];
    var city=$('.city');
    city.empty();
    city.append('<option value="'+""+'">'+"请选择市"+'</option>');
    for(key in citys){
        if(key==cityValue){
            city.append('<option selected value="'+key+'">'+citys[key]+'</option>');
        }else{
            city.append('<option value="'+key+'">'+citys[key]+'</option>');
        }
    }
    form.render('select');
    countyChange(form,cityValue,countyValue);
}

/**
 * 初始化县/区
 */
function countyChange(form,cityValue,countyValue){
    //改变县/区
    var ChineseDistricts=districts();
    var countys=ChineseDistricts[cityValue];
    var county=$('.county');
    county.empty();
    county.append('<option value="'+""+'">'+"请选择县/区"+'</option>');
    for(key in countys){
        if(key==countyValue){
            county.append('<option selected value="'+key+'">'+countys[key]+'</option>');
        }else{
            county.append('<option value="'+key+'">'+countys[key]+'</option>');
        }
    }
    form.render('select');
}
