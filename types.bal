// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Represents a property that provided during creation of Redis Cache
#
# + sku - Stock Keeping Unit which provide Pricing information
# + enableNonSslPort - Whether non SSL port Enabled/Not
# + shardCount - No of Shards
# + replicasPerMaster - No of Replicas
# + redisConfiguration - Configuration of Redis Instance
# + subnetId - Full url of Subnet id 
# + staticIP - Static IP address used to connect
# + minimumTlsVersion - Minimum of TlsVersion to be supported
# + publicNetworkAccess - Whether public access is Enabled/Not
# + tenantSettings - Dictionary of tenantSettings
public type CreateCacheProperty record {
    StockKeepingUnit sku;
    boolean enableNonSslPort?;
    int replicasPerMaster?;
    json redisConfiguration?;
    int shardCount?;
    string subnetId?;
    string staticIP?;
    string minimumTlsVersion?;
    string publicNetworkAccess?;
    json tenantSettings?;
};

# Represents a pricing tier information of Redis Cache
#
# + name - Name of Stock Keeping Unit(Basic/Standard/Premium)
# + family - Group of Stock Keeping Unit
# + capacity - Size of Cache instance to be deployed
public type StockKeepingUnit record {
    string name;
    string family;
    int capacity;
};

# Represents a pricing tier information of Redis Cache
#
# + name - Name of Enterprise Stock Keeping Unit
# + capacity - Size of Redis Enterprise instance to be deployed
public type EnterpriseStockKeepingUnit record {
    string name?;
    int capacity?;
};

# Represents a firewall rule
#
# + id - Firewall rule url
# + name - Name of Redis cache to which firewall rule created
# + type - Type of firewall rule created
# + properties - Properties consist of range of IP addresses allowed
public type FirewallRule record {
    string id?;
    string name?;
    string 'type?;
    FirewallRuleProperty properties?;
};

# Represents a firewall rule property
#
# + startIP - Start IP address of range
# + endIP - End IP address of range
public type FirewallRuleProperty record {
    string startIP;
    string endIP;
};

# Represents a firewall rule list
#
# + value - Array of firewall rule 
public type FirewallRuleList record {
    FirewallRule[] value;
};

public type RedisConfingPolicy record {
    string maxmemory_policy?;
};

# Represents a TlsVersion during creation of Redis Cache
#
# + minimumTlsVersion - minimum of TlsVersion to be supported
public type TlsVersion record {
    string minimumTlsVersion;
};

# Represents a Status code of operations
#
# + code - Http response Status code
# + message - Http response Status message
public type StatusCode record {
    int code;
    string message?;
};

# Represents a Error returned by Azure for operations
public type AzureRedisError distinct error;

# Represents a Error created in connector
public type CustomError distinct error;

# Represents a Redis Cache Instance
#
# + id - Id of Redis Cache Instance
# + location - Azure region Location
# + name - Name of Redis Cache Instance
# + type - Type of Redis Cache Instance
# + tags - Tags
# + properties - properties of Redis Cache Instance
public type RedisCacheInstance record {
    string id;
    string location;
    string name;
    string 'type;
    json tags;
    RedisCacheInstanceProperty properties;
};

# Represents a property of Redis Cache Instance
#
# + provisioningState - State of Redis Cache
# + redisVersion - Version of redis
# + sku - Stock Keeping Unit which provide Pricing information
# + enableNonSslPort - Whether non SSL port Enabled/Not
# + redisConfiguration - Configuration of Redis Instance
# + accessKeys - Full url of Subnet id 
# + hostName - Host name used to connect to redis cache
# + port - Port number used to connect to redis cache
# + sslPort - SSL port used to connect if SSL enabled
# + instances - Instances nodes available
# + publicNetworkAccess - Whether public access is Enabled/Not
# + linkedServers - List of Linked servers
# + privateEndpointConnections - PrivateEndpoint Connections if set
public type RedisCacheInstanceProperty record {
    string provisioningState;
    string redisVersion?;
    StockKeepingUnit sku;
    boolean enableNonSslPort;
    Instance[] instances?;
    string publicNetworkAccess?;
    PrivateEndpointConnection[] privateEndpointConnections?;
    json redisConfiguration?;
    json accessKeys?;
    string hostName;
    int port;
    int sslPort;
    LinkedServer[] linkedServers?;
};

# Represents a List of Redis Cache Instance
#
# + value - Array of Redis Cache Instance
public type RedisCacheInstanceList record {
    RedisCacheInstance[] value;
};

