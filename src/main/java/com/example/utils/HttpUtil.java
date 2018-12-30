package com.example.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

public class HttpUtil {

    private String value;

    public HttpUtil(String value) {
        this.value = value;
    }

    @SuppressWarnings("unchecked")
	public Map<String, Object> toMap() {
        if (value != null) {
            try {
                return new ObjectMapper().readValue(value, Map.class);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public <T> T toDto(Class<T> tClass) {
        try {
            return new ObjectMapper().readValue(value, tClass);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static HttpUtil of(BufferedReader reader) {
        StringBuffer json = new StringBuffer();
        try {
            String line = reader.readLine();
            while (line != null) {
                json.append(line);
                line = reader.readLine();
            }
        } catch (Exception e) {
        }
        return new HttpUtil(json.toString());
    }
}
