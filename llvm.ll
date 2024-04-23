declare i32 @__isoc99_scanf(i8* noundef, ...) #0
declare i32 @printf(i8* noundef, ...) #0

attributes #0 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "ffast-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

@.str = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1

define dso_local noundef double @func0(double noundef %var0) #1
{
%var0p = alloca double, align 8
store double %var0, double* %var0p, align 8
%1 = alloca double, align 8
%2 = load double, double* %var0p, align 8
store double %2, double* %1, align 8
%3 = alloca double, align 8
store double 0x4000000000000000, double* %3, align 8
%4 = load double, double* %1, align 8
%5 = load double, double* %3, align 8
%6 = fmul double %4, %5
%7 = alloca double, align 8
store double %6, double* %7, align 8
%var1p = alloca double, align 8
%8 = load double, double* %7, align 8
store double %8, double* %var1p, align 8
%9 = alloca double, align 8
store double 0x3FF8000000000000, double* %9, align 8
%var2p = alloca double, align 8
%10 = load double, double* %9, align 8
store double %10, double* %var2p, align 8
%11 = alloca double, align 8
%12 = load double, double* %var1p, align 8
store double %12, double* %11, align 8
%13 = alloca double, align 8
%14 = load double, double* %var2p, align 8
store double %14, double* %13, align 8
%15 = load double, double* %11, align 8
%16 = load double, double* %13, align 8
%17 = fadd double %15, %16
%18 = alloca double, align 8
store double %17, double* %18, align 8
%19 = load double, double* %18, align 8
store double %19, double* %var1p, align 8
%20 = load double, double* %var1p, align 8
ret double %20
}

define dso_local noundef double @func1(double noundef %var0) #1
{
%var0p = alloca double, align 8
store double %var0, double* %var0p, align 8
%1 = alloca double, align 8
store double 0x4008000000000000, double* %1, align 8
%2 = alloca double, align 8
%3 = load double, double* %var0p, align 8
store double %3, double* %2, align 8
%4 = alloca double, align 8
store double 0x4000000000000000, double* %4, align 8
%5 = load double, double* %2, align 8
%6 = load double, double* %4, align 8
%7 = fadd double %5, %6
%8 = alloca double, align 8
store double %7, double* %8, align 8
%9 = load double, double* %1, align 8
%10 = load double, double* %8, align 8
%11 = fmul double %9, %10
%12 = alloca double, align 8
store double %11, double* %12, align 8
%var1p = alloca double, align 8
%13 = load double, double* %12, align 8
store double %13, double* %var1p, align 8
%14 = alloca double, align 8
%15 = load double, double* %var1p, align 8
store double %15, double* %14, align 8
%16 = alloca double, align 8
store double 0x4008000000000000, double* %16, align 8
%17 = load double, double* %14, align 8
%18 = load double, double* %16, align 8
%19 = fdiv double %17, %18
%20 = alloca double, align 8
store double %19, double* %20, align 8
%21 = alloca double, align 8
store double 0x4022000000000000, double* %21, align 8
%22 = load double, double* %20, align 8
%23 = load double, double* %21, align 8
%24 = fadd double %22, %23
%25 = alloca double, align 8
store double %24, double* %25, align 8
%var2p = alloca double, align 8
%26 = load double, double* %25, align 8
store double %26, double* %var2p, align 8
%27 = alloca double, align 8
%28 = load double, double* %var1p, align 8
store double %28, double* %27, align 8
%29 = alloca double, align 8
%30 = load double, double* %var2p, align 8
store double %30, double* %29, align 8
%31 = load double, double* %27, align 8
%32 = load double, double* %29, align 8
%33 = fmul double %31, %32
%34 = alloca double, align 8
store double %33, double* %34, align 8
%var3p = alloca double, align 8
%35 = load double, double* %34, align 8
store double %35, double* %var3p, align 8
%36 = load double, double* %var2p, align 8
ret double %36
}

define dso_local noundef i32 @main() #1
{
%var0p = alloca double, align 8
%1 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double* noundef %var0p)
%2 = load double, double* %var0p, align 8
%3 = call noundef double @func0(double noundef %2)
%4 = alloca double, align 8
store double %3, double* %4, align 8
%var1p = alloca double, align 8
%5 = load double, double* %4, align 8
store double %5, double* %var1p, align 8
%6 = load double, double* %var1p, align 8
%7 = call noundef double @func1(double noundef %6)
%8 = alloca double, align 8
store double %7, double* %8, align 8
%var2p = alloca double, align 8
%9 = load double, double* %8, align 8
store double %9, double* %var2p, align 8
%10 = load double, double* %var2p, align 8
%11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), double noundef %10)
ret i32 0
}

