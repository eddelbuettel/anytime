#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP anytime_addFormats(SEXP);
extern SEXP anytime_anytime_cpp(SEXP, SEXP, SEXP, SEXP);
extern SEXP anytime_r_anytime_cpp(SEXP, SEXP, SEXP, SEXP);
extern SEXP anytime_format(SEXP);
extern SEXP anytime_getFormats();
extern SEXP anytime_setDebug(SEXP);
extern SEXP anytime_setInitialTZ(SEXP);
extern SEXP anytime_setMaxIntAsDate(SEXP);
extern SEXP anytime_setMaxIntAsYYYYMMDD(SEXP);
extern SEXP anytime_testFormat_impl(SEXP, SEXP, SEXP);
extern SEXP anytime_testOutput_impl(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"anytime_addFormats",          (DL_FUNC) &anytime_addFormats,          1},
    {"anytime_anytime_cpp",         (DL_FUNC) &anytime_anytime_cpp,         4},
    {"anytime_r_anytime_cpp",       (DL_FUNC) &anytime_r_anytime_cpp,       4},
    {"anytime_format",              (DL_FUNC) &anytime_format,              1},
    {"anytime_getFormats",          (DL_FUNC) &anytime_getFormats,          0},
    {"anytime_setDebug",            (DL_FUNC) &anytime_setDebug,            1},
    {"anytime_setInitialTZ",        (DL_FUNC) &anytime_setInitialTZ,        1},
    {"anytime_setMaxIntAsDate",     (DL_FUNC) &anytime_setMaxIntAsDate,     1},
    {"anytime_setMaxIntAsYYYYMMDD", (DL_FUNC) &anytime_setMaxIntAsYYYYMMDD, 1},
    {"anytime_testFormat_impl",     (DL_FUNC) &anytime_testFormat_impl,     3},
    {"anytime_testOutput_impl",     (DL_FUNC) &anytime_testOutput_impl,     2},
    {NULL, NULL, 0}
};

void R_init_anytime(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
