package helper;

import com.alibaba.fastjson.JSONObject;

public class Util {

    public static final int SUCCESS = 1;
    public static final int FAILED = 0;

    public static Object constructResponse(int flag, String msg, Object data) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("flag", flag);
        jsonObject.put("msg", msg);
        jsonObject.put("data", data);
        return jsonObject;
    }

    public static boolean isEmpty(String str) {
        return str == null || str.equals("");
    }
}
