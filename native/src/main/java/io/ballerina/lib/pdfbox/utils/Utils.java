package io.ballerina.lib.pdfbox.utils;

import io.ballerina.runtime.api.creators.ErrorCreator;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BError;

public class Utils {

    public static BError getBError(String message) {
        return ErrorCreator.createError(ModuleUtils.getModule(), Constants.ERROR_TYPE,
                StringUtils.fromString(message), null, null);
    }

}
