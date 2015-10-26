package soul.common.utils;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class ThumbnailUtil {
	public static final int SAME =-1;
	public static final int RATIO=0;
	
	public static void makeThumbnail(File src, File dest, int width, int height) throws IOException
	{
		FileInputStream srcIs=null;
		
		try {
			srcIs=new FileInputStream(src);
			makeThumbnail(srcIs, dest, width, height);
		} finally{
			if(srcIs !=null){
				try {
					srcIs.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void makeThumbnail(InputStream src, File dest, int width, int height) throws IOException
	{
		
		BufferedImage srcImg=ImageIO.read(src);
		
		int srcWidth=srcImg.getWidth();
		int srcHeight=srcImg.getHeight();
		
		int destWidth=-1;
		int destHeight=-1;
		
		if(width==SAME){
			destWidth=srcWidth;
		}else if(width>0){
			destWidth=width;
		}
		
		if(height==SAME){
			destHeight=srcHeight;
		}else if(height>0){
			destHeight=height;
		}
		/*	둘중에 하나라도 0의 숫자가 들어오면 나머지 하나의 값에  비율에 맞춰서 초기값을 설정해준다..*/
		if(width==RATIO && height==RATIO){//둘다 0이면
			destWidth=srcWidth;
			destHeight=srcHeight;
		}else if(width == RATIO){
			double ratio=((double)destHeight) / ((double)destHeight);
			destWidth=(int)((double)srcWidth * ratio);
		}else if(height ==RATIO){
			destHeight=srcHeight; //위에 로직 이해 못하겠다 어차피 ratio는 1아닌가;;;
		}
		//새로운 이미지 정보 할당
		BufferedImage destImg=new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_3BYTE_BGR);
		//썸네일 그리기
		Graphics2D g=destImg.createGraphics();//그려질 도화지를 던져주는 형식
		g.drawImage(srcImg, 0, 0, destWidth, destHeight, null);//
		ImageIO.write(destImg, "png", dest);
		//이미지 생성
		
	}
}
