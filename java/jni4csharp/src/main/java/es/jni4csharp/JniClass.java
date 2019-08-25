package es.jni4csharp;

import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.function.Predicate;

import lombok.Getter;

import static java.util.stream.Stream.concat;
import static java.util.Arrays.stream;

public class JniClass<T> {
    @Getter
    private final Class<T> clazz;
    private final Predicate<Class<?>> classFilter;
    private final Predicate<Method> methodFilter;
    private final Predicate<Field> fieldFilter;

    public JniClass(Class<T> clazz,
            Predicate<Class<?>> classFilter,
            Predicate<Method> methodFilter,
            Predicate<Field> fieldFilter) {
        this.clazz = clazz;
        this.classFilter = classFilter;
        this.methodFilter = methodFilter;
        this.fieldFilter = fieldFilter;
    }

    public Class<?>[] getExtendsAndImplements() {

        if (clazz.getSuperclass() != null && !clazz.getSuperclass().equals(Object.class)) {
            return concat(
                    stream(new Class<?>[] { clazz.getSuperclass() }),
                    stream(clazz.getInterfaces()))
                            .filter(classFilter)
                            .toArray(sz -> new Class<?>[sz]);
        } else {
            return stream(clazz.getInterfaces())
                    .filter(classFilter)
                    .toArray(sz -> new Class<?>[sz]);
        }
    }

    /**
     * Gets the public and declared methods in this class (not overridden methods).
     * 
     * @return Public and declared methods.
     */
    public Method[] getPublicAndDeclaredMethods() {
        Method[] methods = clazz.getMethods();
        return Arrays.stream(methods)
                .filter(this::isPublicAndDeclaredHere)
                .filter(methodFilter)
                .toArray(sz -> new Method[sz]);
    }

    /**
     * Gets the public and declared fields in this class (not overridden methods).
     * 
     * @return Public and declared fields.
     */
    public Field[] getPublicAndDeclaredFields() {
        Field[] fields = clazz.getFields();
        return Arrays.stream(fields)
                .filter(this::isPublicAndDeclaredHere)
                .filter(fieldFilter)
                .toArray(sz -> new Field[sz]);
    }

    /**
     * Tests if a {@code member} of this class is public and declared in it (it is not overridden).
     * 
     * @param member
     *            Member.
     * @return Is public and not overridden.
     */
    private boolean isPublicAndDeclaredHere(Member member) {
        return Modifier.isPublic(member.getModifiers()) && member.getDeclaringClass() == clazz;
    }
}
