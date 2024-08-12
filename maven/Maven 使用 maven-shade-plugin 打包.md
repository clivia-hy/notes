# Maven 使用 maven-shade-plugin 打包

## 一、引入插件
```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-shade-plugin</artifactId>
    <version>3.5.2</version>
    <configuration>
      <!-- put your configurations here -->
    </configuration>
    <executions>
      <execution>
        <phase>package</phase>
        <goals>
          <goal>shade</goal>
        </goals>
      </execution>
    </executions>
</plugin>
```

## 二、设置主类信息
```xml
<configuration>
    <createDependencyReducedPom>false</createDependencyReducedPom>
    <transformers>
        <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
            <manifestEntries>
                <Main-Class>
                    com.viewsources.bmp.core.SdkInstance
                </Main-Class>
            </manifestEntries>
        </transformer>
    </transformers>
</configuration>
```

## 三、 打包时排除部分依赖
```xml
<configuration>
    <!-- 去除不必要的依赖 -->
    <artifactSet>
        <excludes>
            <exclude>org.projectlombok:lombok</exclude>
            <exclude>junit:*</exclude>
        </excludes>
    </artifactSet>
</configuration>
```

## 四、保留某个库中的部分资源
```xml
<configuration>
    <filters>
        <filter>
            <artifact>junit:junit</artifact>
            <includes>
                <include>junit/framework/**</include>
                <include>org/junit/**</include>
            </includes>
            <excludes>
                <exclude>org/junit/experimental/**</exclude>
                <exclude>org/junit/runners/**</exclude>
            </excludes>
        </filter>
    </filters>
</configuration>
```

## 五、重命名依赖包
```xml
<configuration>
  <relocations>
      <!-- 包名重命名 -->
      <relocation>
          <!-- 旧包名 -->
          <pattern>org.apache.commons.lang3</pattern>
          <!-- 新包名 -->
          <shadedPattern>shade.org.apache.commons.lang3</shadedPattern>
      </relocation>
  </relocations>
</configuration>
```

## 六、直达包项目代码
```xml
<configuration>
  <shadedArtifactAttached>true</shadedArtifactAttached>
</configuration>
```