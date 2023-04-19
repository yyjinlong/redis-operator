package service

// variables refering to the redis exporter port
const (
	exporterPort                  = 9121
	sentinelExporterPort          = 9355
	predixyExporterPort           = 9617
	exporterPortName              = "http-metrics"
	exporterContainerName         = "redis-exporter"
	sentinelExporterContainerName = "sentinel-exporter"
	predixyExporterContainerName  = "predixy-exporter"
	exporterDefaultRequestCPU     = "25m"
	exporterDefaultLimitCPU       = "50m"
	exporterDefaultRequestMemory  = "50Mi"
	exporterDefaultLimitMemory    = "100Mi"
)

const (
	baseName               = "rf"
	sentinelName           = "s"
	sentinelRoleName       = "sentinel"
	sentinelConfigFileName = "sentinel.conf"
	redisConfigFileName    = "redis.conf"
	redisName              = "r"
	redisShutdownName      = "r-s"
	redisReadinessName     = "r-readiness"
	redisRoleName          = "redis"
	appLabel               = "redis-failover"
	hostnameTopologyKey    = "kubernetes.io/hostname"
	predixyName            = "p"
	predixyRoleName        = "predixy"
)

const (
	redisRoleLabelKey    = "redisfailovers-role"
	redisRoleLabelMaster = "master"
	redisRoleLabelSlave  = "slave"
)
