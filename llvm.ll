declare i32 @__isoc99_scanf(i8* noundef, ...) #0
declare i32 @printf(i8* noundef, ...) #0

attributes #0 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "ffast-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

@.str = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1

define dso_local noundef i32 @main() #1
{
%var0p = alloca double, align 8
%1 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double* noundef %var0p)
%2 = alloca double, align 8
store double 0x3FF0000000000000, double* %2, align 8
%var1p = alloca double, align 8
%3 = load double, double* %2, align 8
store double %3, double* %var1p, align 8
br label %while0
while0:
%4 = alloca double, align 8
%5 = load double, double* %var0p, align 8
store double %5, double* %4, align 8
%6 = alloca double, align 8
store double 0x3FF0000000000000, double* %6, align 8
%7 = load double, double* %4, align 8
%8 = load double, double* %6, align 8
%9 = fcmp ogt double %7, %8
br i1 %9, label %body_while0, label %end_while0
body_while0:
%10 = alloca double, align 8
%11 = load double, double* %var1p, align 8
store double %11, double* %10, align 8
%12 = alloca double, align 8
%13 = load double, double* %var0p, align 8
store double %13, double* %12, align 8
%14 = load double, double* %10, align 8
%15 = load double, double* %12, align 8
%16 = fmul double %14, %15
%17 = alloca double, align 8
store double %16, double* %17, align 8
%18 = load double, double* %17, align 8
store double %18, double* %var1p, align 8
%19 = alloca double, align 8
%20 = load double, double* %var0p, align 8
store double %20, double* %19, align 8
%21 = alloca double, align 8
store double 0x3FF0000000000000, double* %21, align 8
%22 = load double, double* %19, align 8
%23 = load double, double* %21, align 8
%24 = fsub double %22, %23
%25 = alloca double, align 8
store double %24, double* %25, align 8
%26 = load double, double* %25, align 8
store double %26, double* %var0p, align 8
br label %while0
end_while0:
%27 = load double, double* %var1p, align 8
%28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), double noundef %27)
ret i32 0
}

