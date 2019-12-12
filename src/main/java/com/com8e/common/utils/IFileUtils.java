package com.com8e.common.utils;

public class IFileUtils {
	public static String fancySize(long size) {
		if (size < 1024) {
			return size + "Byte";
		} else if (size < (1024 * 1024)) {
			String num = String.format("%.1f", (size / 1024.0));

			return num + "Kb";
		} else if (size < (1024 * 1024 * 1024)) {
			String num = String.format("%.1f", (size / (1024.0 * 1024)));

			return num + "Mb";
		} else {
			String num = String.format("%.1f", (size / (1024.0 * 1024 * 1024)));

			return num + "Gb";
		}

	}
}
