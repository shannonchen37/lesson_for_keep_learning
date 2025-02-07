### 问题说明

使用遗传算法求解三元函数z的最大值。
$$
z=f(x,y)=\frac{6.452(x+0.125y)[cos(x)-cos(2y)]^2}{\sqrt{0.8+(x-4.2)^2+2(y-7)^2}}\\
domain: 0\leqslant x \leqslant 10, 0 \leqslant y \leqslant 10
$$

### 流程

1、构造初始种群

2、计算初始种群的每个个体的值

3、轮盘选择法进行交叉，生成子代个体

4、变异

5、如果未到终止条件，则回到步骤1

6、终止，选出最佳个体的编码

### 构造初始种群

#### 如何对数据进行编码

我们需要注意到x,y本来应该是个连续值，但是计算机表示数据都是离散的（都是0，1嘛，总有数字表示不到）。那么应该如何表示呢。针对这道题，我是这样做的：

我们先想一下，15位的二进制能表示多少个值？
$$
2^{15}=32768
$$
假设，我们把(-1,1)**等分**为32768份，第一份是-1（0000 0000 000 15个0，也就是十进制0），第二份是-0.99993896484375（0000 0000 001 十进制1）...，那这样不就能表示一部分小数了？（当然了，位数越大能表示的数字越多）。

写成函数就是：
$$
result=(x_{十进制}-16384)/16384
$$
写成代码就是：

```python
# 函数功能：将一个30位的编码转换为x,y的十进制解
def decode(onePerson,length=40):
    # onePerson是一个30位的二进制，前15位代表x，后15位代表y
    x = onePerson[0:15]
    y = onePerson[15:30]
    # 将x，y转换为十进制
    x = int(x, 2)
    y = int(y, 2)
    # print(x,y)
    x = (x - 16384) / 16384
    y = (y - 16384) / 16384

    return x,y
```

#### 生成指定个数的个体

直接上代码：

```python
# 功能：生成初始化种群
# 参数：personNum为种群数量，length为种群每个个体编码的位数
def initialPopulation(personNum=50,length=30):
    totalPopulation=[]
    while len(totalPopulation)!=personNum:
        person=[]
        for i in range(30):
            temp = random.uniform(-1, 1)  # 生成-1<=X<=1的数字
            if temp<0:
                person.append(0)
            else:
                person.append(1)
       
    	# 将person由List转换为字符串
        theStr = ''
        for item in person:
            theStr += str(item)
        #print(theStr)
        if theStr not in totalPopulation:
            if evaluate(theStr)>0:
                totalPopulation.append(theStr)
        #print(len(totalPopulation))
    return totalPopulation
```

以上就是如何生成初始种群。需要注意的是：因为某一个个体的评价函数可以是负值。而后面轮盘选择法要求所有值是正值。因此，我设定在生成初始种群时，如果评价值为负，则重新生成。

### 计算初始种群每个个体的评价值

这个功能就很简单了，把x，y通过decode转为十进制，再利用
$$
z=f(x,y)=\frac{6.452(x+0.125y)[cos(x)-cos(2y)]^2}{\sqrt{0.8+(x-4.2)^2+2(y-7)^2}}
$$
计算出结果就行了

代码：

```python
# 功能：计算x,y对应的函数值
# 参数：一个个体的编码
def evaluate(onePerson):
    x,y=decode(onePerson)
    result=x*math.sin(4*math.pi*x)-y*math.sin(4*math.pi*y+math.pi)+1
    return result
```

### 轮盘选择法，交叉生成子代

#### 轮盘选择

轮盘选择的目的是从种群中选出两个个体。而且要求：表现越优异的个体，被选中的概率越大。那么怎么量化每个个体被选中的概率呢：

我们首先计算出种群中所有的个体的评价值（V1,V2,V3...）的总和：
$$
totalValue= \sum_{i=1}^n V_i
$$
然后我们设Vi被选中的概率为Pi：
$$
P_i=V_i/totalValue
$$
那怎么用代码实现呢？

思路就是我把每个个体的被选中的概率放到一个数组中：[0.2,0.3,0.1,0.4]

那么其逐项累加的和组成的列表就是：[0.2,0.5(0.2+0.3),0.6(0.2+0.3+0.1),1(0.2+0.3+0.1+0.4)]

接着，我们随机生成一个[0,1]的数字，如果它在区间[0,0.2]那我们就选择第一个个体，如果它落在(0.2,0.5]之间那我们就选择第二个个体。以此类推。

对应代码：

```python
# 功能：获取一个父母进行交叉
# 输出：返回的是一个双亲在population的index
def getParents(evalList):
    temp = random.uniform(0, 1)
    #print(temp)
    portionList=[];theSum=0
    totalEval=sum(evalList)
    #print(totalEval)
    for eval in evalList:
        theSum+=eval/totalEval
        portionList.append(theSum)
    location=0
    while(temp>portionList[location]):
        location+=1
    #print('location=',location)
    return location
```

#### 交叉生成子代

之前说到，一个子代30位二进制（前15位代表x，后15位代表y），交叉的操作其实就是：在这30位中随机选取一位，比如说选取第8位，那么就把父亲的前8位拿出来放在前面，母亲的后22位拿出来放在后面，拼起来就变成了一个子代。

对应代码：

```python
# 输入：两个person
# 输出：生成的子代person编码
def getCross(father,mother):
    theVisit=[]
    crossLocation=random.randint(0,29)
    theVisit.append(crossLocation)
    #print(crossLocation)
    child=''
    child += father[0:crossLocation]
    child += mother[crossLocation:30]
    while evaluate(child)<0:
        print("重新交叉")
        while crossLocation in theVisit and len(theVisit)<30:
            crossLocation = random.randint(0, 29)
            #print(crossLocation)
            child += father[0:crossLocation]
            child += mother[crossLocation:]
        theVisit.append(crossLocation)
        if len(theVisit)>=30:
            child=father
        #print(len(child))
    return child

```

注意，我这里设置了，如果生成的子代评价值<0,那么则重新生成。如果怎么交叉（30位遍历完了）都小于0，那么就子代直接就是父亲的复制。

### 变异

生成一个子代之后就要进行变异。同样的，我们还要设置一个变异概率，即一个个体有多大的概率进行变异。我们设变异概率Pvaria=0.1，接下来我们生成一个(0,1)之间的随机数temp，如果temp<Pvaria那么子代进行变异。

那么变异具体是个怎样的操作呢：30位中间随机抽一位，把这一位的二进制取反即可（1变成0，0变成1）。

具体代码：

```python
# 功能：进行变异,返回一个个体的二进制编码
def getVari(person):
    #print(person)
    temp = random.uniform(0, 1)
    if temp<mutationProbability:
        #print('变异')
        location=random.randint(0,29)
        #print(location)
        tempStr=person[0:location]
        tempStr+=str(1-int(person[location]))
        tempStr+=person[location+1:]
        if evaluate(tempStr)>evaluate(person):
            return tempStr
    return person
```

注意，我们这里还特别设定了，如果变异后的个体评价值没有原个体好，那么返回的还是原个体的二进制编码。

### 收敛性

这里，由于问题空间比较大，每次收敛到一个完全相同的个体可能性很小。因此我从最优解的近似程度上来看：

我测试了20次

### 结果

函数最大值：4.097047848003166