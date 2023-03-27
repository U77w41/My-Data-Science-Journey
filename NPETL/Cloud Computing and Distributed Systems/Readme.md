
# Course layout
### Week 1: Introduction to Clouds, Virtualization and Virtual Machine
1.	Introduction to Cloud Computing: Why Clouds, What is a Cloud,Whats new in todays Clouds, Cloud computing vs. Distributed computing, Utility computing, Features of today’s Clouds: Massive scale,  AAS Classification: HaaS, IaaS, PaaS, SaaS, Data-intensive Computing, New Cloud Paradigms, Categories of Clouds: Private clouds, Public clouds
2.	Virtualization: What’s virtualization, Benefits of Virtualization, Virtualization Models: Bare metal, Hosted hypervisor
3.	Types of Virtualization: Processor virtualization, Memory virtualization, Full virtualization, Para virtualization, Device virtualization
4.	Hotspot Mitigation for Virtual Machine Migration: Enterprise Data Centers, Data Center Workloads, Provisioning methods, Sandipiper Architecture, Resource provisioning, Black-box approach, Gray-box approach, Live VM Migration Stages, Hotspot Mitigation


### Week 2: Network Virtualization and Geo-distributed Clouds
1.	Server Virtualization: Methods of virtualization: Using Docker,Using Linux containers, Approaches for Networking of VMs: Hardware approach: Single-root I/O virtualization (SR-IOV), Software approach: Open vSwitch, Mininet and its applications
2.	Software Defined Network: Key ideas of SDN, Evolution of SDN,SDN challenges, Multi-tenant Data Centers: The challenges, Network virtualization, Case Study: VL2, NVP
3.	Geo-distributed Cloud Data Centers: Inter-Data Center Networking, Data center interconnection techniques: MPLS, Google’s B4 and  Microsoft’s Swan

### Week 3: Leader Election in Cloud, Distributed Systems and Industry Systems
1.	Leader Election in Rings (Classical Distributed Algorithms): LeLann-Chang-Roberts (LCR) algorithm, The Hirschberg and Sinclair (HS) algorithm
2.	Leader Election (Ring LE & Bully LE Algorithm): Leader Election Problem, Ring based leader election, Bully based leader election, Leader Election in Industry Systems: Google’s Chubby and  Apache Zookeeper
3.	Design of Zookeeper: Race condition, Deadlock, Coordination, Zookeeper design goals, Data model, Zookeeper architecture, Sessions, States, Usecases, Operations, Access Control List (ACL), Zookeeper applications: Katta, Yahoo! Message Broker

### Week 4: Classical Distributed Algorithms and the Industry Systems
1.	Time and Clock Synchronization in Cloud Data Centers: Synchronization in the cloud, Key challenges, Clock Skew, Clock Drift, External and Internal clock synchronization, Christians algorithm, Error bounds, Network time protocol (NTP), Berkley’s algorithm, Datacenter time protocol (DTP), Logical (or Lamport) ordering, Lamport timestamps, Vector timestamps
2.	Global State and Snapshot Recording Algorithms: Global state, Issues in Recording a Global State, Model of Communication, Snapshot algorithm: Chandy-Lamport Algorithm
3.	Distributed Mutual Exclusion: Mutual Exclusion in Cloud, Central algorithm, Ring-based Mutual Exclusion, Lamport’s algorithm, Ricart-Agrawala’s algorithm, Quorum-based Mutual Exclusion, Maekawa’s algorithm, Problem of Deadlocks, Handling Deadlocks, Industry Mutual Exclusion : Chubby

### Week 5: Consensus, Paxos and Recovery in Clouds
1.	Consensus in Cloud Computing and Paxos: Issues in consensus, Consensus in synchronous and asynchronous system, Paxos Algorithm
2.	Byzantine Agreement: Agreement, Faults, Tolerance, Measuring Reliability and Performance, SLIs, SLOs, SLAs, TLAs, Byzantine failure, Byzantine Generals Problem, Lamport-Shostak-Pease Algorithm, Fischer-Lynch-Paterson (FLP) Impossibility 
3.	Failures & Recovery Approaches in Distributed Systems: Local checkpoint, Consistent states, Interaction with outside world, Messages, Domino effect, Problem of Livelock,  Rollback recovery schemes, Checkpointing and Recovery Algorithms: Koo-Toueg Coordinated Checkpointing Algorithm

### Week 6: Cloud Storage: Key-value stores/NoSQL 
1.	Design of Key-Value Stores: Key-value Abstraction, Key-value/NoSQL Data Model, Design of Apache Cassandra, Data Placement Strategies, Snitches, Writes, Bloom Filter, Compaction, Deletes, Read, Membership, CAP Theorem, Eventual Consistency, Consistency levels in Cassandra, Consistency Solutions
2.	Design of HBase: What is HBase, HBase Architecture, Components, Data model, Storage Hierarchy, Cross-Datacenter Replication, Auto Sharding and Distribution, Bloom Filter, Fold, Store, and Shift

### Week 7: P2P Systems and their use in Industry Systems
1.	Peer to Peer Systems in Cloud Computing: Napster, Gnutella, FastTrack, BitTorrent, DHT, Chord, Pastry and Kelips.

### Week 8: Cloud Applications: MapReduce, Spark and Apache Kafka
1.	MapReduce: Paradigm, Programming Model, Applications, Scheduling, Fault-Tolerance, Implementation Overview, Examples
2.	Introduction to Spark: Resilient Distributed Datasets (RDDs), RDD Operations, Spark applications: Page Rank Algorithm, GraphX, GraphX API, GraphX working
3.Introduction to Kafka: What is Kafka, Use cases for Kafka, Data model, Architecture, Types of messaging systems, Importance of brokers


## Books and references
### Text Books:
1.	Distributed and Cloud Computing From Parallel Processing to the Internet of Things- Kai Hwang, Jack Dongarra, Geoffrey Fox
2.	Cloud Computing: Principles and Paradigms, Editors: Rajkumar Buyya, James Broberg, Andrzej M. Goscinski, Wile, 2011
3.	Distributed Computing: Principles, Algorithms, and Systems- Ajay D. Kshemkalyani and Mukesh Singhal
4.	Distributed Computing: Fundamentals, Simulations and Advanced Topics-Hagit Attiya and Jennifer Welch

## Reference Book:
1. Distributed Algorithms-Nancy Lynch
2. Cloud Computing Bible, Barrie Sosinsky, Wiley-India, 2010
3. Cloud Computing: Principles, Systems and Applications, Editors: Nikos Antonopoulos, Lee Gillam, Springer, 2012



## Final Exam Number Distribution
| Section       | Number of Questions| Marks     |
| ------------- | ------------- | -------------- |
| Section I     | 20            | 20             |
| Section II    | 15            | 30             |
| Section III   | 25            | 50             |
