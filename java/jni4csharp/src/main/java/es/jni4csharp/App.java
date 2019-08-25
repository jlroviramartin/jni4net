package es.jni4csharp;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.DefaultObjectWrapperBuilder;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

public class App {
    public static void main(String[] args) throws Exception {
        Configuration cfg = ConfigFreeMarker();

        // https://freemarker.apache.org/docs/pgui_datamodel_objectWrapper.html#pgui_datamodel_defaultObjectWrapper
        // https://stackoverflow.com/a/51617690/7778826
        DefaultObjectWrapper wrapper = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_29).build();

        // The model
        JniModel model = new JniModel(new Class<?>[] {
                Object.class,
                Class.class,
                Field.class,
                Member.class,
        });

        Template temp = cfg.getTemplate("class_interface_enum.ftlh");
        Writer out = new OutputStreamWriter(System.out);
        for (JniClass<?> clazz : model.getClasses()) {
            Map<String, Object> root = new HashMap<>();
            root.put("model", clazz);
            root.put("staticModels", wrapper.getStaticModels());

            temp.process(root, out);
        }
    }

    private static Configuration ConfigFreeMarker() throws IOException {
        // Create your Configuration instance, and specify if up to what FreeMarker
        // version (here 2.3.29) do you want to apply the fixes that are not 100%
        // backward-compatible. See the Configuration JavaDoc for details.
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_29);

        // System.out.println(new File("/templates").getAbsolutePath());
        // System.out.println(App.class.getResource("/templates").getFile());

        // Specify the source where the template files come from. Here I set a
        // plain directory for it, but non-file-system sources are possible too:
        cfg.setDirectoryForTemplateLoading(new File(App.class.getResource("/templates").getFile()));

        // From here we will set the settings recommended for new projects. These
        // aren't the defaults for backward compatibilty.

        // Set the preferred charset template files are stored in. UTF-8 is
        // a good choice in most applications:
        cfg.setDefaultEncoding("UTF-8");

        // Sets how errors will appear.
        // During web page *development* TemplateExceptionHandler.HTML_DEBUG_HANDLER is
        // better.
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

        // Don't log exceptions inside FreeMarker that it will thrown at you anyway:
        cfg.setLogTemplateExceptions(false);

        // Wrap unchecked exceptions thrown during template processing into
        // TemplateException-s:
        cfg.setWrapUncheckedExceptions(true);

        // Do not fall back to higher scopes when reading a null loop variable:
        cfg.setFallbackOnNullLoopVariable(false);

        return cfg;
    }
}
