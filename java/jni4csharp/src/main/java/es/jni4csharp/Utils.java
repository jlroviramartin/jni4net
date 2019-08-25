package es.jni4csharp;

import java.util.Arrays;

public class Utils {
    public static <T> T[] cat(T[] array, T last) {
        T[] ret = Arrays.copyOf(array, array.length + 1);
        ret[ret.length - 1] = last;
        return ret;
    }

    public static <T> T[] cat(T first, T[] array) {
        T[] ret = Arrays.copyOf(array, array.length + 1);
        System.arraycopy(ret, 0, ret, 1, array.length);
        ret[0] = first;
        return ret;
    }
}
