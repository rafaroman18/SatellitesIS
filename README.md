# SatellitesIS
## Final Practice of the subject Intelligent Systems
This is the task we have to implement on Matlab:

On a bidimensional _AxB_ there N posible stations which we have to select **M** representant stations of the rest (N>M):S={R1,R2,...,Rm}.

A station Ri of the subset S is representant of another no selected station when the euclid distance is less than than any other member Rj from S. The position of the N stations is static and is set at the beginning of the problem.

We pretend to find the representant station combination which minimize the global euclid distance of this problem.

The data structure we will use is a boolean array of 1x500 with 40 1's and 500 0's where each 1 describe the representant by the index of the array. 

Example:
`array = [1 1 0 1....] This means the station 1, 2 and 4 are representants in this case`

And to make the evaluation functions faster, we will create at the beginning of the program a 500x500 matrix where we will set the euclid distances between each station so we can save time. Also, to make more efficient this matrix, we will only calculate the distances between each pair of points, so it won't be 500x500 distances, there will be **sum(1:(500-1))** distances in each matrix.

We will do this by **Taboo algorithm** and **Genetic Algorithms**.

### **In Genetic Algorithms we will use:**
- Selection by Roulette
- Simple Crossover by Mask
- Mutation by Inverse Mutation
- Replace by Elitism (Modified)

### **Elements of GA:**

- **matPos**: matrix of positions
- **NPob**:number of individuals of each generation
- **MAX_itera**:number of max iterations
- **NSatels**:number of satellites (in this case: 500)
- **NManagers**:number of representants (in this case: 40)
- **FitPob**:evaluation of each individual on this generation
- **Pob**: current generation
- **itera**: current iteration
- **Pmut**: probability of each individual of mutation
- **Padres**: represents the index of the fathers who will cross
- **parejas**: the fathers who will cross
- **distancias**: matrix of euclid distance of each satellite to each other

### **In Taboo Algorithms we will use:**
- Tenure of 4

### **Elements of Taboo Algorithms:**
- **matPos**: matrix of positions
- **best**: best global individual
- **distancias**:matrix of euclid distance of each satellite to each other
- **NPob**:number of individuals of each generation
- **MAX_itera**:number of max iterations
- **NSatels**:number of satellites (in this case: 500)
- **NManagers**:number of representants (in this case: 40)
- **it**: current iteration
- **current**:current individual
- **stucked**: counter of generations where the poblation doesn't improve
- **list_suc**: successors list
- **fitOldBest**: fitness of the last Best inidividual
- **fitBest**: fitness of the current Best
- **TabuList**: Taboo List
