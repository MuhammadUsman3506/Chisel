import chisel3._
import chisel3.iotesters._
import chisel3.util._

object Main extends App {
  println("[{(Running test bench)}]")
  chisel3.iotesters.Driver(() => new UpDownCounter(10)) { x =>
    new UpDownCounterTester(x)
  }
  chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new UpDownCounter(10)) { x =>
    new UpDownCounterTester(x)
  }
}

class UpDownCounterTester(c: UpDownCounter) extends PeekPokeTester(c) {
  poke(c.io.up, true)
  poke(c.io.down, false)
  step(1)
  expect(c.io.out, 1)

  poke(c.io.up, true)
  poke(c.io.down, false)
  step(1)
  expect(c.io.out, 2)
  poke(c.io.up, true)
  poke(c.io.down, false)
  step(1)
  expect(c.io.out, 3)
  poke(c.io.up, true)
  poke(c.io.down, false)
  step(1)
  expect(c.io.out, 4)
  poke(c.io.up, true)
  poke(c.io.down, false)
  step(1)
  expect(c.io.out, 5)
  poke(c.io.up, true)
  poke(c.io.down, false)
  step(1)
  expect(c.io.out, 6)
  poke(c.io.up, false)
  poke(c.io.down, true)
  step(1)
  expect(c.io.out, 5)
  poke(c.io.up, false)
  poke(c.io.down, true)
  step(1)
  expect(c.io.out, 4)
  poke(c.io.up, false)
  poke(c.io.down, true)
  step(1)
  expect(c.io.out, 3)
  poke(c.io.up, false)
  poke(c.io.down, true)
  step(1)
  expect(c.io.out, 2)

}