#ifndef PRINT_HEADER
#define PRINT_HEADER

#include <stdio.h>

#include "tree.h"
#include "error.h"

const char* const LLVM_HEADER =      "declare i32 @__isoc99_scanf(i8* noundef, ...) #0\n"
                                     "declare i32 @printf(i8* noundef, ...) #0\n\n"
                                     "attributes #0 = { \"frame-pointer\"=\"all\" \"no-trapping-math\"=\"true\" \"stack-protector-buffer-size\"=\"8\" \"target-cpu\"=\"x86-64\" \"target-features\"=\"+cx8,+fxsr,+mmx,+sse,+sse2,+x87\" \"tune-cpu\"=\"generic\" }\n"
                                     "attributes #1 = { mustprogress noinline nounwind optnone uwtable \"frame-pointer\"=\"all\" \"min-legal-vector-width\"=\"0\" \"ffast-math\"=\"true\" \"stack-protector-buffer-size\"=\"8\" \"target-cpu\"=\"x86-64\" \"target-features\"=\"+cx8,+fxsr,+mmx,+sse,+sse2,+x87\" \"tune-cpu\"=\"generic\" }\n\n"
                                     "@.str = private unnamed_addr constant [4 x i8] c\"%%lf\\00\", align 1\n"
                                     "@.str.1 = private unnamed_addr constant [5 x i8] c\"%%lf\\0A\\00\", align 1\n\n";
const char* const LLVM_FUNC_HEADER = "define dso_local noundef double @";
const char* const LLVM_MAIN_HEADER = "define dso_local noundef i32 @";
const char* const LLVM_CALL_SCANF  = "call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double* noundef %%%s)\n";
const char* const LLVM_CALL_PRINTF = "call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), double noundef %%%s)\n";

Error print_funcs                   (const Functions* funcs, FILE* file);
Error print_header                  (FILE* file);
Error print_func_decl               (Function* func, IfWhileId* if_while_id, FILE* file);
Error print_args                    (const Node* node, Function* func, FILE* file);
Error print_commands                (const Node* node, IfWhileId* if_while_id, Function* func, FILE* file);
Error print_input_output_return     (const Node* node, bool* is_print, Function* func, FILE* file);
Error print_assign                  (const Node* node, bool* is_print, Function* func, FILE* file);
Error print_expression              (const Node* node, Function* func, FILE* file);
Error print_func_call               (const Node* node, Function* func, FILE* file);
Error print_args_call               (const Node* node, FILE* file);
Error print_if                      (const Node* node, IfWhileId* if_while_id, bool* is_print, Function* func, FILE* file);
Error print_while                   (const Node* node, IfWhileId* if_while_id, bool* is_print, Function* func, FILE* file);
Error print_store_var               (const char* var_name, Function* func, FILE* file);

#endif //PRINT_HEADER
