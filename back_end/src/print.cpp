#include "print.h"
#include "operators.h"

Error print_funcs (const Functions* funcs, FILE* file)
{
    if (!file)
        RETURN_ERROR(NULL_POINTER, "Null pointer of file");
    if (!funcs)
        RETURN_ERROR(NULL_POINTER, "Null pointer of funcs");

    Error error = {};
    IfWhileId if_while_id = {};

    error = print_header (file);
    PARSE_ERROR_WITHOUT_TREE(error);

    for (size_t i = 0; i < funcs->num_funcs; i++)
    {
        error = print_func_decl (funcs->funcs[i], &if_while_id, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        fprintf (file, "\n");
    }
    
    RETURN_ERROR(CORRECT, "");
}

Error print_header (FILE* file)
{
    if (!file)
        RETURN_ERROR(NULL_POINTER, "Null pointer of file");

    fprintf (file,  LLVM_HEADER);

    RETURN_ERROR(CORRECT, "");
}

Error print_func_decl (Function* func, IfWhileId* if_while_id, FILE* file)
{
    if (!file)
        RETURN_ERROR(NULL_POINTER, "Null pointer of file");
    if (!func)
        RETURN_ERROR(NULL_POINTER, "Null pointer of func");
    
    func->curr_var_id = 0;
    Error error = {};

    if (strcmp (func->root->name, "main") == 0)
        fprintf (file, "%s%s(", LLVM_MAIN_HEADER, func->root->name);
    else
        fprintf (file, "%s%s(", LLVM_FUNC_HEADER, func->root->name);

    if (func->root->left)
    {
        error = print_args (func->root->left, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
    }

    fprintf (file, ") #1\n{\n");

    error = print_commands (func->root->right, if_while_id, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    fprintf (file, "}\n\n");

    RETURN_ERROR(CORRECT, "");
}

Error print_args (const Node* node, Function* func, FILE* file)
{
    if (!file)
        RETURN_ERROR(NULL_POINTER, "Null pointer of file");
    if (!func)
        RETURN_ERROR(NULL_POINTER, "Null pointer of func");
    if (!node)
        RETURN_ERROR(NULL_POINTER, "Null pointer of node");

    fprintf (file, "double noundef %%%s", node->left->name);

    if (node->right)
    {
        fprintf (file, ", ");
        Error error = print_args (node->right, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
    }

    RETURN_ERROR(CORRECT, "");
}

Error print_commands (const Node* node, IfWhileId* if_while_id, Function* func, FILE* file)
{
    if (!node)
        RETURN_ERROR(CORRECT, "");

    Error error = {};
    bool is_print = false;
    if (node->type == OPER)
    {
        if ((int) node->value == END_STR)
        {
            error = print_commands (node->left, if_while_id, func, file);
            PARSE_ERROR_WITHOUT_TREE(error);

            error = print_commands (node->right, if_while_id, func, file);
            PARSE_ERROR_WITHOUT_TREE(error);

            RETURN_ERROR(CORRECT, "");
        }

        error = print_input_output_return (node, &is_print, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        if (is_print)
            RETURN_ERROR(CORRECT, "");

        error = print_assign (node, &is_print, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        if (is_print)
            RETURN_ERROR(CORRECT, "");

        error = print_if (node, if_while_id, &is_print, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        if (is_print)
            RETURN_ERROR(CORRECT, "");

        error = print_while (node, if_while_id, &is_print, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        if (is_print)
            RETURN_ERROR(CORRECT, "");
    }

    RETURN_ERROR(SYNTAX_ERR, "Unknown operator");
}

Error print_input_output_return (const Node* node, bool* is_print, Function* func, FILE* file)
{
    *is_print = false;

    if ((int) node->value == INPUT_VAR)
    {
        fprintf (file, "%%%d = ", func->curr_var_id);
        fprintf (file, LLVM_CALL_SCANF, node->right->name);
        func->curr_var_id++;
        *is_print = true;
    }

    if ((int) node->value == PRINT)
    {
        fprintf (file, "%%%d = ", func->curr_var_id);
        fprintf (file, LLVM_CALL_PRINTF, node->right->name);
        func->curr_var_id++;
        *is_print = true;
    }

    if ((int) node->value == RET)
    {
        fprintf (file, "ret double %%%s\n", node->right->name);
        *is_print = true;
    }

    RETURN_ERROR(CORRECT, "");
}

Error print_assign (const Node* node, bool* is_print, Function* func, FILE* file)
{
    if ((int) node->value != ASSIGN)
    {
        *is_print = false;
        RETURN_ERROR(CORRECT, "");
    }

    *is_print = true;
    Error error = {};

    error = print_expression (node->left, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    error = print_store_var (node->right->name, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    RETURN_ERROR(CORRECT, "");
}

Error print_expression (const Node* node, Function* func, FILE* file)
{
    if (!node)
        RETURN_ERROR(CORRECT, "");

    Error error = {};
    if (node->type == VAR)
    {
        fprintf (file, "push [%d]\n", (int) node->value);
        RETURN_ERROR(CORRECT, "");
    }
    else if (node->type == NUM)
    {
        fprintf (file, "push %lg\n", node->value);
        RETURN_ERROR(CORRECT, "");
    }
    else if (node->type == FUNC)
    {
        error = print_func_call (node, func, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        RETURN_ERROR(CORRECT, "");
    }

    error = print_expression (node->left, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);
    error = print_expression (node->right, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);


    for (size_t i = 0; i < NUM_OPERS; i++)
        if ((int) node->value == OPERATORS[i].id)
        {
            if (OPERATORS[i].name_to_print_asm)
                fprintf (file, "%s\n", OPERATORS[i].name_to_print_asm);
            else
                RETURN_ERROR(SYNTAX_ERR, "Assembler don't know this operator");
        }

    RETURN_ERROR(CORRECT, "");
}

Error print_func_call (const Node* node, Function* func, FILE* file)
{
    Error error = {};

    fprintf (file, "%%%d = call noundef double @%s(", func->curr_var_id, node->name);

    error = print_args_call (node->left, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    fprintf (file, ")\n");

    func->curr_var_id++;

    RETURN_ERROR(CORRECT, "");
}

Error print_args_call (const Node* node, FILE* file)
{
    Error error = {};

    if (node->right)
    {
        fprintf (file, "double noundef %%%s, ", node->left->name);
        error = print_args_call (node->right, file);
        PARSE_ERROR_WITHOUT_TREE(error);
        RETURN_ERROR(CORRECT, "");
    }
    else
    {
        fprintf (file, "double noundef %%%s", node->left->name);
        RETURN_ERROR(CORRECT, "");
    }
}

Error print_if (const Node* node, IfWhileId* if_while_id, bool* is_print, Function* func, FILE* file)
{
    if ((int) node->value != IF)
    {
        *is_print = false;
        RETURN_ERROR(CORRECT, "");
    }

    *is_print = true;
    Error error = {};

    error = print_expression (node->left->left, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    error = print_expression (node->left->right, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    for (size_t i = 0; i < NUM_OPERS; i++)
        if ((int) node->left->value == OPERATORS[i].id)
            fprintf (file, "%s ", OPERATORS[i].name_to_print_asm);

    size_t if_id = if_while_id->num_if;
    if_while_id->num_if++;
    fprintf (file, "if%lld\n", if_id);

    error = print_commands (node->right, if_while_id, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    fprintf (file, ":if%lld\n", if_id);
    RETURN_ERROR(CORRECT, "");
}

Error print_while (const Node* node, IfWhileId* if_while_id, bool* is_print, Function* func, FILE* file)
{
    if ((int) node->value != WHILE)
    {
        *is_print = false;
        RETURN_ERROR(CORRECT, "");
    }

    *is_print = true;
    Error error = {};
    size_t while_id = if_while_id->num_while;
    if_while_id->num_while++;

    fprintf (file, ":while%lld\n", while_id);

    error = print_expression (node->left->left, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    error = print_expression (node->left->right, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    for (size_t i = 0; i < NUM_OPERS; i++)
        if ((int) node->left->value == OPERATORS[i].id)
            fprintf (file, "%s ", OPERATORS[i].name_to_print_asm);

    fprintf (file, "end_while%lld\n", while_id);

    error = print_commands (node->right, if_while_id, func, file);
    PARSE_ERROR_WITHOUT_TREE(error);

    fprintf (file, "jmp while%lld\n", while_id);
    fprintf (file, ":end_while%lld\n", while_id);
    RETURN_ERROR(CORRECT, "");
}

Error print_store_var (const char* var_name, Function* func, FILE* file)
{
    if (!var_name)
        RETURN_ERROR(NULL_POINTER, "Null pointer of name of var");
    if (!file)
        RETURN_ERROR(NULL_POINTER, "Null pointer of file");

    fprintf (file, "store double %%%d, double* %%%s, allign 8\n", func->curr_var_id - 1, var_name);
    RETURN_ERROR(CORRECT, "");
}