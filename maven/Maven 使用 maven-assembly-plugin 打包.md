# Maven 使用 maven-assembly-plugin 打包

## 一、引入插件
```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-assembly-plugin</artifactId>
            <version>3.6.0</version>
            <executions>
                <execution>
                    <id>make-assembly</id>
                    <!-- 绑定到package生命周期 -->
                    <phase>package</phase>
                    <goals>
                        <!-- 只运行一次 -->
                        <goal>single</goal>
                    </goals>
                </execution>
            </executions>
            <configuration>
                <!--这部分可有可无,加上的话则直接生成可运行jar包-->
<!--                <archive>-->
<!--                    <manifest>-->
<!--                        <mainClass>${exec.mainClass}</mainClass>-->
<!--                    </manifest>-->
<!--                <manifestEntries>-->
<!--                    <Class-Path>.</Class-Path>-->
<!--                </manifestEntries>-->
<!--                </archive>-->
                <!-- 配置描述符文件 -->
                <descriptor>src/main/assembly/assembly.xml</descriptor>
                <!-- 也可以使用Maven预配置的描述符 -->
<!--                <descriptorRefs>-->
<!--                    <descriptorRef>jar-with-dependencies</descriptorRef>-->
<!--                </descriptorRefs> -->
            </configuration>
        </plugin>
    </plugins>
</build>
```

## 二、自定义assemble.xml 
```xml
<?xml version='1.0' encoding='UTF-8'?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one
  or more contributor license agreements.  See the NOTICE file
  distributed with this work for additional information
  regarding copyright ownership.  The ASF licenses this file
  to you under the Apache License, Version 2.0 (the
  "License"); you may not use this file except in compliance
  with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied.  See the License for the
  specific language governing permissions and limitations
  under the License.
-->

<!-- START SNIPPET: jar-with-dependencies -->
<assembly xmlns="http://maven.apache.org/ASSEMBLY/2.1.1"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/ASSEMBLY/2.1.1 https://maven.apache.org/xsd/assembly-2.1.1.xsd">
    <!-- TODO: a jarjar format would be better -->
    <id>jar-with-dependencies</id>
    <formats>
        <format>jar</format>
    </formats>
    <includeBaseDirectory>false</includeBaseDirectory>
    <dependencySets>
        <dependencySet>
            <outputDirectory>/</outputDirectory>
            <!-- 是否把本项目添加到依赖文件夹 -->
            <useProjectArtifact>false</useProjectArtifact>
            <excludes>
                <!-- 要排除的包名, 格式为：groupId:artifactId -->
                <exclude>xxx:cccc</exclude>
            </excludes>
            <!-- 依赖的第三方jar 是否解压, 大部分第三方jar可以解压，但需要签名的jar不能解压-->
            <unpack>false</unpack>
            <scope>runtime</scope>
        </dependencySet>
    </dependencySets>

    <fileSets>
        <fileSet>
            <directory>${project.build.outputDirectory}</directory>
            <outputDirectory>/</outputDirectory>
            <includes>
                <include>*.dll</include>
            </includes>
        </fileSet>
    </fileSets>
</assembly>
```