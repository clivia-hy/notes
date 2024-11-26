## 1、基本概述
### 1.1、PAT
```text
    Process Analysis Toolkit（PAT）是一个自包含的框架，用来支持并发、实时系统和其他可能领域的组合、模拟和推理。它提供了用户友好的界面，特色的模型编辑器和动画模拟器。最重要的是，PAT实现了各种模型检查技术，以满足不同的属性，如死锁、离散度、可达性、具有公平性假设的LTL属性、细化检查和概率模型检查。为了获得良好的性能，在PAT中实现了先进的优化技术。
    PAT 工具支持许多模型的分析，包括：
    * CSP       (Communicating Sequential Programs) 
    * RTS       (Real-Time System)
    * PCSP      (Probability CSP)
    * PRTS      (Probability RTS)
    * LTS       (Labeled Transition System)
    * TA        (Timed Automata )
    * NesC      
    * Orc
    * MDL       
    * WS        (Web Service)
    * Security 
```

### 1.2、CSP#
```text
    CSP#（发音为“CSPsharp”，通信顺序程序的缩写），它结合了高级建模操作符，如（条件或非确定性）选择、中断、（字母顺序）并行组合、交错、隐藏、异步消息传递通道等，以及程序员青睐的低级构造，如变量、数组、其他等等。它为如何为系统建模提供了很大的灵活性。例如，进程之间的通信既可以基于共享内存（使用全局变量），也可以基于消息传递（使用异步消息传递或csp风格的多方屏障同步）。高级运算符是基于经典的过程代数通信顺序过程（CSP）。我们对CSP#的设计原则是最大限度地保持原始CSP作为CSP#的子语言，同时提供到数据状态和可执行数据操作的连接。
```
### 1.3、CSP
```text
    CSP（Communication Sequential Processes）是由C.A.R. Hoare提出的并发编程模型，旨在描述和设计异步并行系统。该理论提供了一种形式化的方法来理解和分析并发程序的行为，强调通过通信来协调不同进程间的操作。
```

