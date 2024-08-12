# Maven 使用 maven-jar-plugin 打包

## 一、使用方式
```xml
<plugin>
	<groupId>org.apache.maven.plugins</groupId>
	<artifactId>maven-jar-plugin</artifactId>
	<version>3.3.0</version>
</plugin>

这里的版本号是可选的，如果不配置版本号，maven会自动去寻找最新的版本。
```
## 二、打包无依赖的可执行jar
```xml
<build>
	<plugins>
		<plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jar-plugin</artifactId>
            <version>3.3.0</version>
            <configuration>
                <archive>
                    <manifest>
                    	<!--主类入口-->
                        <mainClass>com.example.test.TestController</mainClass>
                    </manifest>
                </archive>
            </configuration>
        </plugin>
	</plugins>
</build>
```
打包后生成一个可执行jar, 后续可通过 java -jar 运行


## 三、打包有依赖的可执行jar
```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jar-plugin</artifactId>
            <version>3.3.0</version>
            <configuration>
                <archive>
                    <manifest>
                        <!--主类入口-->
                        <mainClass>com.viewsources.dptest.Main</mainClass>
                        <!--将项目的依赖信息添加到 MANIFEST.MF 中的Class-Path-->
                        <addClasspath>true</addClasspath>
                        <!--将依赖的存放位置添加到 MANIFEST.MF 中-->
                        <classpathPrefix>lib/</classpathPrefix>
                        <!--是否使用唯一的时间戳快照版本而不是-SNAPSHOT版本。默认值为true-->
                        <useUniqueVersions>false</useUniqueVersions>
                    </manifest>
                </archive>
            </configuration>
        </plugin>
        <!-- maven-dependency-plugin 用于自动下载依赖的jar包，若不配置虽然MANIFEST.MF中有依赖信息，但运行会缺少依赖包-->
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-dependency-plugin</artifactId>
            <version>3.6.0</version>
            <!--执行配置-->
            <executions>
                <execution>
                    <!--名字任意；多个自定义execution时，需要不用名称 -->
                    <id>copy-dependencies-runtime</id>
                    <phase>package</phase>
                    <goals>
                        <!--执行目标；对依赖进行的操作，具体可以看官方文档-->
                        <goal>copy-dependencies</goal>
                    </goals>
                    <configuration>
                        <!--目标输出位置-->
                        <outputDirectory>${project.build.directory}/lib</outputDirectory>
                        <!--添加依赖范围 https://maven.apache.org/plugins/maven-dependency-plugin/copy-dependencies-mojo.html-->
                        <includeScope>runtime</includeScope>
                        <!--依赖传递-->
                        <excludeTransitive>false</excludeTransitive>
                    </configuration>
                </execution>
                <execution>
                    <id>copy-dependencies-system</id>
                    <phase>package</phase>
                    <goals>
                        <goal>copy-dependencies</goal>
                    </goals>
                    <configuration>
                        <outputDirectory>${project.build.directory}/lib</outputDirectory>
                        <includeScope>system</includeScope>
                        <excludeTransitive>true</excludeTransitive>
                    </configuration>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```
打包后，会生成一个可执行JAR包，和一个 lib 文件夹，lib文件内存放依赖的第三方jar包，使用是需要把lib文件夹和可执行jar一起使用


### 注：
通过maven-jar-plugin方式打包成可执行jar文件，但是这种方式会将所有依赖（包括外部依赖）单独打包到另外一个指定文件夹下，需要通过指定Class-Path的方式关联