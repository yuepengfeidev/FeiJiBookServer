package com.ypf.feijibookserver.service.impl;

import com.alibaba.fastjson.JSON;
import com.ypf.feijibookserver.dao.UserMapper;
import com.ypf.feijibookserver.entity.*;
import com.ypf.feijibookserver.service.UserService;
import com.ypf.feijibookserver.util.FileUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * UserServiceImpl
 *
 * @author PengFei Yue
 * @date 2019/10/8
 * @description
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    private static String LOGIN_SUCCESS = "LoginSuccess";
    private static String ACCOUNT_ERROR = "AccountError";
    private static String PASSWORD_ERROR = "PasswordError";
    private static String REGISTER_FAILED = "RegisterFailed";
    private static String REGISTER_SUCCESS = "RegisterSuccess";
    private static String UPLOAD_FAILED = "UpLoadFailed";
    private static String UPLOAD_SUCCESS = "UpLoadSuccess";
    private static String CHANGE_SUCCESS = "ChangeSuccess";
    private static String DELETE_SUCCESS = "DeleteSuccess";
    /**
     * 无界线程池
     */
    private ThreadPoolExecutor threadPoolExecutor =
            new ThreadPoolExecutor(0, Integer.MAX_VALUE,
                    60L, TimeUnit.SECONDS,
                    new SynchronousQueue<>());

    @Override
    public String login(String account, String password) {
        UserInfoBean userInfo = userMapper.findAccount(account);
        if (userInfo == null) {
            // 没有找到该账户名
           return ACCOUNT_ERROR;
        } else {
            if (userInfo.getPassword().equals(password)) {
                // 密码正确，登录成功
                return LOGIN_SUCCESS;
            } else {
               return PASSWORD_ERROR;
            }
        }
    }

    @Override
    public int adminLogin(String name, String password) {
            AdminBean adminBean = userMapper.adminLogin(name);
        if (adminBean == null) {
            // 没有找到该账户名
            return 0;
        } else {
            if (adminBean.getPassword().equals(password)) {
                // 密码正确，登录成功
                return 1;
            } else {
                return 0;
            }
        }

    }

    @Override
    public String getUser() {
        List<UserInfoBean> list = userMapper.getUser();
        String json = JSON.toJSONString(list);
        return json;
    }

    @Override
    public String updateDataModel(DataModelBean modelBean) {
        userMapper.updateDataModel(modelBean);
        return CHANGE_SUCCESS;
    }

    @Override
    public String getDataModel() {
        String json = JSON.toJSONString(userMapper.getDataModel());
        return json;
    }

    @Override
    public String getMainProportion() {
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        List<Map<String,Object>> list = userMapper.getMainProportion(year);
        String json = JSON.toJSONString(list);
        return  json;
    }

    @Override
    public String getExpendTrend() {
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        List<Map<String,Object>> list = userMapper.getExpendTrend(year);
        Map<String,List<Integer>> data = new HashMap<>();
        Map<String,Object> item;
        List<Integer> money;
        int i = 0;
        while (i < list.size()){
            item = list.get(i);
               if ( !data.containsKey(item.get("type"))){
                        money = new ArrayList<>(Arrays.asList(0,0,0,0,0,0,0,0,0,0,0,0));
                        data.put(item.get("type").toString(),money);

               }else {
                    money = data.get(item.get("type"));
               }
                money.set(Integer.parseInt(item.get("month").toString()) - 1,Double.valueOf(item.get("money").toString()).intValue());
            i++;
        }
        String json = JSON.toJSONString(data);
        return  json;
    }

    @Override
    public void disposeYearMonthRecord(DetailRecordBean detailRecordBean , String dispose) {
            YearExpendBean yearExpendBean = new YearExpendBean();
            MonthExpendBean monthExpendBean= new MonthExpendBean();
            yearExpendBean.setAccount(detailRecordBean.getAccount());
            monthExpendBean.setAccount(detailRecordBean.getAccount());
            yearExpendBean.setYear(Integer.parseInt(detailRecordBean.getYear()));
            monthExpendBean.setYear(Integer.parseInt(detailRecordBean.getYear()));
            yearExpendBean.setType(detailRecordBean.getDetail_type());
            monthExpendBean.setType(detailRecordBean.getDetail_type());
            yearExpendBean.setMoney(new BigDecimal(detailRecordBean.getMoney()));
            monthExpendBean.setMoney(new BigDecimal(detailRecordBean.getMoney()));
            monthExpendBean.setMonth(Integer.parseInt(detailRecordBean.getMonth()));

            YearExpendBean yearExpend = userMapper.getYearExpend(yearExpendBean);
            MonthExpendBean monthExpend = userMapper.getMonthExpend(monthExpendBean);
            if (yearExpend == null){
                userMapper.insertYearExpend(yearExpendBean);
            }else {
                if (dispose.equals("add")){
                    yearExpend.setMoney(yearExpend.getMoney().add(yearExpendBean.getMoney()));
                }else if (dispose.equals("sub")){
                    BigDecimal money = yearExpend.getMoney().subtract(yearExpendBean.getMoney());
                    // 等于1时，money大于0
                    if (money.compareTo(BigDecimal.ZERO) < 1){
                        // 金额为零时则删除记录
                        userMapper.deleteYearExpend(yearExpendBean);
                    }else {
                        yearExpend.setMoney(money);
                        userMapper.updateYearExpend(yearExpend);
                    }
                }
                userMapper.updateYearExpend(yearExpend);
            }
            if (monthExpend == null){
                userMapper.insertMonthExpend(monthExpendBean);
            }else {
                if (dispose.equals("add")){
                    monthExpend.setMoney(monthExpend.getMoney().add(monthExpendBean.getMoney()));
                }else if (dispose.equals("sub")){
                    BigDecimal money = monthExpend.getMoney().subtract(monthExpendBean.getMoney());
                    if (money.compareTo(BigDecimal.ZERO) < 1){
                        userMapper.deleteMonthExpend(monthExpendBean);
                    }else {
                        monthExpend.setMoney(money);
                        userMapper.updateMonthExpend(monthExpend);
                    }
                }
                userMapper.updateMonthExpend(monthExpend);
            }
    }

    @Override
    public String getUserRecord(String account) {
        Calendar calendar = Calendar.getInstance();
        int dayNum = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        String year = String.valueOf(calendar.get(Calendar.YEAR));
        Format formatter = new SimpleDateFormat("MM");
        String month = formatter.format(new Date());
        MonthRecordBean expendBean = new MonthRecordBean();
        expendBean.setAccount(account);
        expendBean.setYear(year);
        expendBean.setMonth(month);
        expendBean.setIoe("支出");
        MonthRecordBean incomeBean = new MonthRecordBean();
        incomeBean.setAccount(account);
        incomeBean.setYear(year);
        incomeBean.setMonth(month);
        incomeBean.setIoe("收入");
        Map<String,Object> data = new HashMap<>();
        List<Map<String,Object>> expendList = userMapper.getMonthRecord(expendBean);
        List<Map<String,Object>> expendRecords = userMapper.getDayRecord(expendBean);
        Map<String,Object> expendMap = packageData(expendList,dayNum);
        expendMap.put("record",packageRecord(expendRecords));
        data.put("支出",expendMap);
        List<Map<String,Object>> incomeList = userMapper.getMonthRecord(incomeBean);
        List<Map<String,Object>> incomeRecords = userMapper.getDayRecord(incomeBean);
        Map<String,Object> incomeMap = packageData(incomeList,dayNum);
        incomeMap.put("record",packageRecord(incomeRecords));
        data.put("收入",incomeMap);
        String json = JSON.toJSONString(data);

        return json;
    }

    @Override
    public String getExpendIntroduce() {
        Map<String,Object> map = new HashMap<>();
        DataModelBean modelBean = userMapper.getDataModel();
        List<String> type = new ArrayList<>();
        List<Integer> money = new ArrayList<>();
        type.add("餐饮");
        money.add(modelBean.getCatering());
        type.add("日用");
        money.add(modelBean.getDaily());
        type.add("购物");
        money.add(modelBean.getShopping());
        type.add("娱乐");
        money.add(modelBean.getAmusement());
        type.add("交通");
        money.add(modelBean.getTraffic());
        map.put("type",type);
        map.put("money",money);
        return JSON.toJSONString(map);
    }

    public Map<String,Object> packageRecord(List<Map<String,Object>> list){
        int i = 0;
        Map<String,Object> records = new HashMap<>();
        List<String> dayRecords;
        while (i < list.size()) {
            Map<String,Object> map = list.get(i);
            String day = String.valueOf(Integer.parseInt((String)map.get("day")));
            if (!records.containsKey(day)){
              dayRecords = new ArrayList<>();
              records.put(day,dayRecords);
            }else {
                dayRecords = (List<String>) records.get(day);
            }
            if (dayRecords.size() <3 ) {
                dayRecords.add(map.get("type").toString() + map.get("money").toString() + "元");
            }
            i++;
        }
        return records;
    }

    public Map<String, Object> packageData(List<Map<String,Object>> list, int dayNum) {
        List<String> days = new ArrayList<>(dayNum);
        List<String> moneys =  Arrays.asList(new String[dayNum]);
        for (int i = 1; i <= dayNum;i++){
            if (i - 1 < list.size()) {
                String money = Double.toString((Double) list.get(i - 1).get("money"));
                moneys.set(Integer.parseInt((String) list.get(i - 1).get("day")) - 1, money);
            }
            if ( moneys.get(i - 1) == null) {
                moneys.set(i - 1, "0");
            }
            days.add(String.valueOf(i));
        }
        Map<String,Object> map = new HashMap<>();
        map.put("moneys",moneys);
        map.put("days",days);
        return  map;
    }

    @Override
    public UserInfoBean getUserInfo(String account) {
        return userMapper.findAccount(account);
    }

    @Override
    public String register(String account, String password) {
        UserInfoBean userInfo = userMapper.findAccount(account);
        if (userInfo != null) {
            // 已存在该账户，注册失败
            return REGISTER_FAILED;
        } else {
            // 否则注册成功，添加账户到数据库
            userMapper.register(account, password);
            return REGISTER_SUCCESS;
        }
    }

    @Override
    public String addRecord(DetailRecordBean detailRecordBean) {
        userMapper.addRecord(detailRecordBean);
        if (detailRecordBean.getIoe().equals("支出")) {
            disposeYearMonthRecord(detailRecordBean, "add");
        }
        return UPLOAD_SUCCESS;
    }


    @Override
    public String changeRecord(DetailRecordBean detailRecordBean) {
       DetailRecordBean oldRecord = userMapper.findRecord(detailRecordBean);
        userMapper.deleteRecord(detailRecordBean.getResId(), detailRecordBean.getAccount());
        userMapper.addRecord(detailRecordBean);
        if (detailRecordBean.getIoe().equals("支出")) {
            // 如果老记录金额大于新记录，则更新减少金额
            if (Integer.parseInt(oldRecord.getMoney()) > Integer.parseInt(detailRecordBean.getMoney())){
                disposeYearMonthRecord(detailRecordBean, "sub");
            }else {
                disposeYearMonthRecord(detailRecordBean, "add");
            }
        }
        return CHANGE_SUCCESS;
    }

    @Override
    public String upLoadTypeSetting(String account, List<RecordType> list) {
        userMapper.deleteTypeSetting(account);
        userMapper.setTypeSetting(account, list);
        return UPLOAD_SUCCESS;
    }

    @Override
    public String deleteRecord(String account, String id) {
        DetailRecordBean detailRecordBean = new DetailRecordBean();
        detailRecordBean.setAccount(account);
        detailRecordBean.setId(id);
        detailRecordBean = userMapper.findRecord(detailRecordBean);
        userMapper.deleteRecord(id, account);
        if (detailRecordBean.getIoe().equals("支出")) {
            disposeYearMonthRecord(detailRecordBean, "sub");
        }
        return DELETE_SUCCESS;
    }

    @Override
    public String uploadPortrait(HttpServletRequest httpServletRequest) {
        try { for (FileItem fileItem : FileUtils.
                    parseFileUpload(httpServletRequest)) {
                // 这是传入的name
                String account = fileItem.getFieldName();
                // 这是传入的文件名
                String portrait = fileItem.getName();
                String realPath = httpServletRequest.
                        getServletContext().getRealPath("\\");
                String saveUrl = FileUtils.getFileName
                        (realPath, account, "portrait",
                        account + portrait);
                try { InputStream inputStream = fileItem.getInputStream();
                    FileUtils.inputStreamToFile(inputStream, saveUrl);
                    userMapper.setPortrait(account, saveUrl);
                } catch (IOException e) { e.printStackTrace(); } }
            return UPLOAD_SUCCESS;
        } catch (FileUploadException e) { e.printStackTrace(); }
        return UPLOAD_FAILED; }

    @Override
    public String uploadRecordVideos(HttpServletRequest httpServletRequest) {
        String account = httpServletRequest.getParameter("account");
        String realPath = httpServletRequest.getServletContext().getRealPath("\\");
        try {
            List<FileItem> fileItems = FileUtils.parseFileUpload(httpServletRequest);
            UploadVideosThread thread = new
                    UploadVideosThread(fileItems, account, realPath, userMapper);
            threadPoolExecutor.execute(thread);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }return UPLOAD_SUCCESS; }

    @Override
    public String uploadRecordPhotos(HttpServletRequest httpServletRequest) {
        String account = httpServletRequest.getParameter("account");
        String realPath = httpServletRequest.getServletContext().getRealPath("\\");
        try {
            List<FileItem> fileItems = FileUtils.parseFileUpload(httpServletRequest);
            UploadPhotosThread thread =
                    new UploadPhotosThread(fileItems, account, realPath, userMapper);
            threadPoolExecutor.execute(thread);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        return UPLOAD_SUCCESS;
    }

    @Override
    public void downloadPortrait(HttpServletRequest request, HttpServletResponse response) {
        String path = request.getParameter("url");
        InputStream bis;
        try {
            bis = new BufferedInputStream(new FileInputStream(new File(path)));
            //转码，免得文件名中文乱码
            path = URLEncoder.encode(path, "UTF-8");
            //设置文件下载头
            response.addHeader("Content-Disposition", "attachment;filename=" + path);
            //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
            response.setContentType("multipart/form-data");
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            int len;
            while ((len = bis.read()) != -1) {
                out.write(len);
                out.flush();
            }
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    @Override
    public String changeSex(String account, String sex) {
        userMapper.setSex(account, sex);
        return CHANGE_SUCCESS;
    }

    @Override
    public String changeNickName(String account, String nickName) {
        userMapper.setNickname(account, nickName);
        return CHANGE_SUCCESS;
    }


    @Override
    public String changePassword(String account, String redPw, String changePw) {
        UserInfoBean userInfoBean = userMapper.findAccount(account);
        if (userInfoBean.getPassword().equals(redPw)) {
            userMapper.setPassword(account, changePw);
            return CHANGE_SUCCESS;
        } else {
            return PASSWORD_ERROR;
        }
    }

    public class UploadPhotosThread implements Runnable {
        List<FileItem> fileItems;
        String account;
        String realPath;
        private UserMapper userMapper;

        UploadPhotosThread(List<FileItem> fileItems, String account, String realPath, UserMapper userMapper) {
            this.fileItems = fileItems;
            this.account = account;
            this.realPath = realPath;
            this.userMapper = userMapper;
        }

        @Override
        public void run() {
            try {
                String lastId = null;
                List<PhotosBean> photosBeans = new ArrayList<>();
                // 这是传入的文件名
                String imgName;
                StringBuilder stringBuilder = new StringBuilder();
                String saveUrl;
                for (FileItem fileItem : fileItems) {
                    String id = fileItem.getFieldName();

                    imgName = fileItem.getName();
                    InputStream inputStream = fileItem.getInputStream();
                    saveUrl = FileUtils.getFileName(realPath, account, "photo",
                            imgName);
                    FileUtils.inputStreamToFile(inputStream, saveUrl);
                    if (lastId != null && !id.equals(lastId)) {
                        // 如果上一个id和当前id不同e，表示不同记录，则添加上条记录到list
                        PhotosBean photosBean = new PhotosBean();
                        photosBean.setId(lastId);
                        photosBean.setImg_url(stringBuilder.toString());
                        photosBeans.add(photosBean);
                        stringBuilder = new StringBuilder();
                        lastId = id;
                    } else if (lastId == null) {
                        // 第一条记录则记下id
                        lastId = id;
                    }
                    stringBuilder.append(imgName);
                    stringBuilder.append("|");
                }
                PhotosBean photosBean = new PhotosBean();
                photosBean.setId(lastId);
                photosBean.setImg_url(stringBuilder.toString().trim());
                // 添加最后一条记录（for循环中只添加上调记录）
                photosBeans.add(photosBean);
                if (photosBeans.size() > 0) {
                    userMapper.setImgUrl(account, photosBeans);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public class UploadVideosThread implements Runnable {
        List<FileItem> fileItems;
        String account;
        String realPath;
        UserMapper userMapper;

        UploadVideosThread(List<FileItem> fileItems, String account, String realPath, UserMapper userMapper) {
            this.fileItems = fileItems;
            this.account = account;
            this.realPath = realPath;
            this.userMapper = userMapper;
        }

        @Override
        public void run() {
            try {
                String id;
                String video;
                List<VideoBean> videoBeans = new ArrayList<>();
                for (FileItem fileItem : fileItems) {
                    id = fileItem.getFieldName();
                    // 这是传入的文件名
                    video = fileItem.getName();
                    videoBeans.add(new VideoBean(id, video));
                    String saveUrl = FileUtils.getFileName(realPath, account, "video",
                            video);
                    System.out.println("URL:    "+saveUrl +"------"+video);

                    InputStream inputStream = fileItem.getInputStream();
                    FileUtils.inputStreamToFile(inputStream, saveUrl);
                }
                if (videoBeans.size() > 0) {
                    userMapper.setVideoUrl(account, videoBeans);
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
