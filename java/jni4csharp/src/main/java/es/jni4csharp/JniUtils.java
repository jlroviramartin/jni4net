package es.jni4csharp;

import java.lang.reflect.Method;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

/**
 * Commodity utility for JNI
 * <p>
 * {@link https://www.codeproject.com/Tips/1129615/JNI-Signature-for-Java-Method}
 */
public final class JniUtils {

    private static final Map<Object, String> PRIMITIVE_SIGNATURES = new HashMap<>();
    static {
        PRIMITIVE_SIGNATURES.put(boolean.class, "Z");
        PRIMITIVE_SIGNATURES.put(char.class, "C");
        PRIMITIVE_SIGNATURES.put(byte.class, "B");
        PRIMITIVE_SIGNATURES.put(short.class, "S");
        PRIMITIVE_SIGNATURES.put(int.class, "I");
        PRIMITIVE_SIGNATURES.put(long.class, "J");
        PRIMITIVE_SIGNATURES.put(float.class, "F");
        PRIMITIVE_SIGNATURES.put(double.class, "D");
        PRIMITIVE_SIGNATURES.put(void.class, "V");
    }

    private JniUtils() {
    }

    public static final String getUniqueName(Method m) {
        return m.getName() + "_" + toHex(getMethodSignature(m));
    }

    public static String toHex(String arg) {
        return String.format("%X", new BigInteger(1, arg.getBytes(/* YOUR_CHARSET? */)));
    }

    /**
     * Build JNI signature for a method
     * 
     * @param m
     * @return
     */
    public static final String getMethodSignature(Method m) {
        final StringBuilder buff = new StringBuilder("(");
        for (final Class<?> p : m.getParameterTypes()) {
            buff.append(getClassSignature(p));
        }
        buff.append(')').append(getClassSignature(m.getReturnType()));
        return buff.toString();
    }

    /**
     * Build JNI signature from a class
     * 
     * @param c
     * @return
     */
    private static String getClassSignature(Class<?> c) {
        if (c.isArray()) {
            final Class<?> ct = c.getComponentType();
            return '[' + getClassSignature(ct);
        } else if (c.isPrimitive()) {
            return PRIMITIVE_SIGNATURES.get(c);
        } else {
            return 'L' + c.getName().replace('.', '/') + ';';
        }
    }
}