package io.ballerina.lib.pdfbox.utils;

import io.ballerina.runtime.api.creators.ErrorCreator;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BError;

public class Utils {

    public static final String ERROR_TYPE = "Error";

    public static BError getBError(String message, Throwable throwable) {
        BError cause = ErrorCreator.createError(throwable);
        return ErrorCreator.createError(ModuleUtils.getModule(), ERROR_TYPE, StringUtils.fromString(message),
                cause, null);
    }

}
