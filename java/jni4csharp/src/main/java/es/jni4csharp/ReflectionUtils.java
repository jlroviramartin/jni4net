package es.jni4csharp;

import java.lang.reflect.Member;
import java.lang.reflect.Modifier;

public final class ReflectionUtils {

    /**
     * Gets a string representation of the modifiers of a member.
     * 
     * @param member
     *            Member.
     * @return String representation of the modifiers.
     */
    public static String getModifiers(Member member) {
        int mod = member.getModifiers();
        StringBuilder buff = new StringBuilder();
        if (Modifier.isPublic(mod)) {
            buff.append("public");
        }
        if (Modifier.isStatic(mod)) {
            if (buff.length() > 0) {
                buff.append(" ");
            }
            buff.append("static");
        }
        if (Modifier.isFinal(mod)) {
            if (buff.length() > 0) {
                buff.append(" ");
            }
            buff.append("readonly");
        }
        return buff.toString();
    }

    /**
     * Tests if the {@code member} is declared in the class {@code clazz}.
     * 
     * @param clazz
     *            Class.
     * @param member
     *            Member.
     * @return If is declared.
     */
    public static boolean isDeclaredIn(Class<?> clazz, Member member) {
        return member.getDeclaringClass() == clazz;
    }

    /**
     * Tests if the {@code member} is final.
     * 
     * @param member
     *            Member.
     * @return If is final.
     */
    public static boolean isFinal(Member member) {
        return Modifier.isPublic(member.getModifiers());
    }
}
