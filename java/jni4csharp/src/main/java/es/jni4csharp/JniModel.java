package es.jni4csharp;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import lombok.Getter;
import lombok.Setter;

import static java.util.Arrays.stream;

public class JniModel {
    private final Set<Class<?>> classes;

    public JniModel(Class<?>[] classes) {
        this.classes = stream(classes).collect(Collectors.toSet());

        this.classFilter = this::defaultClassFilter;
        this.methodFilter = this::defaultMethodFilter;
        this.fieldFilter = this::defaultFieldFilter;
    }

    @Getter
    @Setter
    private Predicate<Class<?>> classFilter;

    @Getter
    @Setter
    private Predicate<Method> methodFilter;

    @Getter
    @Setter
    private Predicate<Field> fieldFilter;

    public JniClass<?>[] getClasses() {
        return classes
                .stream()
                .map(clazz -> new JniClass<>(clazz, classFilter, methodFilter, fieldFilter))
                .toArray(sz -> new JniClass<?>[sz]);
    }

    private boolean defaultClassFilter(Class<?> clazz) {
        return classes.contains(clazz);
    }

    private boolean defaultMethodFilter(Method method) {
        return (method.getReturnType().equals(Void.class) || classFilter.test(method.getReturnType()))
                && stream(method.getParameterTypes()).allMatch(classFilter);
    }

    private boolean defaultFieldFilter(Field field) {
        return classFilter.test(field.getType());
    }
}
