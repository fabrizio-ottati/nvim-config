// LSP test: clangd (mlir)
module @test {
  func.func @add(%a: i32, %b: i32) -> i32 {
    %result = arith.addi %a, %b : i32
    return %result : i32
  }
}
