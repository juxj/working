package com.zj198.action.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

/**
 * 验证码
 * 生成验证码图片，保存验证码至Session
 * @author Patrick
 *
 */
public class CaptchaAction {
	private ByteArrayInputStream inputImage;
	private static final Font[] VERIFICATION_FONT = {
		new Font("Arial", Font.BOLD, 24),
		new Font("Times New Roman", Font.ITALIC, 24),
		new Font("Arial", Font.ITALIC, 36),
		new Font("Times New Roman", Font.BOLD, 38),
		new Font("Times New Roman", Font.ITALIC, 36),
		new Font("Arial", Font.ITALIC, 28),
		new Font("Times New Roman", Font.BOLD, 28),
		new Font("Times New Roman", Font.ITALIC, 26),
		new Font("Times New Roman", Font.BOLD, 20)
		};
	
	public String execute() throws IOException {
		int width = 120, height = 40;
		//创建图象
		BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
		Graphics gra = image.getGraphics();
		Random random = new Random();
        //背景
//		gra.setColor(getRandColor(200, 250));
		gra.fillRect(0, 0, width, height);
        //字体
		gra.setColor(Color.black);
//		gra.setFont(VERIFICATION_FONT);
		//边框
//		gra.setColor(new Color(0));
//		gra.drawRect(0,0,width-1,height-1);
		// 随机产生60条干扰线
		gra.setColor(getRandColor(120, 160));
		for (int i = 0; i < 40; i++){
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(30);
			int yl = random.nextInt(30);
			gra.drawLine(x, y, x + xl, y + yl);
		}
		//可用字符(26个小写字母除去o,l,z,10个数字除 0,1,2)
		char c[] = {'a','b','c','d','e','f','g','h','i','j','k','m','n','p','q','r','s','t','u','v','w','x','y','3','4','5','6','7','8','9'};
//		char c[] = {'a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a'};
		StringBuilder sRand = new StringBuilder();
		for (int i = 0; i < 4; i++){
			int index = random.nextInt(30);
			String rand = String.valueOf(c[index]);
			sRand.append(rand);
			gra.setColor(new Color(random.nextInt(160), random.nextInt(180), random.nextInt(250)));
			gra.setFont(VERIFICATION_FONT[random.nextInt(8)]);
			gra.drawString(rand, 28 * i + 8, 22 + random.nextInt(15));
		}
		gra.dispose();

		ActionContext ctx = ActionContext.getContext();
		ctx.getSession().put("_vcode", sRand.toString());

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        ImageOutputStream imageOut = ImageIO.createImageOutputStream(output);
        ImageIO.write(image, "JPEG", imageOut);
        imageOut.close();
        inputImage = new ByteArrayInputStream(output.toByteArray());
        return Action.SUCCESS;
	}
	
	private Color getRandColor(int fc, int bc){
		Random random = new Random();
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	public ByteArrayInputStream getInputImage() {
		return inputImage;
	}
		
}
