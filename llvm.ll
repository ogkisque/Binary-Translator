declare i32 @__isoc99_scanf(i8* noundef, ...)
declare i32 @printf(i8* noundef, ...)

@.str = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1

define dso_local double @func0(double %var0)
{
%var0p = alloca double, align 8
store double %var0, double* %var0p, align 8
%1 = alloca double, align 8
store double 0x3FF0000000000000, double* %1, align 8
%var1p = alloca double, align 8
%2 = load double, double* %1, align 8
store double %2, double* %var1p, align 8
br label %while0
while0:
%3 = alloca double, align 8
%4 = load double, double* %var0p, align 8
store double %4, double* %3, align 8
%5 = alloca double, align 8
store double 0x3FF0000000000000, double* %5, align 8
%6 = load double, double* %3, align 8
%7 = load double, double* %5, align 8
%8 = fcmp ogt double %6, %7
br i1 %8, label %body_while0, label %end_while0
body_while0:
%9 = alloca double, align 8
%10 = load double, double* %var1p, align 8
store double %10, double* %9, align 8
%11 = alloca double, align 8
%12 = load double, double* %var0p, align 8
store double %12, double* %11, align 8
%13 = load double, double* %9, align 8
%14 = load double, double* %11, align 8
%15 = fmul double %13, %14
%16 = alloca double, align 8
store double %15, double* %16, align 8
%17 = load double, double* %16, align 8
store double %17, double* %var1p, align 8
%18 = alloca double, align 8
%19 = load double, double* %var0p, align 8
store double %19, double* %18, align 8
%20 = alloca double, align 8
store double 0x3FF0000000000000, double* %20, align 8
%21 = load double, double* %18, align 8
%22 = load double, double* %20, align 8
%23 = fsub double %21, %22
%24 = alloca double, align 8
store double %23, double* %24, align 8
%25 = load double, double* %24, align 8
store double %25, double* %var0p, align 8
br label %while0
end_while0:
%26 = load double, double* %var1p, align 8
ret double %26
}

define dso_local i32 @main()
{
%var0p = alloca double, align 8
%1 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double* noundef %var0p)
%2 = load double, double* %var0p, align 8
%3 = call double @func0(double noundef %2)
%4 = alloca double, align 8
store double %3, double* %4, align 8
%var1p = alloca double, align 8
%5 = load double, double* %4, align 8
store double %5, double* %var1p, align 8
%6 = load double, double* %var1p, align 8
%7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), double noundef %6)
ret i32 0
}

