declare i32 @__isoc99_scanf(i8* noundef, ...) #0
declare i32 @printf(i8* noundef, ...) #0

attributes #0 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "ffast-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

@.str = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1

define dso_local noundef double @func0(double noundef %var0) #1
{
push [0]
push 2
fmul
store double %-1, double* %var1, allign 8
push 1.5
store double %-1, double* %var2, allign 8
push [1]
push [2]
fadd
store double %-1, double* %var0, allign 8
ret double %var0
}


define dso_local noundef double @func1(double noundef %var0) #1
{
push 3
push [0]
push 2
fadd
fmul
store double %-1, double* %var1, allign 8
push [1]
push 3
fdiv
push 9
fadd
store double %-1, double* %var2, allign 8
push [1]
push [2]
fmul
store double %-1, double* %var0, allign 8
ret double %var0
}


define dso_local noundef i32 @main() #1
{
%0 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double* noundef %var0)
%1 = call noundef double @func0(double noundef %var0)
store double %1, double* %var1, allign 8
%2 = call noundef double @func1(double noundef %var1)
store double %2, double* %var2, allign 8
%3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), double noundef %var2)
}


