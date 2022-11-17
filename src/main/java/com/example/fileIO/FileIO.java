package com.example.fileIO;
import com.oreilly.servlet.MultipartRequest;

import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class FileIO {
    public BoardDAO upLoadFile(HttpServletRequest request){
        BoardVO one = null;
        String fileName = null;
        int sizeLimit = 15 * 1024 * 1024;

        String path = request.getServletContext().getRealPath("upload");
        MultipartRequest multipartRequest = null;

        try {
            multipartRequest = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            fileName = multipartRequest.getFilesystemName("photo");
            one = new BoardVO();
            String sid = multipartRequest.getParameter("seq");



        } catch (IOException e){
            System.out.println(e);
        }


        return one;
    }
}
