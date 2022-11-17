package com.example.fileIO;

import com.oreilly.servlet.MultipartRequest;

import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileIO {
    public BoardVO uploadPhoto(HttpServletRequest request) {
        String fileName = ""; //업로드 되는 파일 이름 저장용
        int sizeLimit = 15*1024*1024; //파일 크기(15 MB)

        String realPath = request.getServletContext().getRealPath("upload");
//        System.out.println(realPath);

        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdir();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;

        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            fileName = multipartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String sid = multipartRequest.getParameter("seq");

            if (sid != null && !sid.equals("")) one.setSeq(Integer.parseInt(sid));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));

            if (sid != null && !sid.equals("")) {
                BoardDAO boardDAO = new BoardDAO();
                String oldFileName = boardDAO.getPhotoFilename(Integer.parseInt(sid));

                if (fileName != null && oldFileName != null)
                    FileIO.deleteFile(request, oldFileName);
                else if (fileName == null && oldFileName != null)
                    fileName = oldFileName;
            }
            one.setFileName(fileName);

        } catch (IOException e) {
            e.printStackTrace();
        }
//        System.out.println("");
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String fileName) {
        String path = request.getServletContext().getRealPath("upload");

        File file = new File(path + "/" + fileName);
        if (file.exists()) file.delete();
    }
}
