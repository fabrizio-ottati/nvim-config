// MLIR sample
module @greet {
  func.func @main(%arg0: i32) -> i32 {
    %0 = arith.constant 0 : i32
    // Add two values
    %1 = arith.addi %arg0, %0 : i32
    return %1 : i32
  }
}
