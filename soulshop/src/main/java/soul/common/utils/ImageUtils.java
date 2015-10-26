package soul.common.utils;

import java.awt.font.ImageGraphicAttribute;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.thoughtworks.xstream.core.util.Base64Encoder;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class ImageUtils {
	
	public static boolean isImageFile(String fileName)
	{
		String imageFileExt="";
		if(fileName.indexOf(".")>0){
			imageFileExt=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		}else{
			imageFileExt=fileName;
		}
		if("jpg".equalsIgnoreCase(imageFileExt)||"jpeg".equalsIgnoreCase(imageFileExt)
			||"gif".equalsIgnoreCase(imageFileExt)||"png".equalsIgnoreCase(imageFileExt)	){
			
			return true;
		}
		
		return false;
	}
	
	public static BufferedImage decodeImage(String imageString){
		BufferedImage image=null;
		
		byte[] imageByte;
		try {
			BASE64Decoder decoder=new BASE64Decoder();
			imageByte=decoder.decodeBuffer(imageString);
			ByteArrayInputStream bis=new ByteArrayInputStream(imageByte);
			image =ImageIO.read(bis);
			bis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return image;
	}
	
	public static String encodeToString(File image, String type)
	{
		BufferedImage originalImage=null;
		try {
			originalImage=ImageIO.read(image);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encodeToString(image, type);
	}
	
	public static String encodeToString(BufferedImage image, String type)
	{
		String imageString=null;
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		try {
			ImageIO.write(image, type, bos);
			byte[] imageByte=bos.toByteArray();
			
			Base64Encoder encoder=new Base64Encoder();
			imageString=encoder.encode(imageByte);
			bos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageString;
	}
}