# Represents a Redis instance associated with the cache
#
# + sslPort - SSL port number of the instance 
# + nonSslPort - Non-SSL port number, If NonSslPort is enabled
# + isMaster - Stock Keeping Unit which provide Pricing information
# + shardId - If clustering is enabled, the Shard ID of Redis Instance
# + zone - If the Cache have zones, specifies availability zone where this instance is located
public type Instance record {
    int sslPort?;
    int nonSslPort?;
    boolean isMaster?;
    int shardId?;
    string zone?;
};

# Represents a Linked Server
#
# + id - Id of cache to be Linked Server
# + name - Name of cache to be Linked Server
# + type - Type of Linked cache
# + properties - Properties of Linked Server
public type LinkedServer record {
    string id;
    string name;
    string 'type;
    LinkedServerProperty properties;
};

# Represents a Property of Linked Server
#
# + linkedRedisCacheId - Id of Linked Server
# + linkedRedisCacheLocation - Location of Linked cache
# + provisioningState - State of linked cache
# + serverRole - Whether primary/secondary
public type LinkedServerProperty record {
    string linkedRedisCacheId;
    string linkedRedisCacheLocation;
    string provisioningState;
    string serverRole;
};

# Represents a List of Linked Server
#
# + value - Array of Linked Server
public type LinkedServerList record {
    LinkedServer[] value;
};

# Represents a PatchSchedule
#
# + id - Resource Id of Patch Schedule
# + location - Location where Patch Schedule is to be created
# + name - Patch Schedule Name
# + type - Type of Patch Schedule
# + properties - Properties of Patch Schedule such as day and time window
public type PatchSchedule record {
    string id;
    string location;
    string name;
    string 'type;
    PatchScheduleProperty properties;
};

# Represents a Array of ScheduleEntry
#
# + scheduleEntries - Array of ScheduleEntry
public type PatchScheduleProperty record {
    ScheduleEntry[] scheduleEntries?;
};

# Represents a PatchSchedule
#
# + dayOfWeek - Day of the week when a cache can be patched
# + startHourUtc - Start hour after which cache patching can start
# + maintenanceWindow - Timespan specifying how much time cache patching can take
public type ScheduleEntry record {
    string dayOfWeek;
    int startHourUtc;
    string maintenanceWindow?;
};

# Represents a List of PatchSchedule
#
# + value - Array of PatchSchedule
public type PatchScheduleList record {
    PatchSchedule[] value;
};

# Represents a Set of Keys used for access
#
# + primaryKey - Key used to make connection to redis cache
# + secondaryKey - Secondary for primary key
public type AccessKey record {
    string primaryKey;
    string secondaryKey;
};

# Represents a Private Endpoint Connection
#
# + id - Id of Private Endpoint Connection
# + name - Name of Private Endpoint Connection
# + type - Type of the Private Endpoint Connection "Microsoft.Cache/Redis/privateEndpointConnections"
# + properties - Properties of Private Endpoint Connection
public type PrivateEndpointConnection record {
    string id;
    string name;
    string 'type;
    PrivateEndpointConnectionProperty properties;
};

# Represents a Private Endpoint Connection property
#
# + privateEndpoint - Identifier for Private Endpoint
# + privateLinkServiceConnectionState - name of Private Endpoint Connection
public type PrivateEndpointConnectionProperty record {
    PrivateEndpoint privateEndpoint?;
    PrivateLinkServiceConnectionState privateLinkServiceConnectionState?;
};

# Represents a Private Endpoint
#
# + id - Resource identifier for Private Endpoint
public type PrivateEndpoint record {
    string id?;
};

# Represents information about the state of the connection between service consumer and provider.
#
# + status - Indicates that changes on the service provider require any updates
# + description - Reason for approval/rejection of the connection
# + actionRequired -  Approved/Rejected/Removed by the owner of the service
public type PrivateLinkServiceConnectionState record {
    string status?;
    string description?;
    string actionRequired?;
};

# Represents a Private Link Resource
# 
# + id - Resource ID of a Private Link Resource
# + name - Name of Private Endpoint Connection
# + type - Resource type
# + properties - Properties of Private Link Resource
public type PrivateLinkResource record {
    string id;
    string name;
    string 'type;
    json properties;
};

# Represents list of Private Endpoint Connections
#
# + value - array of Private Endpoint Connections
public type PrivateEndpointConnectionList record {
    PrivateEndpointConnection[] value;
};
